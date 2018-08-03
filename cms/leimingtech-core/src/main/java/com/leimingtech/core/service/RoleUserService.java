package com.leimingtech.core.service;

import java.util.List;

import com.leimingtech.base.entity.temp.TSRoleFunction;
import com.leimingtech.base.entity.temp.TSRoleUser;


/**
 * 用户角色权限管理接口
 * 
 * @author liuzhen
 * 
 */
public interface RoleUserService {

	/**
	 * 通过用户id获取所有相关用户角色
	 *
	 * @param userid
	 *            用户id
	 * @return
	 */
	List<TSRoleUser> getRoleUserByuserId(String userid);

	/**
	 * 删除菜单权限数据
	 * @param functionId
	 */
	int deleteAllRoleFunctionByFunctionId(String functionId);

	/**
	 * 清空指定角色下的菜单权限
	 * @param roleId 角色id
	 */
	int deleteAllRoleFunctionByRoleId(String roleId);

	/**
	 * 获取指定角色下的所有菜单权限
	 * @param roleId 角色id
	 * @return
	 */
	List<TSRoleFunction> getAllRoleFunctionByRoleId(String roleId);

	/**
	 * 更新指定角色下的菜单权限
	 *
	 * @param roleId      角色id
	 * @param functionIds 当前选中的菜单id集合
	 */
	void updateRoleFunction(String roleId, String[] functionIds);

	/**
	 * 获取指定角色下的所有菜单权限id
	 * @param roleId 角色id
	 * @return
	 */
	List<String> getAllRoleFunctionIdListByRoleId(String roleId);

	/**
	 * 删除指定角色下的所有用户角色
	 *
	 * @param roleId 角色id
	 * @return
	 */
	int deleteAllRoleUserByRoleId(String roleId);

}
