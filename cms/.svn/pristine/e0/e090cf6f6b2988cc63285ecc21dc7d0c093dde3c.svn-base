package com.leimingtech.core.service.impl;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.*;
import  com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.base.entity.vo.UserVO;
import com.leimingtech.common.Globals;
import  com.leimingtech.base.entity.sitepermissions.SitePermissionsEntity;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.common.PlatformConstants;
import com.leimingtech.core.service.*;

import com.leimingtech.core.util.DBTypeUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


/**
 * 
 * @author
 * 
 */
@Service("userService")
@Transactional
public class UserServiceImpl extends CommonServiceImpl implements UserService {

	/**
	 * 公共dao接口
	 */
	@Autowired
	private CommonService commonService;

	@Autowired
	private SystemService systemService;


	public TSUser checkUserExits(TSUser user) {
		return this.systemService.checkUserExits(user);
	}

	/**
	 * 获取用户的角色列表
	 *
	 * @param userId 用户id
	 * @return
	 */
	public List<TSRole> getUserRole(String userId) {
		return this.commonDao.getUserRole(userId);
	}

	public void pwdInit(TSUser user, String newPwd) {
		this.commonDao.pwdInit(user, newPwd);
	}

	public int getUsersOfThisRole(String id) {
		Criteria criteria = getSession().createCriteria(TSRoleUser.class);
		criteria.add(Restrictions.eq("TSRole.id", id));
		int allCounts = ((Long) criteria.setProjection(Projections.rowCount())
				.uniqueResult()).intValue();
		return allCounts;
	}

	@Override
	public Map mapByRoleId() {
		List<TSRole> cmstoprole = getList(TSRole.class);
		HashMap<String, String> map = new HashMap<String, String>();
		for (Iterator iterator = cmstoprole.iterator(); iterator.hasNext(); ) {
			TSRole tsrole = (TSRole) iterator.next();
			map.put(tsrole.getId().toString(), tsrole.getRoleName());
		}
		return map;
	}

	/**
	 * 加载部门树
	 *
	 * @return
	 */
	@Override
	public JSONArray departQuery(String userId) {
		JSONArray jsonArray = new JSONArray();
		TSUser user = new TSUser();
		if (com.leimingtech.common.utils.StringUtils.isNotEmpty(userId)) {
			user = get(TSUser.class, userId);
		}

		List<TSDepart> departList = loadAll(TSDepart.class);
		for (TSDepart depart : departList) {
			JSONObject json = new JSONObject();
			if (null == depart.getTSPDepart()) {
				json.put("id", depart.getId());
				json.put("name", depart.getDepartname());
				json.put("open", false);
				json.put("children", getDepartChildren(depart, user));
				if (null != user.getTSDepart()) {
					if (depart.getId().equals(user.getTSDepart().getId())) {
						json.put("checked", true);
					}
				}
				jsonArray.add(json);
			}
		}
		return jsonArray;
	}

	@Override
	public JSONArray getDepartChildren(TSDepart depart, TSUser user) {
		JSONArray jsonArray = new JSONArray();
		if (null == depart.getTSDeparts() || depart.getTSDeparts().size() == 0) {
			return jsonArray;
		}
		for (TSDepart depart1 : depart.getTSDeparts()) {
			/*
			 * 修改了下拉框的问题，把JSONObject json = new JSONObject();
			 * 更换了位置
			 */
			JSONObject json = new JSONObject();
			json.put("id", depart1.getId());
			json.put("name", depart1.getDepartname());
			json.put("open", false);
			json.put("children", getDepartChildren(depart1, user));
			if (null != user.getTSDepart()) {
				if (depart1.getId().equals(user.getTSDepart().getId())) {
					json.put("checked", true);
				}
			}
			jsonArray.add(json);
		}
		return jsonArray;
	}


	/**
	 * 获取用户真实姓名，真实姓名为空则返回用户名
	 *
	 * @param userId
	 * @return
	 */
	@Override
	public String getRealName(String userId) {
		CriteriaQuery cq = new CriteriaQuery(TSBaseUser.class);

		DetachedCriteria dc = cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("userName").as("userName"));
		pList.add(Projections.property("realName").as("realName"));
		dc.setProjection(pList);

		dc.setResultTransformer(Transformers.aliasToBean(TSBaseUser.class));

		cq.eq("id", userId);
		cq.add();
		List<TSBaseUser> result = this.commonService.getListByCriteriaQuery(cq,
				false);
		if (result != null && result.size() > 0) {
			TSBaseUser user = result.get(0);
			if (com.leimingtech.common.utils.StringUtils.isNotEmpty(user.getRealName())) {
				return user.getRealName();
			}

			return user.getUserName();
		}
		return "";
	}

	/**
	 * 获取用户所有的角色id
	 *
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public List<String> getRoleIdListByUserId(String userId) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select roleid from cms_role_user");
		sql.append(" where userid = ? ");
		List<String> list = this.commonService.findForList(sql.toString(), String.class, userId);
		return list;
	}

	/**
	 * 获取用户所有权限菜单
	 *
	 * @param userId
	 * @return
	 */
	@Override
	public List<FunctionVOShow> getUserFunctionListByUserId(String userId) {
		StringBuilder sql = new StringBuilder();
		String dbType = DBTypeUtil.getDBType();//数据库类型
		if(dbType.equals("mysql")){
			sql.append(" select ");
			sql.append(" f.id,f.name,f.href,f.fun_level \"level\",f.parent_id \"parentId\",f.parent_ids \"parentIds\",f.icon ");
			sql.append(" ,f.show_flag \"showFlag\",f.child_show_count \"childShowCount\" ,f.permission ");
			sql.append(" from cms_function f ");
			sql.append(" left join cms_role_function rf on rf.functionid=f.id ");
			sql.append(" where f.show_flag = 1 ");
			sql.append(" and rf.roleid in (select roleid from cms_role_user ");
			sql.append(" where userid = ? ) group by f.id order by f.sort desc,f.created_time asc ");
		}else if(dbType.equals("oracle")){
			sql.append(" select ");
			sql.append(" cf.id,cf.name,cf.href,cf.fun_level \"level\", ");
			sql.append(" cf.parent_id \"parentId\",cf.parent_ids \"parentIds\",cf.icon, ");
			sql.append(" cf.show_flag \"showFlag\",cf.child_show_count \"childShowCount\" ,cf.permission ");
			sql.append(" from cms_function cf ");
			sql.append(" left join cms_role_function rf on rf.functionid=cf.id ");
			sql.append(" where cf.show_flag = 1  and rf.roleid in (select roleid from cms_role_user  where userid = ? ) ");
			sql.append(" order by cf.sort desc,cf.created_time asc ");
		}
		List<FunctionVOShow> list = this.commonService.query(sql.toString(), new FunctionVOShow(), userId);
		return list;
	}

	/**
	 * 根据用户名获取用户基本信息（id、用户名、昵称、密码）
	 *
	 * @param username 用户名
	 * @return
	 */
	@Override
	public UserVO getUserInfoByUsername(String username) {
		CriteriaQuery cq = new CriteriaQuery(TSBaseUser.class);

		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("userName").as("userName"));
		pList.add(Projections.property("realName").as("realName"));
		pList.add(Projections.property("password").as("password"));

		DetachedCriteria dc = cq.getDetachedCriteria();
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(UserVO.class));

		cq.eq("userName", username);
		cq.add();

		List<UserVO> data = this.commonService.getListByCriteriaQuery(cq, false);
		if (data != null && data.size() > 0) {
			return data.get(0);
		}

		return null;
	}

	/**
	 * 根据当前菜单id获取用户权限内的所有子集菜单
	 *
	 * @param userId     用户id
	 * @param functionId 菜单id
	 * @return
	 */
	@Override
	public List<FunctionVOShow> getUserFunctionListByFunctionPId(String userId, String functionId) {

		List<FunctionVOShow> functionList = getUserFunctionListByUserId(userId);
		if (functionList == null || functionList.size() == 0) {
			return null;
		}
		List<FunctionVOShow> returnFunction = new ArrayList<>();

		String condition = functionId + ",";//用于比较筛选的条件

		for (int i = 0, length = functionList.size(); i < length; i++) {
			FunctionVOShow function = functionList.get(i);
			if (function.getParentIds().contains(condition)) {
				returnFunction.add(function);
			}
		}

		return returnFunction;
	}

	/**
	 * 获取用户权限下的所有菜单id
	 *
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public List<String> getUserFunctionIdList(String userId) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select ");
		sql.append(" f.id");
		sql.append(" from cms_function f ");
		sql.append(" left join cms_role_function rf on rf.functionid=f.id ");
		sql.append(" where f.show_flag = 1 ");
		sql.append(" and rf.roleid in (select roleid from cms_role_user where userid = ? ) ");
		List<String> list = this.commonService.findForList(sql.toString(), String.class, userId);
		return list;
	}

	/**
	 * 根据id获取用户信息
	 *
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public TSUser getEntity(String userId) {
		return this.commonService.getEntity(TSUser.class, userId);
	}

	/**
	 * 根据用户名获取用户信息
	 *
	 * @param userName 用户名
	 * @return
	 */
	@Override
	public TSUser getEntityByUserName(String userName) {
		return this.commonService.findUniqueByProperty(TSUser.class, "userName", userName);
	}

	/**
	 * 保存用户站点权限设置
	 * @param siteIds
	 * @param userId
	 * @param status
	 */
	@Override
	public boolean saveSettingSite(String[] siteIds, String userId, String status) {
		TSUser user = this.getEntity(TSUser.class,userId);
		if(user != null){
			if(StringUtils.isNotEmpty(status)){
				user.setAuthentication(Integer.valueOf(status));
				commonService.save(user);
				UserUtils.clearCache(user);
			}
			List<SitePermissionsEntity> sitePermissionsList = commonService.findByProperty(SitePermissionsEntity.class,"userId",userId);
			if(sitePermissionsList!=null && sitePermissionsList.size()>0){
				commonService.deleteAllEntitie(sitePermissionsList);
			}

			for (int i = 0; i < siteIds.length-1; i++) {
				SitePermissionsEntity sitePermissions = new SitePermissionsEntity();
				sitePermissions.setSiteId(siteIds[i]);
				sitePermissions.setUserId(userId);
				sitePermissions.setUserStatus(Integer.valueOf(status));
				sitePermissions.setCreateTime(new Date());
				commonService.save(sitePermissions);
			}
			//清空用户站点权限缓存
			UserUtils.removeCache("siteList");
			return true;
		}
		return false;
	}

	@Override
	public String getSiteIds(String userId) {
		List<SitePermissionsEntity> sitepermissionsList = commonService.findByProperty(SitePermissionsEntity.class,"userId",userId);
		String ids = "";
		if(sitepermissionsList!=null && sitepermissionsList.size()>0){
			for (int i = 0; i <sitepermissionsList.size() ; i++) {
				SiteEntity site = commonService.getEntity(SiteEntity.class,sitepermissionsList.get(i).getSiteId());
				ids = ids + site.getId()+",";
			}
			ids = ids.substring(0,ids.length()-1);
		}
		return ids;
	}

	@Override
	public String getUserNames(String roleId) {
		String siteId = UserUtils.getSiteId();
		String name = "";
		if(StringUtils.isNotEmpty(roleId)){
			CriteriaQuery cq = new CriteriaQuery(TSRoleUser.class);
			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.property("TSUser.id").as("id"));
			DetachedCriteria dc = cq.getDetachedCriteria();
			dc.setProjection(pList);
			dc.setResultTransformer(Transformers.aliasToBean(TSRoleUser.class));
			cq.eq("TSRole.id", roleId);
			cq.eq("siteId", siteId);
			cq.add();

			List<TSRoleUser>roleUserList = this.commonService.getListByCriteriaQuery(cq, false);
//			String sql = "select userid from cms_role_user where roleid = '"+roleId+"' and site_id = '"+siteId+"'";
//			List<TSRoleUser>roleUserList = commonService.findListbySql(sql);
			if(roleUserList != null && roleUserList.size()>0){
				for(TSRoleUser user1 : roleUserList){
					TSUser user = commonService.getEntity(TSUser.class,user1.getId());
					if(user!=null){
						name = name+user.getUserName()+",";
					}
				}
			}
		}
		return name;
	}

	@Override
	public JSONArray getRoleUserJson(String roleId) {
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		//获取站点下的编辑人员
		String siteId =UserUtils.getSiteId();
		String sql = "select user_id \"userId\" from cms_site_user where user_status = "+ Globals.EDITORIAL_STAFF+" and site_id='"+siteId+"' ";
		List<Map<String, Object>> userlist = commonService.findForJdbc(sql);

		//List<TSUser> userlist = this.getList(TSUser.class);
		String userName = getUserNames(roleId);
		String[] userNames = userName.split(",");
		Set<String> set = new HashSet<String>();
		for (String s : userNames) {
			set.add(s);
		}
		for (int i = 0; i < userlist.size(); i++) {
			TSUser user = this.get(TSUser.class,userlist.get(i).get("userId").toString());
			if(user!=null){
				json.put("id", user.getId());
				json.put("name", user.getUserName());
				json.put("open", false);
				if(set.contains(user.getUserName())){
					json.put("checked", true);
				}else{
					json.put("checked", false);
				}
//				if(userNames.length>0){
//					for (int j = 0; j <userNames.length ; j++) {
//						if(user.getUserName().equals(userNames[j])){
//							json.put("checked", true);
//							break;
//						}else{
//							json.put("checked", false);
//						}
//					}
//				}else{
//					json.put("checked", false);
//				}

				jsonArray.add(json);
			}
		}
		return jsonArray;
	}
	@Override
	public void delRoleUser(String id) {
		List<TSRoleUser> roleUserList = this.findByProperty(
				TSRoleUser.class, "TSUser.id", id);
		if (roleUserList.size() >= 1) {
			this.deleteAllEntitie(roleUserList);
		}
	}

}
