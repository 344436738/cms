package com.leimingtech.platform.service.impl.function;

import java.util.*;

import com.google.common.collect.Lists;
import com.leimingtech.base.entity.vo.FunctionVOManager;
import com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.base.entity.vo.ZtreeEntity;
import com.leimingtech.common.Globals;
import com.leimingtech.common.utils.LogUtil;
import com.leimingtech.common.utils.MyBeanUtils;
import com.leimingtech.core.service.RoleUserService;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.impl.jedis.JedisConfig;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.util.constant.PersonnelStatusConstant;
import com.leimingtech.core.util.constant.RedisKey;
import com.leimingtech.platform.common.utils.JedisUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.base.entity.temp.TSFunction;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.platform.service.function.FunctionServiceI;
import redis.clients.jedis.Jedis;


/**
 * 菜单管理接口实现
 * 
 * @author liuzhen 2015年6月23日 16:40:08
 * 
 */
@Service("functionService")
@Transactional
public class FunctionServiceImpl implements FunctionServiceI {

	/**
	 * 公共Dao接口
	 */
	@Autowired
	private CommonService commonService;

	@Autowired
	private SystemService systemService;

	@Autowired
	private RoleUserService roleUserService;

	/**
	 * 保存树
	 *
	 * @param function
	 * @return
	 */
	private java.lang.String save(TSFunction function) {
		return (java.lang.String) commonService.save(function);
	}

	/**
	 * 更新树
	 *
	 * @param function
	 */
	private void saveOrUpdate(TSFunction function) {
		commonService.saveOrUpdate(function);
	}

	/**
	 * 通过id获取树
	 *
	 * @param id 树id
	 * @return
	 */
	@Override
	public TSFunction getEntity(java.lang.String id) {
		return commonService.getEntity(TSFunction.class, id);
	}

	/**
	 * 获取分页后的树数据集
	 *
	 * @param function
	 * @param param    字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize 每页获取数量
	 * @param pageNo   当前页码
	 * @return functionList树数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(TSFunction function, Map param,
										   int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(TSFunction.class, pageSize,
				pageNo, "", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, function, param);
		cq.addOrder("functionOrder", SortDirection.desc);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<TSFunction> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("functionList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/***
	 * 获取全部一级数据
	 *
	 * @return
	 */
	@Override
	public List<TSFunction> getAllRoot() {
		CriteriaQuery cq = new CriteriaQuery(TSFunction.class);
		cq.eq("level", 0);
		cq.addOrder("sort", SortDirection.desc);
		cq.addOrder("createdTime", SortDirection.desc);
		cq.add();
		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 通过父id获取下一级数据
	 *
	 * @param id
	 * @return
	 */
	@Override
	public List<TSFunction> getListByPid(java.lang.String id) {
		CriteriaQuery cq = new CriteriaQuery(TSFunction.class);
		cq.eq("parentId", id);
		cq.addOrder("sort", SortDirection.desc);
		cq.addOrder("createdTime", SortDirection.desc);
		cq.add();
		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 获取tree节点数据
	 *
	 * @param json       最终返回的json
	 * @param list
	 * @param openNodes  打开的节点（多个节点用逗号分隔）
	 * @param selectNode 选中的节点
	 * @return json
	 */
	private JSONArray getChildTreeJson(JSONArray json, List<TSFunction> list,
									   String openNodes, String selectNode) {
		for (TSFunction function : list) {

			JSONObject jChildObject = new JSONObject();

			jChildObject.accumulate("id", function.getId());
			jChildObject.accumulate("text", function.getName());

			JSONObject stateJson = new JSONObject();
			if (com.leimingtech.common.utils.StringUtils.isNotEmpty(selectNode)
					&& selectNode.equals(function.getId() + "")) {
				stateJson.accumulate("selected", true);
			}
			List<TSFunction> childlist = getListByPid(function.getId());

			if (childlist != null && childlist.size() > 0) {

				if (com.leimingtech.common.utils.StringUtils.isNotEmpty(openNodes)
						&& openNodes.contains(function.getId() + "")) {
					stateJson.accumulate("opened", true);
				}
				jChildObject.accumulate("state", stateJson);

				JSONArray jChildArray = new JSONArray();
//				getChildTreeJson(jChildArray, childlist, openNodes, selectNode);
				jChildObject.accumulate("children", jChildArray);
			} else {
				jChildObject.accumulate("state", stateJson);
			}

			json.add(jChildObject);
		}
		return json;
	}

	/**
	 * 获取tree节点数据
	 *
	 * @param id 选中的节点
	 * @return
	 */
	@Override
	public JSONArray getTreeJson(String id) {

		JSONArray json = new JSONArray();

		JSONObject jstreeData = new JSONObject();
		jstreeData.accumulate("id", "-1");
		jstreeData.accumulate("text", "菜单");
		JSONObject stateJson = new JSONObject();
		stateJson.accumulate("opened", true);

		TSFunction function = new TSFunction();
		if (com.leimingtech.common.utils.StringUtils.isNotEmpty(id)) {
			function = getEntity(String.valueOf(id));
		} else {
			stateJson.accumulate("selected", true);
		}
		jstreeData.accumulate("state", stateJson);

		List<TSFunction> list = getAllRoot();
		if (list != null && list.size() > 0) {
			JSONArray jChildArray = new JSONArray();
//			getChildTreeJson(jChildArray, list, function.getPathids(), id);
			jstreeData.accumulate("children", jChildArray);
		}

		json.add(jstreeData);

		return json;
	}

	/**
	 * 验证Url是否在菜单表中存在
	 *
	 * @param url
	 * @return
	 */
	@Override
	public boolean checkUrlExist(String url) {

		List<TSFunction> functionList = commonService.findByProperty(
				TSFunction.class, "href", url);
		if (functionList == null || functionList.size() == 0) {
			return false;
		}

		return true;
	}

	/**
	 * 获取所有菜单
	 *
	 * @return
	 */
	@Override
	public List<FunctionVOManager> getAllFunction() {
		CriteriaQuery cq = new CriteriaQuery(TSFunction.class);

		DetachedCriteria dc = cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("parentId").as("parentId"));
		pList.add(Projections.property("name").as("name"));
		pList.add(Projections.property("href").as("href"));
		pList.add(Projections.property("sort").as("sort"));
		pList.add(Projections.property("permission").as("permission"));
		pList.add(Projections.property("showFlag").as("showFlag"));
		dc.setProjection(pList);

		dc.setResultTransformer(Transformers.aliasToBean(FunctionVOManager.class));
		cq.addOrder("sort", SortDirection.desc);
		cq.addOrder("createdTime", SortDirection.asc);
		cq.add();
		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 获取所有菜单并按照treetable格式进行排序
	 *
	 * @return
	 */
	@Override
	public List<FunctionVOManager> getAllFunctionAndSortThem() {
		List<FunctionVOManager> functionList = this.getAllFunction();
		if (functionList == null || functionList.size() == 0) {
			return null;
		}
		List<FunctionVOManager> list = Lists.newArrayList();
		sortFunction(list, functionList, "0");//最顶级菜单默认父id为0
		return list;
	}

	/**
	 * 将菜单数据按照treetable进行排序
	 *
	 * @param list       排序后菜单列表
	 * @param sourcelist 排序前菜单列表
	 * @param parentId   按照哪个菜单作为父菜单
	 * @return
	 */
	private void sortFunction(List<FunctionVOManager> list, List<FunctionVOManager> sourcelist, String parentId) {
		for (int i = 0; i < sourcelist.size(); i++) {
			FunctionVOManager e = sourcelist.get(i);
			if (e.getParentId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j = 0; j < sourcelist.size(); j++) {
					FunctionVOManager child = sourcelist.get(j);
					if (child.getParentId().equals(e.getId())) {
						this.sortFunction(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}

	/**
	 * 批量修改排序
	 *
	 * @param id           菜单id数组
	 * @param sort         排序数据
	 * @param updateUserId 修改人
	 */
	@Override
	public void batchUpdateSort(String[] id, int[] sort, String updateUserId) {
		if (id.length == 0 || id.length != sort.length) {
			String msg = "参数不完整，无法执行批量修改";
			throw new IllegalArgumentException(msg);
		}
		Date date = new Date();
		for (int i = 0, length = id.length; i < length; i++) {
			changeSort(id[i], sort[i], updateUserId, date);
		}
	}

	/**
	 * 指定菜单修改排序
	 *
	 * @param id           菜单id
	 * @param sort         排序值
	 * @param updateUserId 修改人
	 * @param date         修改时间
	 */
	private void changeSort(String id, int sort, String updateUserId, Date date) {
		String sql = " update cms_function set sort = ? , create_by = ? , update_time = ? where id = ? ";
		commonService.updateBySql(sql, sort, updateUserId, date, id);
	}

	/**
	 * 添加菜单
	 *
	 * @param function 菜单信息
	 */
	@Override
	public int add(TSFunction function) {

		if ("0".equals(function.getParentId())) {
			function.setChildShowCount(0);
			function.setLevel(1);
			function.setParentIds("0,");
		} else {
			TSFunction pFunction = this.getEntity(function.getParentId());
			if (pFunction == null) {
				return 0;
			}
			function.setParentIds(pFunction.getParentIds() + pFunction.getId() + ",");
			function.setLevel(pFunction.getLevel() + 1);
		}

		String userId = UserUtils.getUser().getId();
		Date date = new Date();
		function.setCreatedTime(date);
		function.setCreateBy(userId);
		function.setUpdateBy(userId);
		function.setUpdateTime(date);
		this.save(function);
		systemService.addLog("菜单【" + function.getName() + "】添加成功", Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);

		if (!"0".equals(function.getParentId()) && function.getShowFlag() == 1) {
			this.updateChildShowCount(function.getParentId());//修改菜单下显示的菜单数
		}

		return 1;
	}

	/**
	 * 修改菜单下显示的菜单数
	 *
	 * @param functionId
	 */
	private void updateChildShowCount(String functionId) {
		StringBuilder sql = new StringBuilder();
		sql.append(" update cms_function f ");
		sql.append(" set f.child_show_count = ");
		sql.append(" (select child from (select count(1) child from cms_function a where a.parent_id = ? and a.show_flag = 1 ) b ) ");
		sql.append(" where f.id = ? ");
		this.commonService.updateBySql(sql.toString(), functionId, functionId);
	}

	/**
	 * 更新菜单信息
	 *
	 * @param function 菜单信息
	 */
	@Override
	public int update(TSFunction function) {

		TSFunction oldFunction = this.getEntity(function.getId());
		if (oldFunction == null) {
			return 0;
		}

		try {
			function.setLevel(oldFunction.getLevel());
			function.setChildShowCount(oldFunction.getChildShowCount());
			MyBeanUtils.copyBeanNotNull2Bean(function, oldFunction);
			oldFunction.setUpdateBy(UserUtils.getUser().getId());
			oldFunction.setUpdateTime(new Date());
			this.saveOrUpdate(oldFunction);
			systemService.addLog("菜单【" + function.getName() + "】修改成功", Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		} catch (Exception e) {
			LogUtil.error("菜单修改失败！系统出现异常：" + e.getMessage(),e);
			return 0;
		}
		if (!"0".equals(function.getParentId())
				&& com.leimingtech.common.utils.StringUtils.equals(function.getShowFlag() + "", oldFunction.getShowFlag() + "")) {
			this.updateChildShowCount(function.getParentId());//修改菜单下显示的菜单数
		}
		return 1;
	}

	/**
	 * 根据菜单id删除菜单，会默认删除子菜单，以及跟菜单关联的数据
	 *
	 * @param id 菜单id
	 * @return
	 */
	@Override
	public int deleteById(String id) {
		List<String> list = this.getChildIdList(id);
		if (list != null && list.size() > 0) {
			for (int i = 0, length = list.size(); i < length; i++) {
				this.deleteById(list.get(i));
			}
		}

		roleUserService.deleteAllRoleFunctionByFunctionId(id);

		return this.commonService.executeSql(" delete from cms_function where id = ?  ", id);
	}

	/**
	 * 查询指定菜单下的子菜单id集合
	 * @param functionId 菜单id
	 * @return
	 */
	private List<String> getChildIdList(String functionId) {
		String sql = " select id from cms_function where parent_id = ? ";
		return commonService.findForList(sql, String.class, functionId);
	}

	/**
	 * 获取所有菜单数据，返回ztree需要的数据(非平台管理员专属菜单)
	 *
	 * @return
	 */
	@Override
	public List<ZtreeEntity> getAllFunctionUseToZTree() {
		CriteriaQuery cq = new CriteriaQuery(TSFunction.class);

		DetachedCriteria dc = cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("parentId").as("parentId"));
		pList.add(Projections.property("name").as("name"));
		dc.setProjection(pList);

		dc.setResultTransformer(Transformers.aliasToBean(ZtreeEntity.class));
		cq.notEq("flag",PersonnelStatusConstant.MENU_IDENTIFYING);
		cq.addOrder("sort", SortDirection.desc);
		cq.addOrder("createdTime", SortDirection.asc);
		cq.add();
		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 获取平台管理员专属菜单外的所有菜单
	 * @return
	 */
	@Override
	public List<FunctionVOShow> getNonstandardFunList() {

		List<FunctionVOShow> list = null;

		list = (List<FunctionVOShow>)UserUtils.getCache("menuList", list);
		if(list != null){
			return list;
		}
		/*if(JedisConfig.JEDIS_STATUS){

			Object object = JedisUtils.getObject(RedisKey.NONSTANDARD_FUN_LIST);

			if(object == null){
				list = sqlFindList();
				JedisUtils.setObject(RedisKey.NONSTANDARD_FUN_LIST,list,0);
			}else{
				list = (List<FunctionVOShow>)object;
				JedisUtils.setObject(RedisKey.NONSTANDARD_FUN_LIST,list,0);
			}
		}else{
			list = sqlFindList();
		}*/
		list = sqlFindList();
		UserUtils.putCache("menuList", list);

		return list;
	}

	/**
	 * 根据sql获取专属菜单外的所有菜单
	 * @return
     */
	private List<FunctionVOShow> sqlFindList() {

		List<FunctionVOShow> list = new ArrayList<>();

		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" f.id,f.name,f.href,f.fun_level \"level\",f.parent_id \"parentId\",f.parent_ids \"parentIds\",f.icon ");
		sql.append(" ,f.show_flag \"showFlag\",f.child_show_count \"childShowCount\" ,f.permission ");
		sql.append(" from cms_function f ");
		sql.append(" where f.show_flag = 1");
		sql.append(" and platform_manager_flag != 1");
		sql.append(" order by f.sort desc,f.created_time asc");
		list = this.commonService.query(sql.toString(), new FunctionVOShow());

		return list;
	}

	/**
	 * 获取所有菜单列表
	 * @return
	 */
	@Override
	public List<FunctionVOShow> getAllFunList() {
		List<FunctionVOShow> list = null;

		/*if(JedisConfig.JEDIS_STATUS){

			Object object = JedisUtils.getObject(RedisKey.All_Fun_List_KEY);

			if(object == null){
				list = sqlFindAllList();
				JedisUtils.setObject(RedisKey.All_Fun_List_KEY,list,0);
			}else{
				list = (List<FunctionVOShow>)object;
			}
		}else{
			list = sqlFindAllList();
		}*/
		list = sqlFindAllList();

		UserUtils.putCache("menuList"+UserUtils.getUserId(), list);

		return list;
	}

	private List<FunctionVOShow> sqlFindAllList() {
		List<FunctionVOShow> list = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" f.id,f.name,f.href,f.fun_level \"level\",f.parent_id \"parentId\",f.parent_ids \"parentIds\",f.icon ");
		sql.append(" ,f.show_flag \"showFlag\",f.child_show_count \"childShowCount\" ,f.permission ");
		sql.append(" from cms_function f where f.show_flag = 1 ");
		sql.append(" order by f.sort desc,f.created_time asc");
		list = this.commonService.query(sql.toString(), new FunctionVOShow());

		return list;
	}

	/**
	 * 获取全部左边菜单栏（简单实体）
	 * @param funid
	 * @param authentication
	 * @return
	 */
	@Override
	public List<FunctionVOShow> getFunVOListById(String funid, Integer authentication) {

		List<FunctionVOShow> functionList = new ArrayList<>();

		if(StringUtils.isNotEmpty(funid) && authentication != null){

			if(authentication == PersonnelStatusConstant.ADMINISTRATOR_PLATFORM || authentication==PersonnelStatusConstant.ADMINISTRATOR_SUPER){
				functionList = getAllFunList();
			}else{
				functionList = getNonstandardFunList();
			}
			List<FunctionVOShow> returnFunction = new ArrayList<>();

			String condition = funid + ",";//用于比较筛选的条件

			for (int i = 0, length = functionList.size(); i < length; i++) {
				FunctionVOShow function = functionList.get(i);
				if (function.getParentIds().contains(condition)) {
					returnFunction.add(function);
				}
			}

			return returnFunction;
		}
		return functionList;
	}

}
