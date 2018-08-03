package com.leimingtech.cms.service.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.VisibleNavParamEntity;

import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 导航条件接口
 * @author
 * @date 2016-12-15 20:53:00
 * @version V1.0
 * 
 */
public interface VisibleNavParamServiceI {

	/**
	 * 保存导航条件
	 * 
	 * @param visibleNavParam 导航条件
	 * @return id
	 */
	java.lang.String save(VisibleNavParamEntity visibleNavParam);

	/**
	 * 更新导航条件
	 * 
	 * @param visibleNavParam
	 */
	void saveOrUpdate(VisibleNavParamEntity visibleNavParam);

	/**
	 * 通过id获取导航条件
	 * 
	 * @param id
	 *            导航条件id
	 * @return
	 */
	VisibleNavParamEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的导航条件数据集
	 * 
	 * @param visibleNavParam
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleNavParamList导航条件数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(VisibleNavParamEntity visibleNavParam, Map param, int pageSize,
			int pageNo);

	/**
	 * 删除导航条件
	 * 
	 * @param visibleNavParam
	 */
	void delete(VisibleNavParamEntity visibleNavParam);

	/**
	 * 获取组件参数
	 * @param moduleId 组件id
	 * @return
	 */
	List<Map<String,Object>> getParamByModuleId(String moduleId);

	/**
	 * 更新导航参数
	 * @param templateId 模板id
	 * @param moduleId 所属组件id
	 * @param paramsId 导航参数id
	 * @param moduleKey 组件键
	 * @param template 模板
	 * @param title 标题
	 * @param linkUrl 链接
	 * @param blank 是否跳转到新页面
	 */
	void updateNavModuleParam(String templateId, String moduleId, String[] paramsId, String moduleKey, String template,
							  String[] title, String[] linkUrl, Integer[] blank);

	/**
	 * 添加栏目导航后保存导航参数
	 * @param navModuleId
	 * @param templateId
	 * @param moduleKey
	 * @param ""
	 * @param navTitle
	 * @param linkUrl
     * @param getBlank
     * @return
     */
	String saveNavParam(String navModuleId, String templateId, String moduleKey, String navTitle, String linkUrl, Integer getBlank);
}
