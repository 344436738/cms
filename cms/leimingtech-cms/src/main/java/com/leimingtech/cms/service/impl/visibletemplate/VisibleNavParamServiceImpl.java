package com.leimingtech.cms.service.impl.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.VisibleNavParamEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleNavParamServiceI;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.util.oConvertUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @Title: interface
 * @Description: 导航条件接口实现
 * @author
 * @date 2016-12-15 20:53:00
 * @version V1.0
 * 
 */
@Service("visibleNavParamService")
@Transactional
public class VisibleNavParamServiceImpl implements VisibleNavParamServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	
	/**
	 * 保存导航条件
	 * 
	 * @param visibleNavParam
	 * @return
	 */
	public java.lang.String save(VisibleNavParamEntity visibleNavParam) {
		return (java.lang.String) commonService.save(visibleNavParam);
	}

	/**
	 * 更新导航条件
	 * 
	 * @param visibleNavParam
	 */
	@Override
	public void saveOrUpdate(VisibleNavParamEntity visibleNavParam) {
		commonService.saveOrUpdate(visibleNavParam);
	}

	/**
	 * 通过id获取导航条件
	 * 
	 * @param id
	 *            导航条件id
	 * @return
	 */
	@Override
	public VisibleNavParamEntity getEntity(java.lang.String id) {
		return commonService.getEntity(VisibleNavParamEntity.class, id);
	}

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
	@Override
	public Map<String, Object> getPageList(VisibleNavParamEntity visibleNavParam, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(VisibleNavParamEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, visibleNavParam, param);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<VisibleNavParamEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleNavParamList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除导航条件
	 * 
	 * @param visibleNavParam
	 */
	@Override
	public void delete(VisibleNavParamEntity visibleNavParam) {
		commonService.delete(visibleNavParam);
	}

	/**
	 * 获取组件参数
	 *
	 * @param moduleId 组件id
	 * @return
	 */
	@Override
	public List<Map<String,Object>> getParamByModuleId(String moduleId) {
		CriteriaQuery cq = new CriteriaQuery(VisibleNavParamEntity.class);

		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("title").as("title"));
		pList.add(Projections.property("linkUrl").as("linkUrl"));
		pList.add(Projections.property("blank").as("blank"));

		DetachedCriteria dc = cq.getDetachedCriteria();
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(VisibleNavParamEntity.class));

		cq.eq("moduleId", moduleId);
		cq.add();

		List<VisibleNavParamEntity> data = this.commonService.getListByCriteriaQuery(cq, false);

		List<Map<String, Object>> paramList = new ArrayList<>();
		if (data != null && data.size() > 0) {
			for (VisibleNavParamEntity navParam : data) {
				Map<String, Object> params = new HashMap<>();
				params.put("paramsId", navParam.getId());
				params.put("title", navParam.getTitle());
				params.put("linkUrl", navParam.getLinkUrl());
				params.put("blank", navParam.getBlank());
				paramList.add(params);
			}
		}

		return paramList;
	}

	/**
	 * 更新导航参数
	 *  @param templateId 模板id
	 * @param moduleId   所属组件id
	 * @param paramsId 导航参数id
	 * @param moduleKey  组件键
	 * @param template   模板
	 * @param title      标题
	 * @param linkUrl    链接
	 * @param blank      是否跳转到新页面
	 */
	@Override
	public void updateNavModuleParam(String templateId, String moduleId, String[] paramsId, String moduleKey, String template,
									 String[] title, String[] linkUrl, Integer[] blank) {

		Date date = new Date();
		String userId = UserUtils.getUser().getId();
		String siteId = UserUtils.getSiteId();

		Set<String> paramSet = new HashSet<>();
		CollectionUtils.addAll(paramSet, paramsId);

		List<VisibleNavParamEntity> navParamList = this.getListByModuleId(moduleId);
		if (navParamList == null || navParamList.size() == 0) {
			VisibleNavParamEntity navParam;
			for (int i = 0; i < title.length; i++) {
					navParam = new VisibleNavParamEntity(moduleKey, templateId, moduleId, title[i],
							linkUrl[i], blank[i], userId, date, siteId);
					this.save(navParam);
			}
			return;
		}

		for (VisibleNavParamEntity nav : navParamList) {
			if (!paramSet.contains(nav.getId())) {
				this.delete(nav);
				continue;
			}
			int index = ArrayUtils.indexOf(paramsId, nav.getId());
			if (index != -1) {
				nav.setTitle(title[index]);
				nav.setLinkUrl(linkUrl[index]);
				nav.setBlank(oConvertUtils.getInt(blank[index], 0));
				nav.setUpdateBy(userId);
				nav.setUpdateTime(date);
				this.saveOrUpdate(nav);
			}
		}
	}

	@Override
	public String saveNavParam(String navModuleId, String templateId, String moduleKey, String navTitle, String linkUrl, Integer blank) {
		Date date=new Date();
		String userId= UserUtils.getUser().getId();
		String siteId=UserUtils.getSiteId();
		VisibleNavParamEntity visibleNavParamEntity = new VisibleNavParamEntity();
		visibleNavParamEntity.setCreateTime(date);
				visibleNavParamEntity.setModuleKey(moduleKey);
		visibleNavParamEntity.setModuleId(navModuleId);
				visibleNavParamEntity.setUpdateBy(userId);
		visibleNavParamEntity.setSiteId(siteId);
				visibleNavParamEntity.setLinkUrl(linkUrl);
		visibleNavParamEntity.setTitle(navTitle);
				visibleNavParamEntity.setBlank(blank);
		visibleNavParamEntity.setTemplateId(templateId);
		commonService.save(visibleNavParamEntity);
		return visibleNavParamEntity.getId();
	}

	/**
	 * 获取组件下的所有导航参数
	 * @param moduleId
	 * @return
	 */
	private List<VisibleNavParamEntity> getListByModuleId(String moduleId) {
		List<VisibleNavParamEntity> navParamList = this.commonService.findByProperty(VisibleNavParamEntity.class, "moduleId", moduleId);
		return navParamList;
	}

}