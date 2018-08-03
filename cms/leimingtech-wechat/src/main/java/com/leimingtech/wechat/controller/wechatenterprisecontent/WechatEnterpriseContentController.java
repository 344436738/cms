package com.leimingtech.wechat.controller.wechatenterprisecontent;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

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
import com.leimingtech.wechat.entity.wechatenterprisecontent.WechatEnterpriseContentEntity;
import com.leimingtech.wechat.service.wechatenterprisecontent.WechatEnterpriseContentServiceI;

/**   
 * @Title: Controller
 * @Description: 企业号推送内容
 * @author 
 * @date 2017-03-28 08:49:36
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/wechatEnterpriseContentController")
public class WechatEnterpriseContentController extends BaseController {

	private String message;
	/** 企业号推送内容接口 */
	@Autowired
	private WechatEnterpriseContentServiceI wechatEnterpriseContentService;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;
	
	/**
	 * 企业号推送内容列表
	 * 
	 * @param request
	 */
	@RequestMapping(params = "wechatEnterpriseContent")
	public ModelAndView wechatEnterpriseContent(HttpServletRequest request) {
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));
		String enterpriseCorpId = request.getParameter("id");
		Map<String, Object> m = wechatEnterpriseContentService.getPageList( enterpriseCorpId,
				pageSize, pageNo);
		m.put("pageNo", pageNo);
		m.put("pageSize", pageSize);
		m.put("enterpriseCorpId",enterpriseCorpId);
		m.put("actionUrl", "wechatEnterpriseContentController.do?wechatEnterpriseContent");
		return new ModelAndView("wechat/wechatenterprisecontent/wechatEnterpriseContentList", m);
	}

	/**
	 * 企业号推送内容添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseContentList", new ArrayList<WechatEnterpriseContentEntity>());
		return new ModelAndView("wechat/wechatenterprisecontent/wechatEnterpriseContent", m);
	}
	
	/**
	 * 企业号推送内容更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		WechatEnterpriseContentEntity wechatEnterpriseContent = wechatEnterpriseContentService.getEntity(java.lang.String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseContent", wechatEnterpriseContent);
		m.put("enterpriseContentId",id);
		return new ModelAndView("wechat/wechatenterprisecontent/wechatEnterpriseContent", m);
	}

	/**
	 * 企业号推送内容保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String save(WechatEnterpriseContentEntity wechatEnterpriseContent, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		boolean isSuccess = true;
		String contentId[]=request.getParameterValues("id");
		String contentIds[]= request.getParameterValues("contentId");  //导入的模板id
		String title[] =request.getParameterValues("title");//标题
		String configId =request.getParameter("configId");
		String enterpriseContentId = request.getParameter("enterpriseContentId");
		String author[]=request.getParameterValues("author");//作者
		String articles[]=request.getParameterValues("articles");//内容
		String description[]=request.getParameterValues("description");//描述
		String url[]=request.getParameterValues("url");//内容地址
		String picurl[]=request.getParameterValues("picurl");//图片
		if(StringUtils.isNotEmpty(configId)){
			if(StringUtils.isNotEmpty(enterpriseContentId)){

			}else {

			}

		}

		j.accumulate("isSuccess", isSuccess);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatEnterpriseConfigController.do?wechatEnterpriseConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 企业号推送内容删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		String conFig = request.getParameter("conFig");
		WechatEnterpriseContentEntity wechatEnterpriseContent = wechatEnterpriseContentService.getEntity(java.lang.String.valueOf(id));
		message = "企业号推送内容【" + wechatEnterpriseContent.getId() + "】删除成功";
		wechatEnterpriseContentService.delete(wechatEnterpriseContent);
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatEnterpriseContentController.do?wechatEnterpriseContent");
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
