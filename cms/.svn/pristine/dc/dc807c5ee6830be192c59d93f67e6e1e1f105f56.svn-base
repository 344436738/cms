package com.leimingtech.mobile.controller.advertisemen;
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
import com.leimingtech.mobile.entity.advertisemen.AdvertisemenContentEntity;
import com.leimingtech.mobile.service.advertisemen.AdvertisemenContentServiceI;

/**   
 * @Title: Controller
 * @Description: 内容页广告
 * @author 
 * @date 2014-08-20 21:05:57
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/advertisemenContentController")
public class AdvertisemenContentController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AdvertisemenContentController.class);

	@Autowired
	private AdvertisemenContentServiceI advertisemenContentService;
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
	 * 内容页广告列表页ftl
	 * 
	 * @param request
	 * @param response
	 * @param map
	 * @param pageList
	 */
	@RequestMapping(params = "advertisemenContent")
	public ModelAndView advertisemenContent(AdvertisemenContentEntity advertisemenContent, HttpServletRequest request) {
		//获取内容页广告列表
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));
		CriteriaQuery cq = new CriteriaQuery(AdvertisemenContentEntity.class, pageSize, pageNo, "", "");
		//查询条件组装器
		Map param = request.getParameterMap();
		HqlGenerateUtil.installHql(cq, advertisemenContent, param);
		cq.addOrder("createdtime",SortDirection.desc );
		cq.add();
		//排序条件
		PageList pageList = this.advertisemenContentService.getPageList(cq, true);
		List<AdvertisemenContentEntity> resultList = pageList.getResultList();
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
		m.put("actionUrl", "advertisemenContentController.do?advertisemenContent");
		return new ModelAndView("mobile/advertisemen/advertisemenContentList", m);
	}
	/**
	 * 内容页广告添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("advertisemenContent", new AdvertisemenContentEntity());
		return new ModelAndView("mobile/advertisemen/advertisemenContent", m);
	}
	
	/**
	 * 内容页广告更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "update")
	public ModelAndView update(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		AdvertisemenContentEntity advertisemenContent = advertisemenContentService.getEntity(AdvertisemenContentEntity.class, id);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("advertisemenContent", advertisemenContent);
		return new ModelAndView("mobile/advertisemen/advertisemenContent", m);
	}
	/**
	 * 内容页广告保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String saveOrUpdate(AdvertisemenContentEntity advertisemenContent, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		if (StringUtils.isNotEmpty(advertisemenContent.getId())) {
			message = "内容页广告["+advertisemenContent.getConnectUrl()+"]更新成功";
			AdvertisemenContentEntity t = advertisemenContentService.get(AdvertisemenContentEntity.class, advertisemenContent.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(advertisemenContent, t);
				advertisemenContentService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO,Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				message = "内容页广告["+advertisemenContent.getConnectUrl()+"]更新失败";
			}
		} else {
			message = "内容页广告["+advertisemenContent.getConnectUrl()+"]添加成功";
			advertisemenContent.setCreatedtime(new Date());
			advertisemenContentService.save(advertisemenContent);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "advertisemenContentController.do?advertisemenContent");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 内容页广告删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		AdvertisemenContentEntity advertisemenContent = advertisemenContentService.getEntity(AdvertisemenContentEntity.class,id);
		message = "内容页广告["+advertisemenContent.getConnectUrl()+"]删除成功";
		advertisemenContentService.delete(advertisemenContent);
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "advertisemenContentController.do?advertisemenContent");
		String str = j.toString();
		return str;
	}
}
