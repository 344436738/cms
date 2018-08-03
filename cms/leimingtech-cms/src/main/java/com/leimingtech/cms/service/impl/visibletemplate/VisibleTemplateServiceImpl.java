package com.leimingtech.cms.service.impl.visibletemplate;

import com.leimingtech.cms.core.util.FreemarkerUtils;
import com.leimingtech.cms.entity.visibletemplate.VisibleModuleEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleModuleServiceI;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateServiceI;
import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.core.common.CmsConstants;
import com.leimingtech.common.Globals;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.FileUtil;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import freemarker.template.TemplateException;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 可视化模板接口实现
 * @author
 * @date 2016-10-09 14:38:11
 * @version V1.0
 * 
 */
@Service("visibleTemplateService")
@Transactional
class VisibleTemplateServiceImpl implements VisibleTemplateServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	/**可视化模板组件接口*/
	@Autowired
	private VisibleModuleServiceI visibleModuleService;


	/**
	 * 保存可视化模板
	 * 
	 * @param visibleTemplate
	 * @return
	 */
	public java.lang.String save(VisibleTemplateEntity visibleTemplate) {
		return (java.lang.String) commonService.save(visibleTemplate);
	}

	/**
	 * 更新可视化模板
	 * 
	 * @param visibleTemplate
	 */
	@Override
	public void saveOrUpdate(VisibleTemplateEntity visibleTemplate) {
		commonService.saveOrUpdate(visibleTemplate);
	}

	/**
	 * 通过id获取可视化模板
	 * 
	 * @param id
	 *            可视化模板id
	 * @return
	 */
	@Override
	public VisibleTemplateEntity getEntity(java.lang.String id) {
		return commonService.getEntity(VisibleTemplateEntity.class, id);
	}

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
	@Override
	public Map<String, Object> getPageList(VisibleTemplateEntity visibleTemplate, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateEntity.class, pageSize, pageNo,
				"", "");
		cq.eq("siteId", UserUtils.getSiteId());
		cq.addOrder("createTime", SortDirection.asc);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<VisibleTemplateEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleTemplateList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除可视化模板
	 * 
	 * @param visibleTemplate
	 */
	@Override
	public void delete(VisibleTemplateEntity visibleTemplate) {
		visibleModuleService.deleteByTempldateId(visibleTemplate.getId());
		commonService.delete(visibleTemplate);
	}

	/**
	 * 获取指定站点中的可视化模板
	 * @param siteId
	 * @return
	 */
	@Override
	public List<VisibleTemplateEntity> getSiteTemplate(String siteId) {
		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateEntity.class);
		cq.eq("siteId", siteId);
		cq.addOrder("createTime", SortDirection.asc);
		cq.add();
		List<VisibleTemplateEntity> templateList = this.commonService.getListByCriteriaQuery(cq, false);
		return templateList;
	}

	/**
	 * 修改模板
	 *
	 * @param visibleTemplate 将要保存的模板数据
	 * @param moduleIds       模板中保留的组件
	 */
	@Override
	public boolean updateTemplate(VisibleTemplateEntity visibleTemplate, String[] moduleIds) {

		this.saveOrUpdate(visibleTemplate);//保存模板

		if(moduleIds==null){
			//如果当前模板中没有组件，将删除数据库中原有模板中的所有组件
			visibleModuleService.deleteByTempldateId(visibleTemplate.getId());
			return Boolean.TRUE;
		}

		List<VisibleModuleEntity> moduleList=visibleModuleService.getListByTemplateId(visibleTemplate.getId());
		if (moduleList != null && moduleList.size() > 0) {
			for (int i = 0; i < moduleList.size(); i++) {
				VisibleModuleEntity module = moduleList.get(i);
				if (!ArrayUtils.contains(moduleIds, module.getId())) {
					//将已经不使用的组件清除
					visibleModuleService.deleteById(module.getId());
				}else{
					Map<String, Object> params = visibleModuleService.getModuleParams(module);
					module.setTemplate(module.getTemplateTemp());
					module.setUpdateBy(visibleTemplate.getUpdateBy());
					module.setUpdateTime(visibleTemplate.getUpdateTime());
					JSONObject j = new JSONObject();
					j.putAll(params);
					module.setParams(j.toString());
					visibleModuleService.saveOrUpdate(module);
				}
			}
		}

		return Boolean.TRUE;

	}

	/**
	 * 创建一份可视化模板
	 *
	 * @param title
	 * @param templateType
	 * @param created
	 * @param createdby
	 * @param siteid
	 * @return
	 */
	@Override
	public String create(String title, int templateType, Date created, String createdby, String siteid) {
		VisibleTemplateEntity template =new VisibleTemplateEntity(templateType,title,createdby,created,siteid);
		return this.save(template);
	}

	@Override
	public void generateHtml(String title,String cssPath,String templateInfo,SiteEntity site){
		String templatePath = CmsConstants.getSiteTemplatePath(site);
		try {
			org.apache.commons.io.FileUtils.forceMkdir(new File(templatePath + "visibleTemplate/"));
		} catch (IOException e) {
			e.printStackTrace();
		}

		String siteVisibleTemplatePath = CmsConstants.getWWWROOT()+"/static/visibleTemplate.html";

		String siteVisibleTemplate = FileUtil.readText(new File(siteVisibleTemplatePath), "utf-8");

		String domain = site.getProtocol() + site.getDomain();

		String[] cssArray=null;
		if(StringUtils.isNotEmpty(cssPath)){
			cssArray=cssPath.split(";");
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("view", templateInfo);
		data.put("contextpath", Globals.CONTEXTPATH);
		data.put("domain", domain);
		data.put("cssArray",cssArray);

		String html = null;
		try {
			html = FreemarkerUtils.renderString(siteVisibleTemplate, data);
		} catch (IOException | TemplateException e) {
			e.printStackTrace();
		}

		FileUtil.writeText(templatePath + "visibleTemplate/" + title + ".html",
				html, "utf-8");
	}

	/**
	 * 获取所有可视化模板
	 *
	 * @return
	 */
	@Override
	public List<VisibleTemplateEntity> getAll() {
		return this.commonService.getList(VisibleTemplateEntity.class);
	}

}