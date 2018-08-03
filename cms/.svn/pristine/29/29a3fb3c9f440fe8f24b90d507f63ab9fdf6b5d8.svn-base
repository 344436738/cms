package com.leimingtech.core.service;

import com.leimingtech.base.entity.temp.TSRole;
import net.sf.json.JSONArray;

import java.util.List;


/**
 * 角色管理接口
 * 
 * @author liuzhen 2015年8月28日 12:01:26
 * 
 */
public interface RoleServiceI {

	/**
	 * 通过id获取角色
	 *
	 * @param roleId
	 * @return
	 */
	TSRole getEntity(String roleId);

	/**
	 * 通过用户id获取角色id数组
	 *
	 * @param userId
	 *            用户id
	 * @return
	 */
	String[] getRoleIdArrayByUserId(String userId);

	/**
	 * 删除角色
	 *
	 * @param roleId
	 */
	int delete(String roleId);

	/**
	 * 保存角色用户关联
	 * @param roleId
	 * @param userId
	 * @return
	 */
	boolean saveRoleUser(String roleId, String userId);
}
