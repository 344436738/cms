package com.leimingtech.mobile.controller.updateversion;
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
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.mobile.entity.updateversion.UpdateVersionEntity;
import com.leimingtech.mobile.service.updateversion.UpdateVersionServiceI;

/**   
 * @Title: Controller
 * @Description: 版本更新
 * @author 
 * @date 2014-09-01 17:50:24
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/updateVersionController")
public class UpdateVersionController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UpdateVersionController.class);

	@Autowired
	private UpdateVersionServiceI updateVersionService;
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
	 * 版本更新列表页ftl
	 * 
	 * @param request
	 * @param response
	 * @param map
	 * @param pageList
	 */
	@RequestMapping(params = "updateVersion")
	public ModelAndView updateVersion(UpdateVersionEntity updateVersion, HttpServletRequest request) {
		//获取版本更新列表
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));
		
		CriteriaQuery cq = new CriteriaQuery(UpdateVersionEntity.class, pageSize, pageNo, "", "");
		//查询条件组装器
		Map param = request.getParameterMap();
		HqlGenerateUtil.installHql(cq, updateVersion, param);
		//排序条件
		cq.addOrder("createdtime", SortDirection.desc);
		cq.add();
		PageList pageList = this.updateVersionService.getPageList(cq, true);
		List<UpdateVersionEntity> resultList = pageList.getResultList();
		
		int pageCount = (int)Math.ceil((double)pageList.getCount() / (double)pageSize);
		if(pageCount <= 0){
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchMap", param);
		m.put("pageList", resultList);
		m.put("pageNo", pageList.getCurPageNO());
		m.put("pageCount", pageCount);
		m.put("pageSize", pageSize);
		m.put("actionUrl", "updateVersionController.do?updateVersion");
		return new ModelAndView("mobile/updateversion/updateVersionList", m);
	}

	/**
	 * 版本更新添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("updateVersion", new UpdateVersionEntity());
		return new ModelAndView("mobile/updateversion/updateVersion", m);
	}
	
	/**
	 * 版本更新更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "update")
	public ModelAndView update(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		UpdateVersionEntity updateVersion = updateVersionService.getEntity(UpdateVersionEntity.class, id);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("updateVersion", updateVersion);
		return new ModelAndView("mobile/updateversion/updateVersion", m);
	}

	/**
	 * 版本更新保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String saveOrUpdate(UpdateVersionEntity updateVersion, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		if (StringUtils.isNotEmpty(updateVersion.getId())) {
			message = "版本更新["+updateVersion.getAccount()+"]更新成功";
			UpdateVersionEntity t = updateVersionService.get(UpdateVersionEntity.class, updateVersion.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(updateVersion, t);
				updateVersionService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				message = "版本更新["+updateVersion.getAccount()+"]更新失败";
			}
		} else {
			message = "版本更新["+updateVersion.getAccount()+"]添加成功";
			updateVersion.setCreatedtime(new Date());//创建时间
			updateVersionService.save(updateVersion);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "updateVersionController.do?updateVersion");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 版本更新删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		UpdateVersionEntity updateVersion = updateVersionService.getEntity(UpdateVersionEntity.class, id);
		message = "版本更新["+updateVersion.getAccount()+"]删除成功";
		updateVersionService.delete(updateVersion);
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
		
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "updateVersionController.do?updateVersion");
		String str = j.toString();
		return str;
	}
}
