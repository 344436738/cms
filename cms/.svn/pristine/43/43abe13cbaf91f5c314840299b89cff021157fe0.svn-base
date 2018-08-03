package com.leimingtech.cms.service.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.VisibleModuleEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleModuleVOTempEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleModuleVOTemplateEntity;
import com.leimingtech.base.entity.temp.ContentCatEntity;

import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 可视化模板组件接口
 * @author
 * @date 2016-09-28 14:26:32
 * @version V1.0
 * 
 */
public interface VisibleModuleServiceI {

	/**
	 * 保存可视化模板组件
	 * 
	 * @param visibleModule
	 * @return
	 */
	java.lang.String save(VisibleModuleEntity visibleModule);

	/**
	 * 更新可视化模板组件
	 * 
	 * @param visibleModule
	 */
	void saveOrUpdate(VisibleModuleEntity visibleModule);

	/**
	 * 通过id获取可视化模板组件
	 * 
	 * @param id
	 *            可视化模板组件id
	 * @return
	 */
	VisibleModuleEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的可视化模板组件数据集
	 * 
	 * @param visibleModule
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleModuleList可视化模板组件数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(VisibleModuleEntity visibleModule, Map param, int pageSize,
			int pageNo);

	/**
	 * 保存一份组件，方便个性化编辑
	 * 
	 * @param template demo模板
	 * @param moduleKey 组件键
	 * @param templateId 模板
	 * @return 组件id
	 */
	String save(String template, String moduleKey, String templateId);

	/**
	 * 根据id删除组件
	 *
	 * @param id
	 * @return
	 */
	boolean deleteById(String id);

	/**
	 * 根据模板id获取模板中的所有模板组件，只要临时模板
	 * @param templateId 模板id
	 * @return
     */
	List<VisibleModuleVOTempEntity> getTempLateTempList(String templateId);

	/**
	 * 删除跟指定模板相关的所有组件
	 * @param templateId 模板
	 * @return 具体删除的数据条数
     */
	int deleteByTempldateId(String templateId);

	/**
	 * 新建组件并保存参数
	 * @param templateId 可视化模板id
	 * @param moduleKey 组件key
	 * @param template 基础模板
	 * @param catId 模板参数：栏目id
     * @param count 模板参数：获取数量
	 * @param image 是否必须包含缩略图
	 * @return 组件id
     */
	String saveModuleAndParam(String templateId, String moduleKey, String template, String catId, int count, int image);

	/**
	 * 获取组件的参数
	 * @param id 组件id
	 * @return 组件参数键值
     */
	Map<String,Object> getModuleParams(String id);

	/**
	 * 获取组件的参数
	 * @param module 组件实体
	 * @return 组件参数键值
     */
	Map<String,Object> getModuleParams(VisibleModuleEntity module);

	/**
	 * 保存图片组件以及组件的参数
	 *
	 * @param templateId 模板id
	 * @param moduleKey 组件key
	 * @param template 模板代码
	 * @param imageUrl 图片地址
	 * @param imageWidth 图片宽度
	 * @param imageHeight 图片高度
	 * @param description 描述
	 * @param linkUrl 链接地址
	 * @param blank 新页面打开（1、是；0、否）
	 * @return 组件id
	 */
	String saveImageModuleAndParam(String templateId, String moduleKey, String template, String imageUrl,
								   Integer imageWidth, Integer imageHeight, String description, String linkUrl, Integer blank);

	/**
	 * 获取模板中所有的组件
	 * @param templateId 模板id
	 * @return
     */
	List<VisibleModuleEntity> getListByTemplateId(String templateId);

	/**
	 * 获取模板中的组件列表，组件包含最终组件模板和参数
	 * @param visibleTemplateId 可视化模板id
	 * @return
     */
	List<VisibleModuleVOTemplateEntity> getTemplateAndParamsList(String visibleTemplateId);

	/**
	 * 保存导航组件以及参数
	 * @param templateId 模板id
	 * @param moduleKey 组件键
	 * @param template 组件模板
	 * @param navTitle 导航标题参数
	 * @param linkUrl 导航链接参数
	 * @param blank 导航是否打开新页面参数
	 * @return 组件id
	 */
    String saveNavModuleAndParam(String templateId, String moduleKey, String template, String[] navTitle, String[] linkUrl, Integer[] blank);

	/**
	 * 初始化链接地址，将所有地址都加上域名
	 * @param params
	 * @param domain 域名如（http://lmcms.leimingtech.com）
	 */
	void initUrl(Map<String,Object> params,String domain);

	/**
	 * 更新分页组件参数
	 * @param paramsId
	 * @param catId
     * @return
     */
	int updateVisinlePageParma(String paramsId, String catId);

	/**
	 * 保存分页组件参数及组件
	 * @param templateId
	 * @param moduleKey
	 * @param demoTemplate
	 * @param catId
     * @return
     */
	String saveVisinlePageParma(String templateId, String moduleKey, String demoTemplate, String catId);

	int updateVisinleContentListParma(String paramId, String catId, int count);

	String saveVisinleConentListParma(String templateId, String moduleKey, String demoTemplate, String catId, int count);

	/**
	 * 根据栏目id获取栏目的pagesize
	 * @param catId
	 * @return
     */
	String getContentListCount(String catId);

	/**
	 * 获取导航所选栏目路径
	 * @param catId
	 * @return
     */
	String getNavCatparam(String catId);
}
