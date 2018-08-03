package com.leimingtech.platform.service.function;

import java.util.List;
import java.util.Map;

import com.leimingtech.base.entity.vo.FunctionVOManager;
import com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.base.entity.vo.ZtreeEntity;
import net.sf.json.JSONArray;

import com.leimingtech.base.entity.temp.TSFunction;


/**
 * 菜单管理接口
 * 
 * @author liuzhen 2015年6月23日 16:39:08
 * 
 */
public interface FunctionServiceI {

	/**
	 * 通过id获取菜单
	 *
	 * @param id
	 *            菜单id
	 * @return
	 */
	TSFunction getEntity(java.lang.String id);

	/**
	 * 获取分页后的菜单数据集
	 *
	 * @param function
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return functionList菜单数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(TSFunction function, Map param,
									int pageSize, int pageNo);

	/***
	 * 获取全部一级数据
	 *
	 * @return
	 */
	List<TSFunction> getAllRoot();

	/**
	 * 通过父id获取下一级数据
	 *
	 * @param id
	 * @return
	 */
	List<TSFunction> getListByPid(java.lang.String id);

	/**
	 * 获取tree节点数据
	 *
	 * @param id
	 *            选中的节点
	 * @return
	 */
	JSONArray getTreeJson(String id);

	/**
	 * 验证Url是否在菜单表中存在
	 *
	 * @param url
	 * @return
	 */
	boolean checkUrlExist(String url);

	/**
	 * 获取所有菜单
	 * @return
	 */
	List<FunctionVOManager> getAllFunction();

	/**
	 * 获取所有菜单并按照treetable格式进行排序
	 * @return
	 */
	List<FunctionVOManager> getAllFunctionAndSortThem();

	/**
	 * 批量修改排序
	 * @param id 菜单id数组
	 * @param sort 排序数据
	 * @param updateUserId 修改人
	 */
	void batchUpdateSort(String[] id, int[] sort, String updateUserId);

	/**
	 * 添加菜单
	 * @param function 菜单信息
	 */
	int add(TSFunction function);

	/**
	 * 更新菜单信息
	 * @param function 菜单信息
	 */
	int update(TSFunction function);

	/**
	 * 根据菜单id删除菜单，会默认删除子菜单，以及跟菜单关联的数据
	 * @param id 菜单id
	 * @return
	 */
	int deleteById(String id);

	/**
	 * 获取所有菜单数据，返回ztree需要的数据
	 * @return
	 */
	List<ZtreeEntity> getAllFunctionUseToZTree();

	/**
	 * 获取平台管理员专属菜单外的所有菜单
	 * @return
	 */
	List<FunctionVOShow> getNonstandardFunList();

	/**
	 * 获取所有菜单列表
	 * @return
	 */
	List<FunctionVOShow> getAllFunList();

	/**
	 * 获取全部左边菜单栏（简单实体）
	 * @param funid
	 * @param authentication
	 * @return
     */
	List<FunctionVOShow> getFunVOListById(String funid, Integer authentication);

}
