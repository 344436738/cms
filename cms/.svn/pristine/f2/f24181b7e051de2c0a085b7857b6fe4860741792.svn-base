package com.leimingtech.core.service.impl;

import java.util.Date;
import java.util.List;

import com.leimingtech.base.entity.temp.TSRoleFunction;
import com.leimingtech.base.entity.temp.TSRoleUser;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.RoleUserService;

/**
 * 用户角色权限管理接口
 * 
 * @author liuzhen
 * 
 */
@Service("roleUserService")
@Transactional
public class RoleUserServiceImpl implements RoleUserService {

	/** 公共dao接口 */
	@Autowired
	private CommonService commonService;

	@Override
	public List<TSRoleUser> getRoleUserByuserId(String userid) {
		return commonService.findByProperty(TSRoleUser.class, "TSUser.id",
				userid);
	}

	/**
	 * 删除菜单权限数据
	 *
	 * @param functionId
	 */
	@Override
	public int deleteAllRoleFunctionByFunctionId(String functionId) {
		return this.commonService.executeSql(" delete from cms_role_function where functionid = ?  ", functionId);
	}

	/**
	 * 清空指定角色下的菜单权限
	 *
	 * @param roleId 角色id
	 */
	@Override
	public int deleteAllRoleFunctionByRoleId(String roleId) {
		return this.commonService.executeSql(" delete from cms_role_function where roleid = ?  ", roleId);
	}

	/**
	 * 获取指定角色下的所有菜单权限
	 *
	 * @param roleId 角色id
	 * @return
	 */
	@Override
	public List<TSRoleFunction> getAllRoleFunctionByRoleId(String roleId) {
		return this.commonService.findByProperty(TSRoleFunction.class, "roleId", roleId);
	}

	/**
	 * 更新指定角色下的菜单权限
	 *
	 * @param roleId      角色id
	 * @param functionIds 当前选中的菜单id集合
	 */
	@Override
	public void updateRoleFunction(String roleId, String[] functionIds) {

		this.deleteAllRoleFunctionByRoleId(roleId);
		for (int i = 0; i < functionIds.length; i++) {
			String functionId = functionIds[i];
			this.addRoleFunction(roleId, functionId);
		}
	}

	/**
	 * 在指定角色下增加一个菜单权限
	 *
	 * @param roleId     角色id
	 * @param functionId 菜单id
	 * @return
	 */
	private String addRoleFunction(String roleId, String functionId) {
		TSRoleFunction roleFunction = new TSRoleFunction();
		roleFunction.setRoleid(roleId);// 添加角色ID
		roleFunction.setFunctionid(functionId);// 添加菜单ID
		roleFunction.setCreatedtime(new Date());
		this.commonService.save(roleFunction);
		return roleFunction.getId();
	}

	/**
	 * 获取指定角色下的所有菜单权限id
	 *
	 * @param roleId 角色id
	 * @return
	 */
	@Override
	public List<String> getAllRoleFunctionIdListByRoleId(String roleId) {
		CriteriaQuery cq = new CriteriaQuery(TSRoleFunction.class);

		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("functionid").as("functionid"));

		DetachedCriteria dc = cq.getDetachedCriteria();
		dc.setProjection(pList);

		cq.eq("roleid", roleId);
		cq.add();

		List<String> data = this.commonService.getListByCriteriaQuery(cq, false);
		return data;
	}

	/**
	 * 删除指定角色下的所有用户角色
	 *
	 * @param roleId 角色id
	 * @return
	 */
	@Override
	public int deleteAllRoleUserByRoleId(String roleId) {
		return this.commonService.executeSql(" delete from cms_role_user where roleid = ?  ", roleId);
	}
}
