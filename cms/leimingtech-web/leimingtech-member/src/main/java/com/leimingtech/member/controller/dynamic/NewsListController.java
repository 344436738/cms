package com.leimingtech.member.controller.dynamic;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.temp.TemplateData;
import com.leimingtech.cms.controller.contents.ContentsbaseController;
import com.leimingtech.cms.core.util.FreemarkerUtils;
import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.cms.tag.lmtag.TagMap;
import com.leimingtech.common.Globals;
import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.common.CmsConstants;
import com.leimingtech.core.common.ContentStatus;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.ResourceUtil;
import com.leimingtech.core.util.StringUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.log4j.Logger;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.*;

@Controller
@RequestMapping("/front/newsListController")
public class NewsListController extends ContentsbaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(NewsListController.class);
	@Autowired
	private SystemService systemService;
	private String message;
	@Autowired
	private CommonService commonService;
	@Autowired
	private MemberServiceI memberMng;
	@Autowired
	private IStatic iStatic;


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 新闻列表页模板
	 * 
	 * @throws IOException
	 * @throws TemplateException
	 */

	@RequestMapping(params = "newsList")
	public void newsList(HttpServletRequest request,HttpServletResponse response)
			throws IOException, TemplateException {
		// 新闻列表页模板
		String catId = request.getParameter("catId");
		ContentCatEntity cat = commonService.get(ContentCatEntity.class, catId);
		SiteEntity site = commonService.get(SiteEntity.class,cat.getSiteid());
		Map<String, Object> m = new HashMap<String, Object>();
		String domain = site.getProtocol()+site.getDomain();
		m.put("domain",domain);
		if(site.getIsSwitch().equals("0")){
			response.sendRedirect("http://"+site.getDomain()+cat.getStaticUrl());
			return;
		}else{
			List<String> list = (List<String>) request.getSession().getAttribute("channel");
			if(list!=null && list.size()!=0){
				if(!list.contains(catId)){
					m.put("domain",domain);
					String html = FreemarkerUtils.renderString(m,CmsConstants.getWWWROOT()+"/static","noAuth.html");
					response.setHeader("Content-type", "text/html;charset=UTF-8");
					PrintWriter pw =response.getWriter();
					pw.print(html);
					pw.flush();
					pw.close();
					return;
				}
			}else{
				response.sendRedirect("http://"+site.getDomain());
				return;
			}

			Integer pagesize = cat.getPagesize() == 0 ? 10 : cat.getPagesize();
			int PageIndex = StringUtils.isEmpty(request.getParameter("PageIndex")) ? 1
					: Integer.valueOf(request.getParameter("PageIndex"));

//			List<String> catalogids = new ArrayList<String>();

			CriteriaQuery cq = new CriteriaQuery(ContentsEntity.class);

//			catalogids = getChildidList(catalogids, cat,list);
//			if (catalogids != null && catalogids.size() > 0) {
//				cq.in("catid", toStringArray(catalogids));
				cq.eq("catid", catId);
//			} else {
//				cq.eq("catid", -1 + "");
//
//			}
			cq.eq("siteid", site.getId());

			Date date = new Date();
			cq.or(Restrictions.isNull("noted"), Restrictions.ge("noted", date));

			cq.le("published", date);
			cq.in("constants", new String[] { ContentStatus.CONTENT_COMMITTED,
					ContentStatus.CONTENT_PUBLISHED });
			cq.addOrder("published", SortDirection.desc);
			cq.addOrder("id", SortDirection.desc);
			cq.add();
			List<ContentsEntity> contentList = commonService
					.getListByCriteriaQuery(cq, false);

			Integer pagecount = contentList.size() / pagesize;
			if (contentList.size() % pagesize != 0) {
				pagecount++;
			}

			// 文章
			String templateFilepath = "";
			if (StringUtils.isNotEmpty(cat.getIndexTemplate())) {
				templateFilepath = cat.getIndexTemplate();
			} else {
				templateFilepath = cat.getListModel();
			}
			String fileName[] = templateFilepath.split("\\.");

			String sitePath = site.getSitePath();

			TemplateData t = new TemplateData();
			t.setFirstFileName("newsListController.do?newsList&catId=" + catId);

			t.setPageSize(pagesize);
			t.setPageCount(pagecount);
			t.setTotal(contentList.size());
			t.setPageIndex(PageIndex);
			if (PageIndex == 2) {
				t.setDynamicPreviousPage("newsListController.do?newsList&catId="
						+ catId);
			}
			if (PageIndex > 2) {
				t.setDynamicPreviousPage("newsListController.do?newsList&catId="
						+ catId + "&PageIndex=" + (PageIndex - 1));
			}
			if (PageIndex >= 1 && PageIndex < pagecount) {
				t.setDynamicNextPage("newsListController.do?newsList&catId="
						+ catId + "&PageIndex=" + (PageIndex + 1));

			}
			if (PageIndex == pagecount) {
				t.setDynamicNextPage("newsListController.do?newsList&catId="
						+ catId + "&PageIndex=" + (pagecount));

			}
			t.setDynamicLastPage("newsListController.do?newsList&catId=" + catId
					+ "&PageIndex=" + (pagecount));
			String pagebar = t.getDynamicPageBar(catId);
			m.put("catalogidF", catId);
			m.put("catalogF", cat);
			m.put("sitePath", sitePath);
			m.put("pagebar", pagebar);
			m.put("pageindexF", PageIndex);
			m.put("site",site);
			m.put("frontpath", ResourceUtil.getCMSFrontPath());
			m.put("contextpath", Globals.CONTEXTPATH);
			m.putAll(TagMap.getTagMap());

			iStatic.getFileHtml(site,templateFilepath,m,response);   //访问动态地址
			/*return new ModelAndView("wwwroot/" + sitePath + "/template/"
					+ fileName[0], m);*/
			
		}
	}

	private List<String> getChildidList(List<String> idList,
			ContentCatEntity contentCat, List<String> list) {
		if (contentCat != null&&list.contains(contentCat.getId())) {
			idList.add(contentCat.getId());
			List<ContentCatEntity> contentCatList = commonService
					.findByProperty(ContentCatEntity.class, "contentCat.id",
							contentCat.getId());
			if (contentCatList != null && contentCatList.size() > 0) {
				for (ContentCatEntity contentCatEntity : contentCatList) {
					idList = getChildidList(idList, contentCatEntity,list);
				}
			}
		}
		return idList;
	}

	private String[] toStringArray(List<String> args) {
		if (args != null && args.size() == 0)
			return null;

		String[] intArray = new String[args.size()];
		for (int i = 0; i < args.size(); i++) {
			intArray[i] = args.get(i);
		}
		return intArray;
	}
}
