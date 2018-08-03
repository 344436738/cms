package com.leimingtech.core.service.mobilechannelpriv;

import com.leimingtech.core.service.CommonService;
import net.sf.json.JSONArray;

import java.util.List;

public interface MobileChannelPrivServiceI extends CommonService{
	/**
	 * 加载移动栏目权限列表
	 * @param roleId
	 * @return
	 */
	public JSONArray loadMobileChannelTree(String roleId);
	/**
	 * 保存已勾选移动栏目权限
	 * @param roleId
	 * @param funVal
	 */
	public void saveMobileChannelPriv(String roleId, String funVal);

	/**
	 * 删除角色下的全部移动栏目权限
	 *
	 * @param roleId 角色id
	 * @return
	 */
	int deleteByRoleId(String roleId);

	/**
	 * 获取用户下拥有的移动频道数据
	 * @param userId 用户id
	 * @return
	 */
	List<String> getMobileChannelIdListByUserId(String userId);
}
