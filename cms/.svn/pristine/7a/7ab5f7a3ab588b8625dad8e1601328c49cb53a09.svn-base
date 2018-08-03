package com.leimingtech.wechat.controller.wechatenterprisepush;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.base.entity.temp.ArticleEntity;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.ArticleServiceI;
import com.leimingtech.core.service.ContentsServiceI;

import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.wechat.entity.wechatcorpsite.WechatCorpSiteEntity;
import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;
import com.leimingtech.wechat.entity.wechatenterprisecontent.WechatEnterpriseContentEntity;
import com.leimingtech.wechat.service.wechatenterpriseconfig.WechatEnterpriseConfigServiceI;
import com.leimingtech.wechat.service.wechatenterprisecontent.WechatEnterpriseContentServiceI;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.core.common.PlatformConstants;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.common.Globals;
import com.leimingtech.core.util.LogUtil;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.wechat.entity.wechatenterprisepush.WechatenterprisePushEntity;
import com.leimingtech.wechat.service.wechatenterprisepush.WechatenterprisePushServiceI;

/**   
 * @Title: Controller
 * @Description: 企业号推送
 * @author 
 * @date 2017-03-28 16:16:57
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/wechatenterprisePushController")
public class WechatenterprisePushController extends BaseController {

	private String message;
	/** 企业号推送接口 */
	@Autowired
	private WechatenterprisePushServiceI wechatenterprisePushService;
	/** 企业号推送nr接口 */
	@Autowired
	private WechatEnterpriseContentServiceI wechatEnterpriseContentServiceI;
	/** 微信企业号配置类接口 */
	@Autowired
	private WechatEnterpriseConfigServiceI wechatEnterpriseConfigService;
	@Autowired
	ContentsServiceI contentsService;
	@Autowired
	ArticleServiceI articleService;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;
	
	/**
	 * 企业号推送列表
	 * 
	 * @param request
	 */
	@RequestMapping(params = "wechatenterprisePush")
	public ModelAndView wechatenterprisePush(WechatenterprisePushEntity wechatenterprisePush, HttpServletRequest request) {
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));
		Map param = request.getParameterMap();
		Map<String, Object> m = wechatenterprisePushService.getPageList(wechatenterprisePush, param,
				pageSize, pageNo);
		m.put("searchMap", param);
		m.put("pageNo", pageNo);
		m.put("pageSize", pageSize);
		m.put("actionUrl", "wechatenterprisePushController.do?wechatenterprisePush");
		return new ModelAndView("wechat/wechatenterprisepush/wechatenterprisePushList", m);
	}

	/**
	 * 企业号推送添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		String contentId = reqeust.getParameter("contentId");
		if(StringUtils.isNotEmpty(contentId)){
			ContentsEntity contentsEntity = contentsService.getEntity(ContentsEntity.class,contentId);
			m.put("content",contentsEntity);
			m.put("enterprisePushId",null);
		}
		return new ModelAndView("wechat/wechatenterprisepush/wechatenterprisePushAdd", m);
	}
	
	/**
	 * 企业号推送更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest reqeust){
		String enterprisePushId = reqeust.getParameter("id");
		Map<String, Object> m = new HashMap<String, Object>();
		List<WechatEnterpriseContentEntity> wechatenterpriseContentList = wechatEnterpriseContentServiceI.enterpriseCotentList(enterprisePushId);
		WechatenterprisePushEntity wechatenterprisePush = wechatenterprisePushService.getEntity(enterprisePushId);
		m.put("wechatenterpriseContentList", wechatenterpriseContentList);
		m.put("enterpriseCorpId",wechatenterprisePush.getEnterpriseConfigId());
		m.put("enterprisePushId",enterprisePushId);
		m.put("wechatenterprisePush",wechatenterprisePush);

		return new ModelAndView("wechat/wechatenterprisepush/wechatenterprisePush", m);
	}

	/**
	 * 企业号推送保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String save(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String contentId[] = request.getParameterValues("id");
		String tagList = request.getParameter("tagList");
		String contentIds[] = request.getParameterValues("contentId");  //导入的模板id
		String title[] = request.getParameterValues("title");//标题
		String enterpriseCorpId = request.getParameter("enterpriseCorpId");
		String enterprisePushId = request.getParameter("enterprisePushId");
		String author[] = request.getParameterValues("author");//作者
		String description[] = request.getParameterValues("description");//描述
		String url[] = request.getParameterValues("url");//内容地址
		String picurl[] = request.getParameterValues("picurl");//图片
		String catId[] = request.getParameterValues("catId");
		if(title!=null && title.length>0){
			if (StringUtils.isNotEmpty(enterpriseCorpId)) {
					String pushid = wechatenterprisePushService.save(contentId,tagList,contentIds,title,enterpriseCorpId,enterprisePushId,author,description,url,picurl,catId);
				if(StringUtils.isNotEmpty(pushid)){
					message="推送信息保存成功";
					j.accumulate("pushId", pushid);
					j.accumulate("isSuccess", true);
					systemService.addLog(message, Globals.Log_Leavel_INFO,
							Globals.Log_Type_UPDATE);
					LogUtil.info(message);
				}
			}else{
				message="请先添加推送配置";
				j.accumulate("isSuccess", false);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_UPDATE);
				LogUtil.info(message);
			}
		}else{
			message="推送内容不能小于一条";
			j.accumulate("isSuccess", false);
			systemService.addLog(message, Globals.Log_Leavel_INFO,
					Globals.Log_Type_UPDATE);
			LogUtil.info(message);
		}
			j.accumulate("msg", message);
			j.accumulate("toUrl", "wechatenterprisePushController.do?wechatenterprisePush");
			String str = j.toString();
			return str;
		}

	
	/**
	 * 企业号推送删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		WechatenterprisePushEntity wechatenterprisePush = wechatenterprisePushService.getEntity(java.lang.String.valueOf(id));
		message = "企业号推送【" + wechatenterprisePush.getId() + "】删除成功";
		wechatenterprisePushService.delete(wechatenterprisePush);
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatenterprisePushController.do?wechatenterprisePush");
		String str = j.toString();
		return str;
	}
	/**
	 * 相关搜索弹出框
	 *
	 * @return
	 * @author zhangxiaoqiang
	 */
	@RequestMapping(params = "correlationDialog")
	public ModelAndView correlationDialog(ContentsEntity contents,
										  String title, String classify1, HttpServletRequest request) {

		// 获取当前毫秒数
		String temporary = request.getParameter("temporary");

		// 获取内容列表
		int pageSize = com.leimingtech.core.util.StringUtils.isEmpty(request.getParameter("pageSize")) ? 10
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = com.leimingtech.core.util.StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));

		CriteriaQuery cq = new CriteriaQuery(ContentsEntity.class, pageSize,
				pageNo, "", "");
		if (!"0".equals(classify1)) {
			cq.eq("classify", classify1);
		}
		cq.eq("constants", "50");
		cq.eq("siteid", UserUtils.getSiteId());
		cq.addOrder("created", SortDirection.desc);
		cq.addOrder("published", SortDirection.desc);
		cq.add();
		// 查询条件组装器
		Map param = request.getParameterMap();
		HqlGenerateUtil.installHql(cq, contents, param);
		// 排序条件
		PageList pageList = this.contentsService.getPageList(cq, true);
		List<ContentsEntity> testList = pageList.getResultList();
		for (ContentsEntity content : testList) {
			ContentCatEntity contentCat = contentsService.get(
					ContentCatEntity.class, content.getCatid());
			if (contentCat != null) {
				content.setCatName(contentCat.getName());
			}
		}
		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("pageList", testList);
		m.put("pageNo", pageList.getCurPageNO());
		m.put("pageSize", pageSize);
		m.put("pageCount", pageCount);
		m.put("temporary", temporary);
		m.put("classify1", classify1);
		m.put("title", title);
		m.put("actionUrl", "wechatenterprisePushController.do?correlationDialog&temporary="
				+ temporary);
		return new ModelAndView("wechat/wechatenterprisepush/toLeadArticleList", m);
	}
	/**
	 * 从相关内容导入
	 *
	 * @return
	 */
	@RequestMapping(params = "correlation")
	@ResponseBody
	public String correlation(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String checked=request.getParameter("checked");
		// 有选中项时
		List<ContentsEntity> contentsList = new ArrayList<ContentsEntity>();
		String[] checkArray = checked.split(",");
		for (int i = 0; i < checkArray.length; i++) {
			if (checkArray[i] != "") {
				ContentsEntity content = contentsService.get(ContentsEntity.class,String.valueOf(checkArray[i]));
				ArticleEntity article = articleService.getArticleById(content.getId());
				String domain = PlatFormUtil.getCurrentSitedomain(); //获取站点域名

				ContentsEntity contents = new ContentsEntity();
				contents.setTitle(content.getTitle());//标题
				contents.setAuthor(content.getAuthor());//作者
				contents.setDigest(content.getDigest()); //摘要
				contents.setThumb(content.getThumb());  //缩略图
				contents.setCatid(content.getCatid());//栏目id
				contents.setId(content.getId());  //缩略图
				contents.setUrl(content.getUrl());
				if(com.leimingtech.core.util.StringUtils.isNotEmpty(article.getId())){
					String atrile = StringEscapeUtils.unescapeHtml4("<!doctype html><html><head><meta charset=\"utf-8\"><base href=\""+domain+"\" /></head><body>"+article.getContent().trim()+"</body></html>");
					contents.setAtriles(atrile);
				}
				contentsList.add(contents);
			}
		}
		j.accumulate("contentsList", contentsList);
		j.accumulate("isSuccess", true);
		String str = j.toString();
		return str;
	}

	/**
	 * wechat推送
	 *
	 * @return
	 */
	@RequestMapping(params = "weChatPush")
	@ResponseBody
	public String weChatPush(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String pushId = request.getParameter("id");
		boolean flag = wechatenterprisePushService.pushContents(pushId);
		if(flag){
			j.accumulate("isSuccess", true);
			message="推送成功";
		}else {
			j.accumulate("isSuccess", false);
			message="推送失败,请检查配置";
		}
		j.accumulate("msg",message);
		String str = j.toString();
		return str;
	}

	/**
	 * 微信推送添加配置项
	 *
	 * @return
	 */
	@RequestMapping(params = "weChatPushPreview")
	public ModelAndView weChatPushPreview(HttpServletRequest request) {
		String enterpriseConfigId = request.getParameter("enterpriseConfigId");
		String enterprisePushId = request.getParameter("pushId");
		String siteId = UserUtils.getSiteId();
		List<WechatCorpSiteEntity> wechatCorpSiteEntityList = wechatEnterpriseConfigService.getConfigList(siteId);
		Map<String, Object> m = new HashMap<String, Object>();
		if(StringUtils.isNotEmpty(enterprisePushId)){
			WechatenterprisePushEntity wechatenterprisePush = wechatenterprisePushService.getEntity(enterprisePushId);
			m.put("wechatenterprisePush",wechatenterprisePush);
		}else{
			m.put("wechatenterprisePush",new WechatenterprisePushEntity());
		}
		m.put("wechatCorpSiteEntityList",wechatCorpSiteEntityList);
		m.put("enterpriseConfigId",enterpriseConfigId);
		return  new ModelAndView("wechat/wechatenterprisepush/weChatPushPreview", m);
	}


	/**
	 * 保存推送配置项
	 *
	 * @return
	 */
	@RequestMapping(params = "savePushConfig")
	@ResponseBody
	public String savePushConfig(HttpServletRequest request) {
		JSONObject j = new JSONObject();

		String enterpriseConfigId = request.getParameter("enterpriseConfig");
		if(StringUtils.isNotEmpty(enterpriseConfigId)){
			WechatEnterpriseConfigEntity wechatEnterpriseConfig = wechatEnterpriseConfigService.getEntity(enterpriseConfigId);
			if(wechatEnterpriseConfig!=null){
				j.accumulate("isSuccess", true);
				message="操作成功";
			}else {
				message="操作失败，要发布的配置未找到";
				j.accumulate("isSuccess", false);
			}
		}else{
			message="操作失败";
			j.accumulate("isSuccess", false);
		}


		j.accumulate("msg",message);
		String str = j.toString();
		return str;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
