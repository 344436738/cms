package com.leimingtech.cms.service.visibletemplate;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateEntity;
import com.leimingtech.base.entity.site.SiteEntity;

/**
 * @Title: interface
 * @Description: 可视化模板接口
 * @author
 * @date 2016-10-09 14:38:11
 * @version V1.0
 * 
 */
public interface VisibleTemplateServiceI {

	/**
	 * 保存可视化模板
	 * 
	 * @param visibleTemplate
	 * @return
	 */
	java.lang.String save(VisibleTemplateEntity visibleTemplate);

	/**
	 * 更新可视化模板
	 * 
	 * @param visibleTemplate
	 */
	void saveOrUpdate(VisibleTemplateEntity visibleTemplate);

	/**
	 * 通过id获取可视化模板
	 * 
	 * @param id
	 *            可视化模板id
	 * @return
	 */
	VisibleTemplateEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的可视化模板数据集
	 * 
	 * @param visibleTemplate
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleTemplateList可视化模板数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(VisibleTemplateEntity visibleTemplate, Map param, int pageSize,
			int pageNo);

	/**
	 * 删除可视化模板
	 * 
	 * @param visibleTemplate
	 */
	void delete(VisibleTemplateEntity visibleTemplate);

	/**
	 * 获取指定站点中的可视化模板
	 * @param siteId
	 * @return
     */
	List<VisibleTemplateEntity> getSiteTemplate(String siteId);

	/**
	 * 修改模板
	 * @param visibleTemplate 将要保存的模板数据
	 * @param moduleIds 模板中保留的组件
     */
	boolean updateTemplate(VisibleTemplateEntity visibleTemplate, String[] moduleIds);

	/**
	 * 创建一份可视化模板
	 * @param title
	 * @param templateType
	 * @param created
	 * @param createdby
	 * @param siteid
     * @return
     */
	String create(String title, int templateType, Date created, String createdby, String siteid);

	/**
	 * 生成模板文件
	 * @param title 模板名称
	 * @param cssPath 模板中css
	 * @param templateInfo 模板信息
	 * @param site 站点
	 */
	void generateHtml(String title,String cssPath,String templateInfo,SiteEntity site);

	/**
	 * 获取所有可视化模板
	 * @return
	 */
	List<VisibleTemplateEntity> getAll();
}
