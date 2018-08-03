package com.leimingtech.cms.service.contribute;

import java.util.List;
import java.util.Map;

import com.leimingtech.cms.entity.contribute.ContentCatVO;
import com.leimingtech.cms.entity.contribute.ContributeConfigEntity;

/**
 * @Title: interface
 * @Description: 投稿配置接口
 * @author
 * @date 2016-09-05 09:22:09
 * @version V1.0
 * 
 */
public interface ContributeConfigServiceI {

	/**
	 * 保存投稿配置
	 * 
	 * @param contributeConfig
	 * @return
	 */
	java.lang.String save(ContributeConfigEntity contributeConfig);

	/**
	 * 更新投稿配置
	 * 
	 * @param contributeConfig
	 */
	void saveOrUpdate(ContributeConfigEntity contributeConfig);

	/**
	 * 通过id获取投稿配置
	 * 
	 * @param id
	 *            投稿配置id
	 * @return
	 */
	ContributeConfigEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的投稿配置数据集
	 * 
	 * @param contributeConfig
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return contributeConfigList投稿配置数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(ContributeConfigEntity contributeConfig, Map param, int pageSize,
			int pageNo);

	/**
	 * 删除投稿配置
	 * 
	 * @param contributeConfig
	 */
	void delete(ContributeConfigEntity contributeConfig);

	/**
	 * 增加一项投稿栏目
	 * @param catId
	 * @param catTitle
	 * @param siteId
	 */
	void add(String catId, String catTitle, String siteId);

	/**
	 * 通过栏目删除一项投稿配置
	 * @param catId
	 */
	void deleteByCatId(String catId);

	/**
	 * 按照数据进行调整排序值
	 * @param ids
	 */
	void updateSort(String[] ids);

	/**
	 * 获取指定方案中的最大排序值
	 * 
	 * @param modelId
	 * @return
	 */
	int getMaxSortBySiteId(String siteId);

	/**
	 * 根据栏目名模糊查询，根据站点筛选
	 * @param catName
	 * @param siteId
	 * @return
	 */
	List<ContributeConfigEntity> getAllList(String catName, String siteId);

	/**
	 * 获取用户权限内的投稿栏目
	 * @param siteId
	 * @param departs
	 * @param memberId
	 * @return
	 */
	List<ContentCatVO> getContentCatList(String siteId,
			String[] departs, String memberId);
}
