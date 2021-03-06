package com.leimingtech.platform.controller;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.base.entity.temp.PfConfigEntity;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.platform.service.PfConfigServiceI;

/**   
 * @Title: Controller
 * @Description: 配置项
 * @author 
 * @date 2014-05-15 13:27:30
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/pfConfigController")
public class PfConfigController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PfConfigController.class);

	@Autowired
	private PfConfigServiceI pfConfigService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 配置项列表页ftl
	 * 
	 * @param request
	 * @param response
	 * @param map
	 * @param pageList
	 */
	@RequestMapping(params = "table")
	public ModelAndView table(PfConfigEntity pfConfig, HttpServletRequest request) {
		//获取配置项列表
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));
		
		CriteriaQuery cq = new CriteriaQuery(PfConfigEntity.class, pageSize, pageNo, "", "");
		//查询条件组装器
		Map param = request.getParameterMap();
		HqlGenerateUtil.installHql(cq, pfConfig, param);
		//排序条件
		cq.addOrder("createdtime",SortDirection.desc);
		cq.add();
		
		PageList pageList = this.pfConfigService.getPageList(cq, true);
		List<PfConfigEntity> testList = pageList.getResultList();
		
		int pageCount = (int)Math.ceil((double)pageList.getCount() / (double)pageSize);
		if(pageCount <= 0){
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchMap", param);
		m.put("pageList", testList);
		m.put("pageNo", pageList.getCurPageNO());
		m.put("pageSize", pageSize);
		m.put("pageCount", pageCount);
		m.put("actionUrl", "pfConfigController.do?table");
		return new ModelAndView("platform/pfconfig/pfConfigList", m);
	}

	/**
	 * 配置项添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "addPageModel")
	public ModelAndView addPageModel(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("page", new PfConfigEntity());
		return new ModelAndView("platform/pfconfig/pfConfig", m);
	}
	
	/**
	 * 配置项更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "updatePageModel")
	public ModelAndView updatePageModel(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		PfConfigEntity pfConfig = pfConfigService.getEntity(PfConfigEntity.class, String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("page", pfConfig);
		return new ModelAndView("platform/pfconfig/pfConfig", m);
	}

	/**
	 * 配置项保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String saveOrUpdate(PfConfigEntity pfConfig, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		if (StringUtils.isNotEmpty(pfConfig.getId())) {
			message = "配置项["+pfConfig.getId()+"]更新成功";
			PfConfigEntity t = pfConfigService.get(PfConfigEntity.class, pfConfig.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(pfConfig, t);
				pfConfigService.saveOrUpdate(t);
				systemService.refleshPfConfig();//更新缓存
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				message = "配置项["+pfConfig.getId()+"]更新失败";
			}
		} else {
			message = "配置项["+pfConfig.getId()+"]添加成功";
			pfConfig.setCreatedtime(new Date());//创建时间
			pfConfigService.save(pfConfig);
			systemService.refleshPfConfig();//更新缓存
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "pfConfigController.do?table");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 配置项删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		PfConfigEntity pfConfig = pfConfigService.getEntity(PfConfigEntity.class, String.valueOf(id));
		message = "配置项["+pfConfig.getId()+"]删除成功";
		pfConfigService.delete(pfConfig);
		systemService.refleshPfConfig();//更新缓存
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
		
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "pfConfigController.do?table");
		String str = j.toString();
		return str;
	}
}
