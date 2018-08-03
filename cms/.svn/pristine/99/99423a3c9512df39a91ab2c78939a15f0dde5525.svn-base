package com.leimingtech.core.service.impl;

import java.util.Date;
import java.util.List;

import com.leimingtech.base.entity.temp.TSRole;
import com.leimingtech.base.entity.temp.TSRoleUser;
import com.leimingtech.base.entity.temp.TSUser;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;

import com.leimingtech.core.service.RoleSiteServiceI;
import com.leimingtech.core.service.contentcatpriv.ContentCatPrivServiceI;
import com.leimingtech.core.service.mobilechannelpriv.MobileChannelPrivServiceI;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.RoleServiceI;
import com.leimingtech.core.service.RoleUserService;



/**
 * 角色管理接口实现
 * 
 * @author liuzhen 2015年8月28日 12:02:24
 * 
 */
@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleServiceI {

	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	/** 用户角色管理接口 */
	@Autowired
	private RoleUserService roleUserService;
	/**站点权限管理接口*/
	@Autowired
	private RoleSiteServiceI roleSiteService;
	/**移动栏目权限管理接口*/
	@Autowired
	private MobileChannelPrivServiceI mobileChannelPrivService;
	/**PC栏目权限管理接口*/
	@Autowired
	private ContentCatPrivServiceI contentCatPrivService;

	/**
	 * 通过id获取角色
	 *
	 * @param roleId
	 * @return
	 */
	@Override
	public TSRole getEntity(String roleId) {
		return commonService.get(TSRole.class, roleId);
	}

	/**
	 * 通过用户id获取角色id数组
	 *
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public String[] getRoleIdArrayByUserId(String userId) {
		List<TSRoleUser> roleUserList = roleUserService
				.getRoleUserByuserId(userId);

		if (roleUserList == null || roleUserList.size() == 0)
			return null;

		String[] roleIds = new String[roleUserList.size()];

		for (int i = 0; i < roleUserList.size(); i++) {
			roleIds[i] = roleUserList.get(i).getTSRole().getId();
		}

		return roleIds;
	}

	/**
	 * 删除角色
	 *
	 * @param roleId
	 */
	@Override
	public int delete(String roleId) {
		// 首先要删除与角色关联的权限 菜单权限
		roleUserService.deleteAllRoleFunctionByRoleId(roleId);

		//删除移动栏目权限
		mobileChannelPrivService.deleteByRoleId(roleId);

		//删除站点权限
		roleSiteService.deleteByRoleId(roleId);

		//删除用户角色
		roleUserService.deleteAllRoleUserByRoleId(roleId);

		contentCatPrivService.deleteByRoleId(roleId);

		this.commonService.executeSql(" delete from cms_role where id = ? ",roleId);
		return 0;
	}

	/**
	 * 保存角色用户关联
	 * @param roleId
	 * @return
	 */
	@Override
	public boolean saveRoleUser(String roleId, String userid) {
		CriteriaQuery cq = new CriteriaQuery(TSRoleUser.class);
		cq.eq("TSRole.id",roleId);
		cq.eq("siteId", UserUtils.getSiteId());
		cq.add();
		List<TSRoleUser> roleUserList = commonService.getListByCriteriaQuery(cq,false);
		if(roleUserList!=null && roleUserList.size()>0){
			commonService.deleteAllEntitie(roleUserList);
		}
		String[] userId = userid.split(",");
		if(userId != null && userId.length>0){
			for (int i = 0; i <userId.length ; i++) {
				TSRoleUser roleUser = new TSRoleUser();
				TSUser user = commonService.getEntity(TSUser.class,userId[i]);
				TSRole role = commonService.getEntity(TSRole.class,roleId);
				roleUser.setTSUser(user);
				roleUser.setTSRole(role);
				roleUser.setSiteId(UserUtils.getSiteId());
				roleUser.setCreatedtime(new Date());
				commonService.save(roleUser);
			}
			return true;
		}
		return false;
	}

}
