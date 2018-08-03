package com.leimingtech.cms.service.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.VisibleImageParamEntity;

import java.util.Map;

/**
 * @Title: interface
 * @Description: 可视化图片条件接口
 * @author
 * @date 2016-11-25 18:18:27
 * @version V1.0
 * 
 */
public interface VisibleImageParamServiceI {

	/**
	 * 保存可视化图片条件
	 * 
	 * @param visibleImageParam
	 * @return
	 */
	java.lang.String save(VisibleImageParamEntity visibleImageParam);

	/**
	 * 更新可视化图片条件
	 * 
	 * @param visibleImageParam
	 */
	void saveOrUpdate(VisibleImageParamEntity visibleImageParam);

	/**
	 * 通过id获取可视化图片条件
	 * 
	 * @param id
	 *            可视化图片条件id
	 * @return
	 */
	VisibleImageParamEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的可视化图片条件数据集
	 * 
	 * @param visibleImageParam
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleImageParamList可视化图片条件数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(VisibleImageParamEntity visibleImageParam, Map param, int pageSize,
									int pageNo);

	/**
	 * 删除可视化图片条件
	 * 
	 * @param visibleImageParam
	 */
	void delete(VisibleImageParamEntity visibleImageParam);

	/**
	 * 修改图片组件参数
	 *
	 * @param imageParamsId 图片组件参数id
	 * @param imageUrl      图片地址
	 * @param imageWidth    图片宽度
	 * @param imageHeight   图片高度
	 * @param description   描述
	 * @param linkUrl       链接地址
	 * @param blank         新窗口打开（1、是；0、否）
	 * @return 数据库修改影响的行数
	 */
	boolean updateImageModuleParam(String imageParamsId, String imageUrl, Integer imageWidth, Integer imageHeight,
							   String description, String linkUrl, Integer blank);

	/**
	 * 获取组件的参数
	 * @param moduleId
	 * @return
     */
	Map<String,Object> getParamByModuleId(String moduleId);

	/**
	 * 删除模板中的所有参数数据
	 * @param templateId
	 * @return
     */
	int deleteByTemplateId(String templateId);
}
