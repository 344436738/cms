package com.leimingtech.cms.service.visibletemplate;

import java.util.Map;

import com.leimingtech.cms.entity.visibletemplate.VisibleContentParamEntity;

/**
 * @Title: interface
 * @Description: 内容条件接口
 * @author
 * @date 2016-11-17 17:27:57
 * @version V1.0
 * 
 */
public interface VisibleContentParamServiceI {

	/**
	 * 保存内容条件
	 * 
	 * @param visibleContentParam
	 * @return
	 */
	java.lang.String save(VisibleContentParamEntity visibleContentParam);

	/**
	 * 更新内容条件
	 * 
	 * @param visibleContentParam
	 */
	void saveOrUpdate(VisibleContentParamEntity visibleContentParam);

	/**
	 * 通过id获取内容条件
	 * 
	 * @param id
	 *            内容条件id
	 * @return
	 */
	VisibleContentParamEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的内容条件数据集
	 * 
	 * @param visibleContentParam
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleContentParamList内容条件数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(VisibleContentParamEntity visibleContentParam, Map param, int pageSize,
			int pageNo);

	/**
	 * 删除内容条件
	 * 
	 * @param visibleContentParam
	 */
	void delete(VisibleContentParamEntity visibleContentParam);

	/**
	 * 通过组件获取参数
	 * @param moduleId
	 * @return
     */
	Map<String,Object> getParamByModuleId(String moduleId);

	Map<String, Object> getParam(String moduleId);

	/**
	 * 修改组件参数
	 * @param paramsId 参数主键id
	 * @param  catId - 模板参数：栏目id
	 * @param count - 模板参数：获取数量
	 * @param image - 是否必须包含缩略图
	 */
	int updateModuleParam(String paramsId, String catId, int count, int image);

	/**
	 * 删除模板中所有参数数据
	 *
	 * @param templateId 模板id
	 * @return
	 */
	int deleteByTemplateId(String templateId);

	/**
	 * 根据moduleId获取分页组件参数
	 * @param moduleId
	 * @return
     */
	Map<String,Object> getPainationByModuleId(String moduleId);
}
