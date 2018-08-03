package com.leimingtech.core.service.contentcatpriv;

import com.leimingtech.core.service.CommonService;
import net.sf.json.JSONArray;

import java.util.List;

public interface ContentCatPrivServiceI extends CommonService {

	/**
	 * 加载PC栏目权限列表
	 * @param roleId
	 * @return
	 */
	public JSONArray loadContentCatTree(String roleId);

	/**
	 * 保存已勾选PC栏目权限
	 * @param roleId
	 * @param funVal
	 */
	public void saveContentCatPriv(String roleId,String funVal);

	/**
	 * 删除指定角色下的所有PC栏目权限
	 *
	 * @param roleId 角色id
	 * @return
	 */
	int deleteByRoleId(String roleId);

	/**
	 * 获取用户权限内的所有PC栏目数据
	 * @param userId
	 * @return
	 */
	List<String> getContentCatIdListByUserId(String userId);
}
