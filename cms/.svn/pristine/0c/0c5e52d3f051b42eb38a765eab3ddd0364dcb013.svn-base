package com.leimingtech.cms.controller.contents;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.base.entity.member.MemberEntity;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.core.controller.BaseController;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.depart.DepartServiceI;
import com.leimingtech.core.util.oConvertUtils;

/**
 * 稿件权限管理
 * 
 * @author liuzhen
 * 
 */
@Controller
@RequestMapping("/contentAuthController")
public class ContentAuthController extends BaseController {
	
	@Autowired
	private DepartServiceI departService;
	
	@Autowired
	private MemberServiceI memberService;
	
	/**
	 * 跳转到配置部门界面
	 * 
	 * @param reqeust
	 * @return
	 */
	@RequestMapping(params = "editDepart")
	public ModelAndView editDepart(HttpServletRequest reqeust) {
		String departIds = reqeust.getParameter("id");

		Set<String> checkeds = new HashSet<String>();
		if (StringUtils.isNotBlank(departIds)) {
			String[] departArray = departIds.split(",");
			CollectionUtils.addAll(checkeds, departArray);
		}

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("departJson", departService.ztreeJson(checkeds).toString());

		return new ModelAndView("cms/commons/contentauth/depart", m);
	}


	/**
	 * 会员列表页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "findMemberPage")
	public ModelAndView findMemberPage(MemberEntity member,
			HttpServletRequest request) {
		// 获取请求组类型的ID
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10
				: Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
				: Integer.valueOf(request.getParameter("pageNo"));
		Map param = request.getParameterMap();

		String username = oConvertUtils.getString(
				request.getParameter("username"), "");
		PageList pageList = memberService.getIdUsernamePageList(pageNo,
				pageSize, username);
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
				"contentAuthController.do?findMemberPage&modelDivId="
						+ modelDivId);
		return new ModelAndView("cms/commons/contentauth/memberSearchPage", m);
	}

}
