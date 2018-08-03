package com.leimingtech.core.service;

import java.util.List;
import java.util.Map;

import com.leimingtech.base.entity.temp.TSRole;
import  com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.base.entity.vo.UserVO;
import net.sf.json.JSONArray;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.TSDepart;
import com.leimingtech.base.entity.temp.TSUser;


/**
 * 用户管理接口
 * 
 * @author
 * 
 */
public interface UserService extends CommonService {

	public TSUser checkUserExits(TSUser user);

	/**
	 * 获取用户的角色列表
	 * @param userId 用户id
	 * @return
	 */
	List<TSRole> getUserRole(String userId);

	public void pwdInit(TSUser user, String newPwd);

	/**
	 * 判断这个角色是不是还有用户使用
	 *
	 * @Author JueYue
	 * @date 2013-11-12
	 * @param id
	 * @return
	 */
	public int getUsersOfThisRole(String id);

	public Map mapByRoleId();

	/**
	 * 加载部门
	 *
	 * @return
	 */
	public JSONArray departQuery(String userId);

	/**
	 * 部门子节点
	 *
	 * @param depart
	 * @return
	 */
	public JSONArray getDepartChildren(TSDepart depart, TSUser user);

	/**
	 * 获取用户真实姓名，真实姓名为空则返回用户名
	 * @param userId
	 * @return
	 */
	String getRealName(String userId);

	/**
	 * 获取用户所有的角色id
	 * @param userId 用户id
	 * @return
	 */
	List<String> getRoleIdListByUserId(String userId);

	/**
	 * 获取用户所有权限菜单
	 * @param userId
	 * @return
	 */
	List<FunctionVOShow> getUserFunctionListByUserId(String userId);

	/**
	 * 根据用户名获取用户基本信息（id、用户名、昵称、密码）
	 * @param username 用户名
	 * @return
	 */
	UserVO getUserInfoByUsername(String username);

	/**
	 * 根据当前菜单id获取用户权限内的所有子集菜单
	 *
	 * @param userId 用户id
	 * @param functionId 菜单id
	 * @return
	 */
	List<FunctionVOShow> getUserFunctionListByFunctionPId(String userId, String functionId);

	/**
	 * 获取用户权限下的所有菜单id
	 *
	 * @param userId 用户id
	 * @return
	 */
	List<String> getUserFunctionIdList(String userId);

	/**
	 * 根据id获取用户信息
	 *
	 * @param userId 用户id
	 * @return
	 */
	TSUser getEntity(String userId);

	/**
	 * 根据用户名获取用户信息
	 *
	 * @param userName 用户名
	 * @return
	 */
	TSUser getEntityByUserName(String userName);

	/**
	 * 保存用户权限设置
	 * @param siteIds
	 * @param userId
	 * @param status
	 */
	boolean saveSettingSite(String[] siteIds, String userId, String status);

	/**
	 * 获取select2回显值
	 * @param userId
	 * @return
	 */
	String getSiteIds(String userId);

	/**
	 * 获取角色下关联的用户
	 * @param roleId
	 * @return
	 */
	String getUserNames(String roleId);

	/**
	 * 获取与角色关联的用户json数据
	 * @param roleId
	 * @return
	 */
	JSONArray getRoleUserJson(String roleId);

	/**
	 * 同步删除用户角色关联表
	 * @param id
	 */
	void delRoleUser(String id);
}