package com.leimingtech.member.controller.member;

import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.ArticleEntity;
import com.leimingtech.base.entity.temp.ContentAccessoryEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.entity.contents.ContentClassify;
import com.leimingtech.cms.entity.contribute.ContentCatVO;
import com.leimingtech.cms.service.ContributeServiceI;
import com.leimingtech.cms.service.accessory.ContentAccessoryServiceI;
import com.leimingtech.cms.service.contribute.ContributeConfigServiceI;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.core.service.*;
import com.leimingtech.core.util.MemberUtils;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 会员中心投搞
 * @author LKANG
 * 2014-08-13 10:55:00
 */
@Controller
@RequestMapping("/member/contributeController")
public class ContributeController extends BaseController {
	@Autowired
	private ContentCatServiceI contentCatService; // 栏目实现类
	@Autowired
	private ArticleServiceI articleService;       // 文章内容实现类
	@Autowired
	private ContentsServiceI contentsService;     // 文章实现类
	
	@Autowired
	private MemberServiceI memberMng;             // 会员实现类
	@Autowired
	private ContributeServiceI contributeServiceImpl;
	
	@Autowired
	private ContributeConfigServiceI contributeConfigService;
	@Autowired
	private MemberServiceI memberService;
	@Autowired
	private MemberDepartServiceI memberDepartService;
	
	@Autowired
	private ContentAccessoryServiceI contentAccessoryService;
	@Autowired
	private SiteServiceI siteServiceI;
	
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	/**
	 * 添加投搞页面
	 * @return
	 */
	@RequestMapping("addContribute")
	public ModelAndView addContribute(HttpServletRequest request) {
		Map<String, Object> m = new HashMap<String, Object>();
		String id = request.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();

		if(StringUtils.isNotEmpty(id)){
			map = contributeServiceImpl.getContentById(String.valueOf(id));
		}
		
		MemberEntity member=memberService.getSessionMember();
		
		String memberId=member.getId();
		
		String[] departs=memberDepartService.getMemberDeparts(memberId);//获取会员所属的部门

		String siteId= MemberUtils.getSiteId();
		SiteEntity siteEntity = new SiteEntity();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}
		List<ContentCatVO> contentcatList=contributeConfigService.getContentCatList(siteId,departs,memberId);//获取用户权限内的投稿栏目
		m.put("contentcatList", contentcatList);
		
		if(!map.isEmpty()){
			List<ContentAccessoryEntity> accessoryList =contentAccessoryService.findByContentId(id);
			m.put("accessoryList", accessoryList);
		}

	
		m.put("contents", map);
		m.put("sitePath", memberMng.getSitePath());
		m.put("site",  siteEntity);
		//m.put("siteId","siteId");
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		return new ModelAndView("addcontribute", m);
	}
	
	
	/**
	 * 加载栏目树
	 * @param request
	 * @return
	 */
	@RequestMapping("contentCatTree")
	@ResponseBody
	public JSONArray contentCatTree(HttpServletRequest request) {
		String catid = request.getParameter("catid");
		JSONArray jsonArray = new JSONArray();
		String[] models = {ContentClassify.CONTENT_ARTICLE_STR};
		jsonArray = contentCatService.getContentCatForJsonArray(models, 1, catid, "1");
		return jsonArray;
	}
	
	/**
	 * 保存投搞
	 * @param
	 * @param request
	 * @return
	 */
	@RequestMapping("saveContribute")
	@ResponseBody
	public String saveContribute(HttpServletRequest request) {

		HttpSession session = com.leimingtech.common.ContextHolderUtils.getSession();
		String randCode = session.getAttribute("randCode").toString();
		String code = request.getParameter("valicode");
		String contentCatId = request.getParameter("contentCatId");
		try {
			if (StringUtils.isNotEmpty(contentCatId)) {
				if (randCode.equalsIgnoreCase(code)) {
					message = "投搞成功";
					Map<String, String> map = requestMap(request);
					contributeServiceImpl.saveContribute(map);
					return success(message).accumulate("toUrl",
							"contentsList").toString();
				} else {
					message = "验证码错误";
					return error(message).toString();
				}

			} else {
				message = "没有选择栏目";
				return error(message).toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "投搞失败";
			return error(message).toString();
		}
	} 
	
	/**
	 * 获取投搞列表
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("contentsList")
	public ModelAndView contentsList(ContentsEntity contens, HttpServletRequest request) {
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
		String pageIndex = request.getParameter("pageIndex");
		if(pageIndex!=null){
			String[] p = pageIndex.split("",2);
			pageIndex = p[0];
		}
		int pageNo = StringUtils.isEmpty(request.getParameter("pageIndex")) ? 1 : Integer.valueOf(pageIndex);
		Map map = request.getParameterMap();
		MemberEntity member = memberMng.getSessionMember();
		
				
		PageList list = contentsService.contentsList(pageSize, pageNo, map, member.getId(), contens);
		List<ContentsEntity> resultList = list.getResultList();
		int pageCount = (int)Math.ceil((double)list.getCount() / (double)pageSize);
		if(pageCount <= 0){
			pageCount = 1;
		}
		String siteId=  MemberUtils.getSiteId();
		SiteEntity siteEntity = new SiteEntity();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchMap", map);
		m.put("pageList", resultList);
		m.put("pageNo", list.getCurPageNO());
		m.put("pageCount", pageCount);
		m.put("pageSize", pageSize);
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		m.put("countNum", list.getCount());
		m.put("searchUrl", "contentsList");
		m.put("sitePath", memberMng.getSitePath());
		m.put("site",  PlatFormUtil.getFrontSessionSite());
		return new ModelAndView("contributelist", m);
	}
	
	/**
	 * 投稿删除
	 * @return
	 */
	@RequestMapping("delContribute")
	@ResponseBody
	public String delContribute(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		try {
			message = "删除成功";
			ArticleEntity article = articleService.getArticleById(id);
			articleService.deleArticle(article);
			contentsService.delContentsById(id);
			j.accumulate("isSuccess", true);
			j.accumulate("msg", message);
			j.accumulate("toUrl", "messageslist");
		} catch (Exception e) {
			e.printStackTrace();
			message = "删除失败";
			j.accumulate("isSuccess", false);
			j.accumulate("msg", message);
			j.accumulate("toUrl", "messageslist");
		}
		String str = j.toString();
		return str;
	}
}



