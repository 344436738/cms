package com.leimingtech.cms.controller.contribute;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.core.util.*;
import com.leimingtech.member.entity.member.vo.MemberSimpleVOEntity;
import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.cms.entity.contribute.ContributeConfigEntity;
import com.leimingtech.cms.service.contribute.ContributeConfigServiceI;
import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.depart.DepartServiceI;

/**   
 * @Title: Controller
 * @Description: 投稿配置
 * @author 
 * @date 2016-09-05 09:22:08
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/contributeConfigController")
public class ContributeConfigController extends BaseController {

	private String message;
	/** 投稿配置接口 */
	@Autowired
	private ContributeConfigServiceI contributeConfigService;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;
	
	@Autowired
	private DepartServiceI departService;
	@Autowired
	private MemberServiceI memberService;
	
	/**
	 * 投稿配置列表
	 * 
	 * @param request
	 */
	@RequestMapping(params = "contributeConfig")
	public ModelAndView contributeConfig(ContributeConfigEntity contributeConfig, HttpServletRequest request) {

		String catName=request.getParameter("catName");
		String siteId= UserUtils.getSiteId();
		
		List<ContributeConfigEntity> contributeConfigList = contributeConfigService.getAllList(catName,siteId);//根据栏目名模糊查询，根据站点筛选
		
		Map<String,Object> m=new HashMap<String,Object>();
		
		Map<String,String> departMap=departService.getAllToMap();//获取所有部门信息
		m.put("departMap", departMap);
		
		m.put("contributeConfigList", contributeConfigList);
		
		m.put("catName", catName);
		m.put("actionUrl", "contributeConfigController.do?contributeConfig");
		return new ModelAndView("cms/contribute/contributeConfigList", m);
	}

	/**
	 * 投稿配置添加
	 * 
	 * @return
	 */
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest reqeust){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("contributeConfig", new ContributeConfigEntity());
		return new ModelAndView("cms/contribute/contributeConfig", m);
	}
	
	/**
	 * 投稿配置更新
	 * 
	 * @return
	 */
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(java.lang.String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("contributeConfig", contributeConfig);
		return new ModelAndView("cms/contribute/contributeConfig", m);
	}

	/**
	 * 投稿配置保存
	 * 
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public String save(ContributeConfigEntity contributeConfig, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		boolean isSuccess = true;
		
		if (StringUtils.isNotEmpty(contributeConfig.getId())) {
			message = "投稿配置【" + contributeConfig.getId() + "】更新成功";
			ContributeConfigEntity t = contributeConfigService.getEntity(contributeConfig.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(contributeConfig, t);
				contributeConfigService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_UPDATE);
				LogUtil.info(message);
			} catch (Exception e) {
				e.printStackTrace();
				message = "投稿配置【" + contributeConfig.getId() + "】更新失败";
				LogUtil.error(message, e);
				isSuccess = false;
			}
		} else {
			message = "投稿配置【" + contributeConfig.getId() + "】添加成功";
			contributeConfigService.save(contributeConfig);
			LogUtil.info(message);
			systemService.addLog(message, Globals.Log_Leavel_INFO,
					Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", isSuccess);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "contributeConfigController.do?contributeConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 投稿配置删除
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(java.lang.String.valueOf(id));
		message = "投稿配置【" + contributeConfig.getId() + "】删除成功";
		contributeConfigService.delete(contributeConfig);
		LogUtil.info(message);
		systemService.addLog(message, Globals.Log_Leavel_INFO,
				Globals.Log_Type_DEL);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "contributeConfigController.do?contributeConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 跳转到配置部门界面
	 * @param reqeust
	 * @return
	 */
	@RequestMapping(params = "editDepart")
	public ModelAndView editDepart(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(id);
		
		String departIds=contributeConfig.getDepartIds();
		Set<String> checkeds=new HashSet<String>();
		if(StringUtils.isNotBlank(departIds)){
			String[] departArray=departIds.split(",");
			CollectionUtils.addAll(checkeds, departArray);
		}
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("contributeConfig", contributeConfig);
		m.put("departJson", departService.ztreeJson(checkeds).toString());
		
		return new ModelAndView("cms/contribute/contribute_depart", m);
	}
	
	@RequestMapping(params = "saveDepart")
	@ResponseBody
	public String saveDepart(HttpServletRequest reqeust){
		
		JSONObject j = new JSONObject();
		boolean successFlag=false;
		
		String contributeDepartVal = reqeust.getParameter("contributeDepartVal");
		String id = reqeust.getParameter("id");
		
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(id);
		
		if(contributeConfig!=null){
			if(!StringUtils.equals(contributeConfig.getDepartIds(), contributeDepartVal)){
				contributeConfig.setDepartIds(contributeDepartVal);
				
				contributeConfigService.saveOrUpdate(contributeConfig);
			}
			successFlag=true;
			message = contributeConfig.getCatName()+"栏目投稿配置中部门已修改";
			systemService.addLog(message, Globals.Log_Leavel_INFO,
					Globals.Log_Type_UPDATE);
			LogUtil.info(message);
		}else{
			successFlag=false;
			message = "投稿配置项不存在";
		}
		
		j.accumulate("isSuccess", successFlag);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "contributeConfigController.do?contributeConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 跳转到配置部门界面
	 * @param reqeust
	 * @return
	 */
	@RequestMapping(params = "editMember")
	public ModelAndView editMember(HttpServletRequest reqeust){
		String id = reqeust.getParameter("id");
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(id);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("contributeConfig", contributeConfig);
		
		String memberIds=contributeConfig.getMemberIds();

		if(StringUtils.isNotBlank(memberIds)){
			List<MemberSimpleVOEntity> memberList=memberService.findIdUsernameListByIds(memberIds.split(","));
			m.put("memberList", memberList);
		}
		
		return new ModelAndView("cms/contribute/contribute_member", m);
	}
	
	/**
	 * 会员列表页
	 * @param request
	 * @return
     */
	@RequestMapping(params = "findMemberPage")
	public ModelAndView findMemberPage(MemberEntity member,HttpServletRequest request) {
		//获取请求组类型的ID
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));
		Map param = request.getParameterMap();
		
		String username=oConvertUtils.getString(request.getParameter("username"), "");
		PageList pageList = memberService.getIdUsernamePageList(pageNo, pageSize,username);
		List<MemberEntity> memberList = pageList.getResultList();
		int pageCount = pageList.getPageCount();

		String modelDivId = request.getParameter("modelDivId");

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("pageNo", pageList.getCurPageNO());
		m.put("pageSize", pageSize);
		m.put("pageCount", pageCount);
		m.put("searchMap", param);
		m.put("memberList", memberList);
		m.put("modelDivId", modelDivId);
		m.put("actionUrl",
				"contributeConfigController.do?findMemberPage&modelDivId="
						+ modelDivId);
		return new ModelAndView("cms/contribute/memberSearchPage", m);
	}
	
	/**
	 * 增加用户
	 * @param reqeust
	 * @return
	 */
	@RequestMapping(params = "addMember")
	@ResponseBody
	public String addMember(HttpServletRequest reqeust){
		
		JSONObject j = new JSONObject();
		boolean successFlag=false;
		
		String[] memberIds = reqeust.getParameterValues("memberId");
		String id = reqeust.getParameter("id");
		
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(id);
		
		if(contributeConfig!=null){
			
			successFlag=true;
			message = contributeConfig.getCatName()+"栏目投稿配置中人员已修改";
			if (memberIds != null && memberIds.length > 0) {
				if (StringUtils.isBlank(contributeConfig.getMemberIds())) {
					contributeConfig.setMemberIds(StringUtils.join(memberIds,
							","));
				}else{
					String oldMemberIds=contributeConfig.getMemberIds();
					Set<String> s=new HashSet<String>();
					CollectionUtils.addAll(s, oldMemberIds.split(","));
					CollectionUtils.addAll(s,memberIds);
					contributeConfig.setMemberIds(StringUtils.join(s, ",")+",");
				}
				contributeConfigService.saveOrUpdate(contributeConfig);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_UPDATE);
				LogUtil.info(message);
			}
			
		}else{
			successFlag=false;
			message = "投稿配置项不存在";
		}
		
		j.accumulate("isSuccess", successFlag);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "contributeConfigController.do?contributeConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 删除用户
	 * @param reqeust
	 * @return
	 */
	@RequestMapping(params = "delMember")
	@ResponseBody
	public String delMember(HttpServletRequest reqeust){
		
		JSONObject j = new JSONObject();
		boolean successFlag=false;
		
		String memberId = reqeust.getParameter("memberId");
		String id = reqeust.getParameter("id");
		
		ContributeConfigEntity contributeConfig = contributeConfigService.getEntity(id);
		
		if(contributeConfig!=null){
			
			successFlag=true;
			message = contributeConfig.getCatName()+"栏目投稿配置中人员已修改";
			if (StringUtils.isNotBlank(memberId)) {
				String oldMemberIds = contributeConfig.getMemberIds();
				Set<String> s = new HashSet<String>();
				CollectionUtils.addAll(s, oldMemberIds.split(","));
				s.remove(memberId);
				contributeConfig.setMemberIds(StringUtils.join(s, ","));
				contributeConfigService.saveOrUpdate(contributeConfig);
				systemService.addLog(message, Globals.Log_Leavel_INFO,
						Globals.Log_Type_UPDATE);
				LogUtil.info(message);
			}
			
		}else{
			successFlag=false;
			message = "投稿配置项不存在";
		}
		
		j.accumulate("isSuccess", successFlag);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "contributeConfigController.do?contributeConfig");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 保存排序
	 * 
	 * @return
	 */
	@RequestMapping(params = "saveSort")
	@ResponseBody
	public String saveSort(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String[] ids=request.getParameterValues("id");
		contributeConfigService.updateSort(ids);//重新调整排序
		message="最新排序已保存";
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
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
