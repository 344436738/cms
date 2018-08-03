package com.leimingtech.cms.service.visibletemplate;

import java.util.List;
import java.util.Map;

import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVOControllerEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVODemoEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVOTemplateEntity;

/**
 * @Title: interface
 * @Description: 可视化模板组件配置接口
 * @author
 * @date 2016-09-28 14:24:17
 * @version V1.0
 * 
 */
public interface VisibleTemplateModuleServiceI {

	/**
	 * 保存可视化模板组件配置
	 * 
	 * @param visibleTemplateModule
	 * @return
	 */
	java.lang.String save(VisibleTemplateModuleEntity visibleTemplateModule);

	/**
	 * 更新可视化模板组件配置
	 * 
	 * @param visibleTemplateModule
	 */
	void saveOrUpdate(VisibleTemplateModuleEntity visibleTemplateModule);

	/**
	 * 通过id获取可视化模板组件配置
	 * 
	 * @param id
	 *            可视化模板组件配置id
	 * @return
	 */
	VisibleTemplateModuleEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的可视化模板组件配置数据集
	 * 
	 * @param visibleTemplateModule
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleTemplateModuleList可视化模板组件配置数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(VisibleTemplateModuleEntity visibleTemplateModule, Map param, int pageSize,
			int pageNo);

	/**
	 * 删除可视化模板组件配置
	 * 
	 * @param visibleTemplateModule
	 */
	void delete(VisibleTemplateModuleEntity visibleTemplateModule);

	/**
	 * 获取所有可视化模板组件，demo模板
	 * @return
	 */
	List<VisibleTemplateModuleVODemoEntity> AllDemo();

	/**
	 * 根据组件键获取配置模板
	 * @param moduleKey 组件key
	 * @return
	 */
	VisibleTemplateModuleVOTemplateEntity findByModuleKey(String moduleKey);

	/**
	 * 获取组件功能列表
	 *
	 * @return
	 */
	List<VisibleTemplateModuleVOControllerEntity> getControllerList();

	/**
	 * 获取组件列表，key为组件moduleKey;value为模板控制功能
	 *
	 * @return
	 */
	Map<String, String> getModuleControllerMap();

	/**
	 * 获取所有组件
	 * @param keyword 根据关键字模糊查询组件名和组件键
	 * @return
     */
	List<VisibleTemplateModuleEntity> getAllModule(String keyword);
}
