package com.leimingtech.wechat.controller.wechatenterpriseconfig;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.wechat.util.WechatEnterpriseRequestUtil;
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
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;
import com.leimingtech.wechat.service.wechatenterpriseconfig.WechatEnterpriseConfigServiceI;

/**   
 * @Title: Controller
 * @Description: 微信企业号配置类
 * @author 
 * @date 2017-03-24 11:17:22
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/wechatEnterpriseConfigController")
public class WechatEnterpriseConfigController extends BaseController {

	private String message;
	/** 微信企业号配置类接口 */
	@Autowired
	private WechatEnterpriseConfigServiceI wechatEnterpriseConfigService;
	@Autowired
	private SiteServiceI siteService;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;
	
	/**
	 * 微信企业号配置类列表
	 * 
	 * @param request
	 */
	@RequestMapping(params = "wechatEnterpriseConfig")
	public ModelAndView wechatEnterpriseConfigEntity(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity, HttpServletRequest request) {
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));
		Map param = request.getParameterMap();
		Map<String, Object> m = wechatEnterpriseConfigService.getPageList(wechatEnterpriseConfigEntity, param,
				pageSize, pageNo);
		m.put("searchMap", param);
		m.put("pageNo", pageNo);
		m.put("pageSize", pageSize);
		m.put("actionUrl", "wechatEnterpriseConfigController.do?wechatEnterpriseConfig");
		return new ModelAndView("wechat/wechatenterpriseconfig/wechatEnterpriseConfigList", m);
	}

	/**
	 * 微信企业号配置类添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseConfigEntity", new WechatEnterpriseConfigEntity());
		return new ModelAndView("wechat/wechatenterpriseconfig/wechatEnterpriseConfig", m);
	}
	
	/**
	 * 微信企业号配置类更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity = wechatEnterpriseConfigService.getEntity(java.lang.String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseConfigEntity", wechatEnterpriseConfigEntity);
		return new ModelAndView("wechat/wechatenterpriseconfig/wechatEnterpriseConfig", m);
	}

	/**
	 * 微信企业号配置类保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String save(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		boolean isSuccess = true;
		Date date = new Date();
		if (StringUtils.isNotEmpty(wechatEnterpriseConfigEntity.getId())) {
			message = "微信企业号配置类【" + wechatEnterpriseConfigEntity.getCorpName() + "】更新成功";
			WechatEnterpriseConfigEntity t = wechatEnterpriseConfigService.getEntity(wechatEnterpriseConfigEntity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(wechatEnterpriseConfigEntity, t);
				String accessToken = WechatEnterpriseRequestUtil.getAccessToKen(t.getCorpId(),t.getCorpSecret());
				if(StringUtils.isNotEmpty(accessToken)){
					t.setAccessToken(accessToken);
					t.setAccessTokenTime(String.valueOf(date.getTime()));
					wechatEnterpriseConfigService.saveOrUpdate(t);
					systemService.addLog(message, Globals.Log_Leavel_INFO,
							Globals.Log_Type_UPDATE);
					LogUtil.info(message);
				}else{
					message="获取微信企业号accesstoken失败，请查看企业号标识和密钥";
				}
			} catch (Exception e) {
				e.printStackTrace();
				message = "微信企业号配置类【" + wechatEnterpriseConfigEntity.getCorpName() + "】更新失败";
				LogUtil.error(message, e);
				isSuccess = false;
			}
		} else {
			message = "微信企业号配置类【" + wechatEnterpriseConfigEntity.getCorpName() + "】添加成功";
			String accessToken = WechatEnterpriseRequestUtil.getAccessToKen(wechatEnterpriseConfigEntity.getCorpId(),wechatEnterpriseConfigEntity.getCorpSecret());
			if(StringUtils.isNotEmpty(accessToken)){
				wechatEnterpriseConfigEntity.setAccessToken(accessToken);
				wechatEnterpriseConfigEntity.setAccessTokenTime(String.valueOf(date.getTime()));
				wechatEnterpriseConfigService.save(wechatEnterpriseConfigEntity);
				LogUtil.info(message);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_INSERT);
			}else{
				message="获取微信企业号accesstoken失败，请查看企业号标识和密钥";
			}
		}
		j.accumulate("isSuccess", isSuccess);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatEnterpriseConfigController.do?wechatEnterpriseConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 微信企业号配置类删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity = wechatEnterpriseConfigService.getEntity(java.lang.String.valueOf(id));
		message = "微信企业号配置类【" + wechatEnterpriseConfigEntity.getCorpName() + "】删除成功";
		wechatEnterpriseConfigService.delete(wechatEnterpriseConfigEntity);
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatEnterpriseConfigController.do?wechatEnterpriseConfig");
		String str = j.toString();
		return str;
	}


	/**
	 * 站点绑定企业号管理
	 *
	 * @return
	 */
	@RequestMapping(params = "relevance")
	public ModelAndView relevance(SiteEntity site, HttpServletRequest request){
		// 获取站点管理列表
		int pageSize = com.leimingtech.core.util.StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE : Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = com.leimingtech.core.util.StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));

		Map param = request.getParameterMap();
		Map<String, Object> m = siteService.getPageList(site, param, pageSize, pageNo);
		m.put("searchMap", param);
		m.put("pageNo", pageNo);
		m.put("pageSize", pageSize);
		m.put("Url", "wechatEnterpriseConfigController.do?relevance");
		return new ModelAndView("wechat/wechatenterpriseconfig/relevance", m);
	}

	/**
	 *选择绑定企业号
	 * @return
     */
	/**
	 * 微信企业号配置类更新
	 *
	 * @return
	 */
	@RequestMapping(params = "relevanceEdit")
	public ModelAndView relevanceEdit(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity,HttpServletRequest request){
		String siteId = request.getParameter("siteId");
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));
		Map param = request.getParameterMap();
		Map<String, Object> m = wechatEnterpriseConfigService.getPageList(wechatEnterpriseConfigEntity, param,
				pageSize, pageNo);
		m.put("searchMap", param);
		m.put("pageNo", pageNo);
		m.put("siteId",siteId);
		m.put("pageSize", pageSize);
		m.put("toUrl", "wechatEnterpriseConfigController.do?relevanceEdit");
		return new ModelAndView("wechat/wechatenterpriseconfig/relevanceEdit", m);
	}

	/**
	 * 保存绑定企业号
	 * @param request
	 * @return
     */
	@RequestMapping(params = "saveWechatRelevance")
	@ResponseBody
	public String saveWechatRelevance(HttpServletRequest request) {
		boolean isSuccess = true;
		JSONObject j = new JSONObject();
		String[] configCheck = request.getParameterValues("configCheck");
		String siteId = request.getParameter("siteId");
		wechatEnterpriseConfigService.saveWechatRelevance(configCheck,siteId);
		message="保存成功";
		j.accumulate("msg",message);
		j.accumulate("isSuccess", isSuccess);
		j.accumulate("toUrl", "wechatEnterpriseConfigController.do?relevance");
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_INSERT);
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
