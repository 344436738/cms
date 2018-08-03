package com.leimingtech.cms.controller.visibletemplate;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.util.json.JsonConfig;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringEscapeUtils;
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
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateModuleServiceI;

/**   
 * @Title: Controller
 * @Description: 可视化模板组件配置
 * @author 
 * @date 2016-09-28 14:24:16
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/visibleTemplateModuleController")
public class VisibleTemplateModuleController extends BaseController {

	private String message;
	/** 可视化模板组件配置接口 */
	@Autowired
	private VisibleTemplateModuleServiceI visibleTemplateModuleService;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;
	
	/**
	 * 可视化模板组件配置列表
	 * 
	 * @param keyword
	 */
	@RequestMapping(params = "visibleTemplateModule")
	public ModelAndView visibleTemplateModule(String keyword) {
		Map<String, Object> m = new HashMap<String, Object>();
		List<VisibleTemplateModuleEntity> moduleList = visibleTemplateModuleService.getAllModule(keyword);
		m.put("keyword", keyword);
		m.put("moduleList",moduleList);
		m.put("actionUrl", "visibleTemplateModuleController.do?visibleTemplateModule");
		return new ModelAndView("cms/visibletemplate/visibleTemplateModuleList", m);
	}

	/**
	 * 可视化模板组件配置添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleTemplateModule", new VisibleTemplateModuleEntity());
		return new ModelAndView("cms/visibletemplate/visibleTemplateModule", m);
	}
	
	/**
	 * 可视化模板组件配置更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		VisibleTemplateModuleEntity visibleTemplateModule = visibleTemplateModuleService.getEntity(java.lang.String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleTemplateModule", visibleTemplateModule);
		return new ModelAndView("cms/visibletemplate/visibleTemplateModule", m);
	}

	/**
	 * 可视化模板组件配置保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String save(VisibleTemplateModuleEntity visibleTemplateModule, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		boolean isSuccess = true;
		
		if(StringUtils.isNotBlank(visibleTemplateModule.getTemplate())){
			visibleTemplateModule.setTemplate(StringEscapeUtils.unescapeHtml(visibleTemplateModule.getTemplate()));
		}
		
		if(StringUtils.isNotBlank(visibleTemplateModule.getControllerCode())){
			visibleTemplateModule.setControllerCode(StringEscapeUtils.unescapeHtml(visibleTemplateModule.getControllerCode()));
		}
		
		if(StringUtils.isNotBlank(visibleTemplateModule.getDemo())){
			visibleTemplateModule.setDemo(StringEscapeUtils.unescapeHtml(visibleTemplateModule.getDemo()));
		}
		
		if (StringUtils.isNotEmpty(visibleTemplateModule.getId())) {
			message = "可视化模板组件配置【" + visibleTemplateModule.getModuleName() + "】更新成功";
			VisibleTemplateModuleEntity t = visibleTemplateModuleService.getEntity(visibleTemplateModule.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(visibleTemplateModule, t);

				Date date=new Date();
				String userId= UserUtils.getUser().getId();
				visibleTemplateModule.setUpdateTime(date);
				visibleTemplateModule.setUpdateBy(userId);
				visibleTemplateModuleService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_UPDATE);
				LogUtil.info(message);
			} catch (Exception e) {
				e.printStackTrace();
				message = "可视化模板组件配置【" + visibleTemplateModule.getModuleName() + "】更新失败";
				LogUtil.error(message, e);
				isSuccess = false;
			}
		} else {
			message = "可视化模板组件配置【" + visibleTemplateModule.getModuleName() + "】添加成功";
			Date date=new Date();
			String userId= UserUtils.getUser().getId();
			visibleTemplateModule.setCreateTime(date);
			visibleTemplateModule.setUpdateTime(date);
			visibleTemplateModule.setCreateBy(userId);
			visibleTemplateModule.setUpdateBy(userId);
			visibleTemplateModuleService.save(visibleTemplateModule);
			LogUtil.info(message);
			systemService.addLog(message, Globals.Log_Leavel_INFO,
					Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", isSuccess);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "visibleTemplateModuleController.do?visibleTemplateModule");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 可视化模板组件配置删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		VisibleTemplateModuleEntity visibleTemplateModule = visibleTemplateModuleService.getEntity(java.lang.String.valueOf(id));
		message = "可视化模板组件配置【" + visibleTemplateModule.getModuleName() + "】删除成功";
		visibleTemplateModuleService.delete(visibleTemplateModule);
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "visibleTemplateModuleController.do?visibleTemplateModule");
		String str = j.toString();
		return str;
	}

	/**
	 * 获取所有模板组件
	 * @return
	 */
	@RequestMapping("/moduleControllerMap")
	@ResponseBody
	public String moduleControllerMap(){

		JSONObject j = new JSONObject();

		Map<String,String> moduleList=visibleTemplateModuleService.getModuleControllerMap();
		j = j.fromObject(moduleList, JsonConfig.getInstance());
		j.accumulate("isSuccess", true).accumulate("msg", "成功");

		return j.toString();
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
