package com.leimingtech.cms.service.impl.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.*;
import com.leimingtech.cms.service.visibletemplate.*;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.common.utils.date.DateUtils;
import com.leimingtech.core.util.oConvertUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 可视化模板组件接口实现
 * @author
 * @date 2016-09-28 14:26:32
 * @version V1.0
 * 
 */
@Service("visibleModuleService")
@Transactional
public class VisibleModuleServiceImpl implements VisibleModuleServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	/**内容参数接口*/
	@Autowired
	private VisibleContentParamServiceI visibleContentParamService;
	/**图片组件参数接口*/
	@Autowired
	private VisibleImageParamServiceI visibleImageParamService;
	@Autowired
	private VisibleNavParamServiceI visibleNavParamService;
	@Autowired
	private VisibleEmbedContentParamServicel visibleEmbedContentParamServicel;

	/**
	 * 保存可视化模板组件
	 * 
	 * @param visibleModule
	 * @return
	 */
	public java.lang.String save(VisibleModuleEntity visibleModule) {
		return (java.lang.String) commonService.save(visibleModule);
	}

	/**
	 * 更新可视化模板组件
	 * 
	 * @param visibleModule
	 */
	@Override
	public void saveOrUpdate(VisibleModuleEntity visibleModule) {
		commonService.saveOrUpdate(visibleModule);
	}

	/**
	 * 通过id获取可视化模板组件
	 * 
	 * @param id
	 *            可视化模板组件id
	 * @return
	 */
	@Override
	public VisibleModuleEntity getEntity(java.lang.String id) {
		return commonService.getEntity(VisibleModuleEntity.class, id);
	}

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
	@Override
	public Map<String, Object> getPageList(VisibleModuleEntity visibleModule, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(VisibleModuleEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, visibleModule, param);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<VisibleModuleEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleModuleList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 保存一份组件，方便个性化编辑
	 * 
	 * @param template demo模板
	 * @param moduleKey 组件键
	 * @param templateId 模板
	 * @return 组件id
	 */
	@Override
	public String save(String template, String moduleKey,String templateId) {
		VisibleModuleEntity module=new VisibleModuleEntity();
		module.setModuleKey(moduleKey);
		module.setTemplate(template);
		module.setTemplateTemp(template);
		module.setTemplateId(templateId);
		String userId= UserUtils.getUser().getId();
		Date date=new Date();
		module.setCreateBy(userId);
		module.setCreateTime(date);
		module.setUpdateBy(userId);
		module.setUpdateTime(date);
		module.setSiteId(UserUtils.getSiteId());
		return this.save(module);
	}

	/**
	 * 根据id删除组件
	 *
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteById(String id) {
		this.commonService.executeSql(" delete from visible_content_param where module_id = ? ", id);
		this.commonService.executeSql(" delete from visible_image_param where module_id = ? ", id);

		int row = this.commonService.executeSql("delete from visible_module where id = ? ", id);
		if (row > 0) {
			return true;
		}
		return false;
	}


	/**
	 * 根据模板id获取模板中的所有模板组件，只要临时模板
	 *
	 * @param templateId 模板id
	 * @return
	 */
	@Override
	public List<VisibleModuleVOTempEntity> getTempLateTempList(String templateId) {
		CriteriaQuery cq = new CriteriaQuery(VisibleModuleEntity.class);

		//指定要返回的列
		DetachedCriteria dc =cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("templateTemp").as("templateTemp"));
		pList.add(Projections.property("moduleKey").as("moduleKey"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(VisibleModuleVOTempEntity.class));

		cq.eq("templateId", templateId);
		cq.add();

		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 删除跟指定模板相关的所有组件
	 *
	 * @param templateId 模板
	 * @return 具体删除的数据条数
	 */
	@Override
	public int deleteByTempldateId(String templateId) {
		int removeContentParamsRow = visibleContentParamService.deleteByTemplateId(templateId);
		int removeImageParamsRow = visibleImageParamService.deleteByTemplateId(templateId);

		int row = this.commonService.executeSql("delete from visible_module where template_id = ? ", templateId);

		return row;
	}

	/**
	 * 新建组件并保存参数
	 *
	 * @param templateId   可视化模板id
	 * @param moduleKey    组件key
	 * @param template 基础模板
	 * @param catId        模板参数：栏目id
	 * @param count        模板参数：获取数量
	 * @param image 是否必须包含缩略图
	 * @return 组件id
	 */
	@Override
	public String saveModuleAndParam(String templateId, String moduleKey, String template, String catId, int count, int image) {

		VisibleModuleEntity module=new VisibleModuleEntity();
		module.setModuleKey(moduleKey);
		module.setTemplate(template);
		module.setTemplateTemp(template);
		module.setTemplateId(templateId);
		String userId=UserUtils.getUser().getId();
		Date date=new Date();
		module.setCreateBy(userId);
		module.setCreateTime(date);
		module.setUpdateBy(userId);
		module.setUpdateTime(date);
		module.setSiteId(UserUtils.getSiteId());
		String moduleId= this.save(module);
//		if(VisibleModuleConstants.LMCMS_MODULE_IMAGE_NEWS_LIST.equals(moduleKey)){
			VisibleContentParamEntity param=new VisibleContentParamEntity();
			param.setCatid(catId);
			param.setModuleKey(moduleKey);
			param.setTemplateId(templateId);
			param.setModuleId(moduleId);
			param.setCount(count);
			param.setImage(image);
			param.setCreateBy(userId);
			param.setUpdateBy(userId);
			param.setCreateTime(date);
			param.setUpdateTime(date);
			visibleContentParamService.save(param);



		return moduleId;
	}

	/**
	 * 获取组件的参数
	 *
	 * @param id 组件id
	 * @return 组件参数键值
	 */
	@Override
	public Map<String, Object> getModuleParams(String id) {
		VisibleModuleEntity module = getEntity(id);
		return getModuleParams(module);
	}

	/**
	 * 获取组件的参数
	 *
	 * @param module 组件实体
	 * @return 组件参数键值
	 */
	@Override
	public Map<String, Object> getModuleParams(VisibleModuleEntity module) {
		Map<String,Object> data=new HashMap<>();
		if(module==null){
			return new HashMap<String,Object>();
		}
		String moduleId=module.getId();
		String moduleKey=module.getModuleKey();

		if (VisibleModuleConstants.LMCMS_MODULE_LIST.equals(moduleKey) || VisibleModuleConstants.LMCMS_MODULE_IMAGE_NEWS_LIST.equals(moduleKey)||VisibleModuleConstants.LMCMS_MODULE_IMAGS_LIST.equals(moduleKey)) {
			Map<String, Object> m = visibleContentParamService.getParamByModuleId(moduleId);
			if (m != null) {
				data.putAll(m);
			}
		}

		if(VisibleModuleConstants.LMCMS_MODULE_PAINATION.equals(moduleKey)){
			Map<String, Object> m = visibleContentParamService.getPainationByModuleId(moduleId);
			if (m != null) {
				data.putAll(m);
			}
		}

		if (VisibleModuleConstants.LMCMS_MODULE_IMAGE.equals(moduleKey)) {
			Map<String, Object> m = visibleImageParamService.getParamByModuleId(moduleId);
			if (m != null) {
				data.putAll(m);
			}
		}

		if (VisibleModuleConstants.LMCMS_MODULE_IMAGS_LIST.equals(moduleKey)) {
			Map<String, Object> m = visibleImageParamService.getParamByModuleId(moduleId);
			if (m != null) {
				data.putAll(m);
			}
		}
		if (VisibleModuleConstants.LMCMS_MODULE_SINGLECONTENT.equals(moduleKey)) {
			Map<String, Object> m = visibleEmbedContentParamServicel.getEmbedCotentById(moduleId);
			if (m != null) {
				data.putAll(m);
			}
		}
		if (VisibleModuleConstants.LMCMS_MODULE_NAV.equals(moduleKey)) {
			List<Map<String, Object>> params = visibleNavParamService.getParamByModuleId(moduleId);
			data.put("navList", params);
		}
		if (VisibleModuleConstants.LMCMS_MODULE_CONTENT_LIST.equals(moduleKey)) {
			Map<String, Object> params = visibleContentParamService.getParam(moduleId);
			data.putAll(params);
		}

		return data;
	}

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
	@Override
	public String saveImageModuleAndParam(String templateId, String moduleKey, String template, String imageUrl,
										  Integer imageWidth, Integer imageHeight, String description, String linkUrl,
										  Integer blank) {
		Date date=new Date();
		String userId=UserUtils.getUser().getId();
		String siteId=UserUtils.getSiteId();

		VisibleModuleEntity module=new VisibleModuleEntity();
		module.setModuleKey(moduleKey);
		module.setTemplateId(templateId);
		module.setTemplate(template);
		module.setTemplateTemp(template);

		module.setCreateBy(userId);
		module.setCreateTime(date);
		module.setUpdateBy(userId);
		module.setUpdateTime(date);
		module.setSiteId(siteId);
		String moduleId = this.save(module);


		VisibleImageParamEntity imageParam = new VisibleImageParamEntity(moduleKey, templateId, moduleId, imageUrl,
				imageWidth, imageHeight, description, linkUrl, blank, userId, date, date, userId, siteId);

		this.visibleImageParamService.save(imageParam);
		return moduleId;
	}

	/**
	 * 获取模板中所有的组件
	 *
	 * @param templateId 模板id
	 * @return
	 */
	@Override
	public List<VisibleModuleEntity> getListByTemplateId(String templateId) {
		return commonService.findByProperty(VisibleModuleEntity.class, "templateId", templateId);
	}

	/**
	 * 获取模板中的组件列表，组件包含最终组件模板和参数
	 *
	 * @param visibleTemplateId 可视化模板id
	 * @return
	 */
	@Override
	public List<VisibleModuleVOTemplateEntity> getTemplateAndParamsList(String visibleTemplateId) {
		CriteriaQuery cq = new CriteriaQuery(VisibleModuleEntity.class);

		//指定要返回的列
		DetachedCriteria dc =cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("template").as("template"));
		pList.add(Projections.property("params").as("params"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(VisibleModuleVOTemplateEntity.class));

		cq.eq("templateId", visibleTemplateId);
		cq.add();

		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 保存导航组件以及参数
	 *
	 * @param templateId   模板id
	 * @param moduleKey    组件键
	 * @param template 组件模板
	 * @param navTitle     导航标题参数
	 * @param linkUrl      导航链接参数
	 * @param blank        导航是否打开新页面参数
	 * @return 组件id
	 */
	@Override
	public String saveNavModuleAndParam(String templateId, String moduleKey, String template, String[] navTitle, String[] linkUrl, Integer[] blank) {
		Date date=new Date();
		String userId=UserUtils.getUser().getId();
		String siteId=UserUtils.getSiteId();

		VisibleModuleEntity module=new VisibleModuleEntity();
		module.setModuleKey(moduleKey);
		module.setTemplateId(templateId);
		module.setTemplate(template);
		module.setTemplateTemp(template);

		module.setCreateBy(userId);
		module.setCreateTime(date);
		module.setUpdateBy(userId);
		module.setUpdateTime(date);
		module.setSiteId(siteId);
		String moduleId = this.save(module);
		VisibleNavParamEntity navParam;
		for (int i = 0; i < navTitle.length; i++) {
				navParam = new VisibleNavParamEntity(moduleKey, templateId, moduleId, navTitle[i],
						linkUrl[i],blank[i], userId, date, siteId);
				this.visibleNavParamService.save(navParam);
		}

		return moduleId;
	}

	/**
	 * 初始化链接地址，将所有地址都加上域名
	 *
	 * @param params
	 * @param domain 域名如（http://lmcms.leimingtech.com）
	 */
	@Override
	public void initUrl(Map<String, Object> params, String domain) {
		if(params==null || StringUtils.isBlank(domain)){
			return;
		}

		String imageUrl=oConvertUtils.getString(params.get("imageUrl"),"");
		if(StringUtils.isNotBlank(imageUrl) && !imageUrl.startsWith("http")){
			params.put("imageUrl",domain+imageUrl);
		}

		String linkUrl=oConvertUtils.getString(params.get("linkUrl"),"");
		if(StringUtils.isNotBlank(linkUrl) && !linkUrl.startsWith("http")){
			params.put("linkUrl",domain+linkUrl);
		}
	}

	/**
	 * 更新分页组件参数
	 * @param paramsId
	 * @param catId
	 * @return
	 */
	@Override
	public int updateVisinlePageParma(String paramsId, String catId) {
		String sql = "update visible_pagination_param set catid = ? where id = ?";
		return this.commonService.executeSql(sql,catId,paramsId);
	}


	/**
	 * 保存分页组件参数及组件
	 * @param templateId
	 * @param moduleKey
	 * @param template
	 * @param catId
	 * @return
	 */
	@Override
	public String saveVisinlePageParma(String templateId, String moduleKey, String template, String catId) {
		VisibleModuleEntity module=new VisibleModuleEntity();
		module.setModuleKey(moduleKey);
		module.setTemplate(template);
		module.setTemplateTemp(template);
		module.setTemplateId(templateId);
		String userId=UserUtils.getUser().getId();
		Date date=new Date();
		module.setCreateBy(userId);
		module.setCreateTime(date);
		module.setUpdateBy(userId);
		module.setUpdateTime(date);
		module.setSiteId(UserUtils.getSiteId());
		String moduleId= this.save(module);
		VisiblePaginationParamEntity visiblePaginationParamEntity = new VisiblePaginationParamEntity();
		visiblePaginationParamEntity.setCatId(catId);
		visiblePaginationParamEntity.setModuleKey(moduleKey);
		visiblePaginationParamEntity.setCreateTime(date);
		visiblePaginationParamEntity.setUpdateBy(userId);
		visiblePaginationParamEntity.setModuleId(moduleId);
		visiblePaginationParamEntity.setSiteId(UserUtils.getSiteId());
		visiblePaginationParamEntity.setTemplateId(templateId);
		commonService.save(visiblePaginationParamEntity);
		return moduleId;
	}

	/**
	 * 更新列表分页组件
	 * @param paramId
	 * @param catId
	 * @param count
     * @return
     */
	@Override
	public int updateVisinleContentListParma(String paramId, String catId ,int count) {
		String sql = "update visible_content_list_param set catid = ? , count =? where id = ?";
		return this.commonService.executeSql(sql,catId,count,paramId);
	}

	/**
	 * 保存列表分页组件
	 * @param templateId
	 * @param moduleKey
	 * @param demoTemplate
	 * @param catId
     * @return
     */
	@Override
	public String saveVisinleConentListParma(String templateId, String moduleKey, String demoTemplate, String catId,int count) {
		VisibleModuleEntity module=new VisibleModuleEntity();
		module.setModuleKey(moduleKey);
		module.setTemplate(demoTemplate);
		module.setTemplateTemp(demoTemplate);
		module.setTemplateId(templateId);
		String userId=UserUtils.getUser().getId();
		Date date=new Date();
		module.setCreateBy(userId);
		module.setCreateTime(date);
		module.setUpdateBy(userId);
		module.setUpdateTime(date);
		module.setSiteId(UserUtils.getSiteId());
		String moduleId= this.save(module);
		VisibleContentListParamEntity visiblePaginationParamEntity = new VisibleContentListParamEntity();
		visiblePaginationParamEntity.setCatId(catId);
		visiblePaginationParamEntity.setCount(count);
		visiblePaginationParamEntity.setModuleKey(moduleKey);
		visiblePaginationParamEntity.setCreateTime(date);
		visiblePaginationParamEntity.setUpdateBy(userId);
		visiblePaginationParamEntity.setModuleId(moduleId);
		visiblePaginationParamEntity.setSiteId(UserUtils.getSiteId());
		visiblePaginationParamEntity.setTemplateId(templateId);
		commonService.save(visiblePaginationParamEntity);
		return moduleId;
	}



	@Override
	public String getContentListCount(String catId) {
		ContentCatEntity catEntity = commonService.getEntity(ContentCatEntity.class,catId);
		return String.valueOf(catEntity.getPagesize());
	}

	@Override
	public String getNavCatparam(String catId) {
		ContentCatEntity catEntity = commonService.getEntity(ContentCatEntity.class,catId);
		return catEntity.getUrl();
	}
}