package com.leimingtech.platform.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.base.entity.temp.TSRole;
import com.leimingtech.base.entity.temp.TSRoleFunction;
import com.leimingtech.base.entity.temp.TSRoleUser;
import com.leimingtech.base.entity.vo.ZtreeEntity;
import com.leimingtech.common.Globals;
import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.core.service.RoleServiceI;
import com.leimingtech.core.service.RoleUserService;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.UserService;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.util.ZTreeUtils;
import com.leimingtech.platform.core.common.model.json.ValidForm;
import com.leimingtech.platform.service.function.FunctionServiceI;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 角色处理类
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/roleController")
public class RoleController extends BaseController {

	@Autowired
	private UserService userService;
	/***/
	@Autowired
	private SystemService systemService;
	/**权限管理接口*/
	@Autowired
	private RoleServiceI roleService;

	@Autowired
	private FunctionServiceI functionService;
	@Autowired
	private RoleUserService roleUserService;

	private String message = null;

	/**
	 * 角色列表页面跳转
	 *
	 * @return
	 */
	@RequestMapping(params = "role")
	public ModelAndView role(TSRole role, HttpServletRequest request) {
		// 获取文章列表
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));

		CriteriaQuery cq = new CriteriaQuery(TSRole.class, pageSize, pageNo, "", "");
		// 查询条件组装器
		Map param = request.getParameterMap();
		HqlGenerateUtil.installHql(cq, role, param);

		// 排序条件
		cq.eq("siteId", UserUtils.getSiteId());
		cq.addOrder("createdtime",SortDirection.desc);
		cq.add();
		PageList pageList = this.userService.getPageList(cq, true);
		List<TSRole> roleList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount() / (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchMap", param);
		m.put("roleList", roleList);
		m.put("pageNo", pageList.getCurPageNO());
		m.put("pageSize", pageSize);
		m.put("pageCount", pageCount);
		m.put("actionUrl", "roleController.do?role");
		return new ModelAndView("lmPage/role/roleTab", m);
	}

	/**
	 * 新增角色
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "addPageModel")
	public ModelAndView addPageModel(HttpServletRequest reqeust) {
		TSRole role = new TSRole();
		reqeust.setAttribute("role", role);
		return new ModelAndView("lmPage/role/add_model");
	}

	/**
	 * 修改角色
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "updatePageModel")
	public ModelAndView updatePageModel(HttpServletRequest reqeust) {
		String id = reqeust.getParameter("id");
		TSRole role = userService.getEntity(TSRole.class, id);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("role", role);
		return new ModelAndView("lmPage/role/add", m);
	}

	/**
	 * 删除角色
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest req) {
		JSONObject j = new JSONObject();
		String id = req.getParameter("id");
		TSRole role = roleService.getEntity(id);
			message = "角色【" + role.getRoleName() + "】删除成功";
			roleService.delete(id);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
			j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "roleController.do?role");
		String str = j.toString();
		return str;
	}

	/**
	 * 检查角色
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "checkRole")
	@ResponseBody
	public ValidForm checkRole(TSRole role, HttpServletRequest request, HttpServletResponse response) {
		ValidForm v = new ValidForm();
		String roleCode = com.leimingtech.common.utils.oConvertUtils.getString(request.getParameter("param"));
		String code = com.leimingtech.common.utils.oConvertUtils.getString(request.getParameter("code"));
		List<TSRole> roles = userService.findByProperty(TSRole.class, "roleCode", roleCode);
		if (roles.size() > 0 && !code.equals(roleCode)) {
			v.setInfo("角色编码已存在");
			v.setStatus("n");
		}
		return v;
	}

	/**
	 * 删除角色权限
	 *
	 * @param role
	 */
	protected void delRoleFunction(TSRole role) {
		List<TSRoleFunction> roleFunctions = userService.findByProperty(TSRoleFunction.class, "TSRole.id", role.getId());
		if (roleFunctions.size() > 0) {
			for (TSRoleFunction tsRoleFunction : roleFunctions) {
				userService.delete(tsRoleFunction);
			}
		}
		List<TSRoleUser> roleUsers = userService.findByProperty(TSRoleUser.class, "TSRole.id", role.getId());
		for (TSRoleUser tsRoleUser : roleUsers) {
			userService.delete(tsRoleUser);
		}
	}

	/**
	 * 角色录入
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "saveRole")
	@ResponseBody
	public String saveRole(TSRole role, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		if (com.leimingtech.common.utils.StringUtils.isNotEmpty(role.getId())) {
			message = "角色: [" + role.getRoleName() + "]  被更新成功";
			TSRole t = userService.get(TSRole.class, role.getId());
			try {
				com.leimingtech.common.utils.MyBeanUtils.copyBeanNotNull2Bean(role, t);
				userService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				message = "角色信息更新失败";
			}
		} else {
			message = "角色: [" + role.getRoleName() + "] 被添加成功";
			role.setCreatedtime(new Date());//创建时间
			role.setSiteId(UserUtils.getSiteId());
			userService.save(role);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "roleController.do?role");
		String str = j.toString();
		return str;
	}

	/**
	 * 角色列表页面跳转
	 *
	 * @return
	 */
	@RequestMapping(params = "fun")
	public ModelAndView fun(String roleId) {

		//获取所有菜单数据，返回ztree需要的数据
		List<ZtreeEntity> functionList = functionService.getAllFunctionUseToZTree();

		//获取角色权限下的所有菜单id
		List<String> functionIdList = roleUserService.getAllRoleFunctionIdListByRoleId(roleId);

		JSONArray jsonArray = ZTreeUtils.getSelectedJsonArray(functionList, functionIdList);

		Map<String, Object> m = new HashMap<>();
		m.put("functionJson", jsonArray.toString());
		m.put("roleId", roleId);
		return new ModelAndView("lmPage/role/roleSet",m);
	}

	/**
	 * 保存角色菜单权限
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "saveRoleFunction")
	@ResponseBody
	public String saveRoleFunction(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String roleId = request.getParameter("roleId");
		String funVal = request.getParameter("funVal");

		TSRole role=roleService.getEntity(roleId);

		if(StringUtils.isBlank(funVal)){
			//被清除所有权限，所以为空，这里执行删除角色下所有菜单权限
			roleUserService.deleteAllRoleFunctionByRoleId(roleId);
			message = "角色【" + role.getRoleName() + "】菜单权限已全部清空！";
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			return success(message).accumulate("toUrl", "roleController.do?role").toString();
		}

		String[] funValArray = funVal.split(",");

		roleUserService.updateRoleFunction(roleId,funValArray);

		message = "角色为【"+role.getRoleName()+"】菜单权限更新成功";
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "roleController.do?role");
		String str = j.toString();
		return str;
	}

	/**
	 * 选择用户关联角色
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "settingUserRole")
	public ModelAndView settingRoleUser(HttpServletRequest req){
		String roleId = req.getParameter("roleId");
		String userName = userService.getUserNames(roleId);
		Map<String , Object> m = new HashMap<>();
		m.put("roleId",roleId);
		m.put("userName",userName);
		return new ModelAndView("lmPage/role/settingUserRole",m);
	}


	/**
	 * ztree 角色添加关联用户用户树
	 *
	 * @param request
	 * @return json
	 * @author larry
	 */
	@RequestMapping(params = "settingUserZree")
	@ResponseBody
	public JSONArray loadAddRole(HttpServletRequest request) {
		String roleId = request.getParameter("roleId");
		JSONArray jsonArray = userService.getRoleUserJson(roleId);
		if(jsonArray==null){
			jsonArray = new JSONArray();
		}
		return jsonArray;
	}

	/**
	 * 保存用户权限关联设置
	 * @return
	 */
	@RequestMapping(params = "saveSettingUser")
	@ResponseBody
	public String saveSetting(HttpServletRequest request){
		String roleId = request.getParameter("roleId");
		String userId = request.getParameter("userId");
		JSONObject j = new JSONObject();
		boolean flag = roleService.saveRoleUser(roleId,userId);
		if(flag==true){
			j.accumulate("isSuccess", true);
			message="用户角色关联成功";
		}else{
			j.accumulate("isSuccess", false);
			message="用户角色关联成功";
		}
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "roleController.do?role");
		String str = j.toString();
		return str;
	}

}
