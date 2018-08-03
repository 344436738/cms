package com.leimingtech.wechat.controller.wechatenterprisetag;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.wechat.service.wechatenterpriseconfig.WechatEnterpriseConfigServiceI;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.core.controller.BaseController;
import com.leimingtech.common.Globals;
import com.leimingtech.core.util.LogUtil;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.wechat.entity.wechatenterprisetag.WechatEnterpriseTagEntity;
import com.leimingtech.wechat.service.wechatenterprisetag.WechatEnterpriseTagServiceI;

/**   
 * @Title: Controller
 * @Description: 微信企业号标签
 * @author 
 * @date 2017-03-24 11:26:02
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/wechatEnterpriseTagController")
public class WechatEnterpriseTagController extends BaseController {

	private String message;
	/** 微信企业号标签接口 */
	@Autowired
	private WechatEnterpriseTagServiceI wechatEnterpriseTagService;
	@Autowired
	private WechatEnterpriseConfigServiceI wechatEnterpriseConfigServiceI;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;
	
	/**
	 * 微信企业号标签列表
	 * 
	 * @param request
	 */
	@RequestMapping(params = "wechatEnterpriseTag")
	public ModelAndView wechatEnterpriseTag(WechatEnterpriseTagEntity wechatEnterpriseTag, HttpServletRequest request) {
		String enterpriseId  = request.getParameter("config");
		Map param = request.getParameterMap();
		Map<String, Object> m = wechatEnterpriseTagService.getPageList(wechatEnterpriseTag, param,enterpriseId);
		m.put("searchMap", param);
		m.put("enterpriseId",enterpriseId);
		m.put("actionUrl", "wechatEnterpriseTagController.do?wechatEnterpriseTag");
		return new ModelAndView("wechat/wechatenterprisetag/wechatEnterpriseTagList", m);
	}

	/**
	 * 微信企业号标签添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseTag", new WechatEnterpriseTagEntity());
		return new ModelAndView("wechat/wechatenterprisetag/wechatEnterpriseTag", m);
	}
	
	/**
	 * 微信企业号标签更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		WechatEnterpriseTagEntity wechatEnterpriseTag = wechatEnterpriseTagService.getEntity(java.lang.String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseTag", wechatEnterpriseTag);
		return new ModelAndView("wechat/wechatenterprisetag/wechatEnterpriseTag", m);
	}

	/**
	 * 微信企业号标签保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String save(WechatEnterpriseTagEntity wechatEnterpriseTag, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		boolean isSuccess = true;
		
		if (StringUtils.isNotEmpty(wechatEnterpriseTag.getId())) {
			message = "微信企业号标签【" + wechatEnterpriseTag.getId() + "】更新成功";
			WechatEnterpriseTagEntity t = wechatEnterpriseTagService.getEntity(wechatEnterpriseTag.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(wechatEnterpriseTag, t);
				wechatEnterpriseTagService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_UPDATE);
				LogUtil.info(message);
			} catch (Exception e) {
				e.printStackTrace();
				message = "微信企业号标签【" + wechatEnterpriseTag.getId() + "】更新失败";
				LogUtil.error(message, e);
				isSuccess = false;
			}
		} else {
			message = "微信企业号标签【" + wechatEnterpriseTag.getId() + "】添加成功";
			wechatEnterpriseTagService.save(wechatEnterpriseTag);
			LogUtil.info(message);
			systemService.addLog(message, Globals.Log_Leavel_INFO,
					Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", isSuccess);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatEnterpriseTagController.do?wechatEnterpriseTag");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 微信企业号标签删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		WechatEnterpriseTagEntity wechatEnterpriseTag = wechatEnterpriseTagService.getEntity(java.lang.String.valueOf(id));
		message = "微信企业号标签【" + wechatEnterpriseTag.getId() + "】删除成功";
		wechatEnterpriseTagService.delete(wechatEnterpriseTag);
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "wechatEnterpriseTagController.do?wechatEnterpriseTag");
		String str = j.toString();
		return str;
	}

	/**
	 * 同步标签
	 * @param request
	 * @return
     */
	@RequestMapping(params = "synchronization")
	@ResponseBody
	public String synchronization(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		//企业号配置id
		String enterpriseId = request.getParameter("enterpriseConfigId");
		if(StringUtils.isNotEmpty(enterpriseId)){
			boolean flag = wechatEnterpriseTagService.getEnterpriseTaglist(enterpriseId);
			//boolean flag = true;
			if(flag){
				message="获取标签列表接口请求成功";
				j.accumulate("isSuccess", true);
				j.accumulate("msg", message);
			}else{
				message="获取标签列表接口请求失败";
				j.accumulate("isSuccess", true);
				j.accumulate("msg", message);
				LogUtil.info(message);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_DEL);
			}
		}
		String str = j.toString();
		return str;
	}

	/**
	 * 推送消息
	 * @param reqeust
	 * @return
     */
	@RequestMapping(params = "pushMessage")
	public ModelAndView pushMessage(HttpServletRequest reqeust){
		String enterpriseId = reqeust.getParameter("id");
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("enterpriseId",enterpriseId);
		return new ModelAndView("wechat/wechatenterprisetag/wechatEnterprisePush", m);
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
