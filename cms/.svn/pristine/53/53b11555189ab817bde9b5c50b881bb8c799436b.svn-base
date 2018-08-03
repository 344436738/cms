package com.leimingtech.cms.service.impl.visibletemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVOControllerEntity;
import com.leimingtech.core.service.jedis.JedisClient;
import org.hibernate.criterion.*;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVODemoEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVOTemplateEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateModuleServiceI;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;

/**
 * @Title: interface
 * @Description: 可视化模板组件配置接口实现
 * @author
 * @date 2016-09-28 14:24:16
 * @version V1.0
 * 
 */
@Service("visibleTemplateModuleService")
@Transactional
public class VisibleTemplateModuleServiceImpl implements VisibleTemplateModuleServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	/**redis缓存操作接口*/
	@Autowired
	private JedisClient jedis;
	/**可视化模板组件id key前缀*/
	private static final String JEDIS_KEY = "visibleTemplateModule:id:";
	/**可视化模板组件集合key前缀*/
	private static final String JEDIS_LIST_KEY="visibleTemplateModule:";
	/**可视化模板组件key集合，方便批量清除缓存*/
	private static final String JEDIS_LIST_KEYS = "visibleTemplateModule:listkeys";
	
	/**
	 * 保存可视化模板组件配置
	 * 
	 * @param visibleTemplateModule
	 * @return
	 */
	public java.lang.String save(VisibleTemplateModuleEntity visibleTemplateModule) {
		String id = (java.lang.String) commonService.save(visibleTemplateModule);
		clearCache();
		return id;
	}

	/**
	 * 更新可视化模板组件配置
	 * 
	 * @param visibleTemplateModule
	 */
	@Override
	public void saveOrUpdate(VisibleTemplateModuleEntity visibleTemplateModule) {
		commonService.saveOrUpdate(visibleTemplateModule);
		clearCache();
	}

	/**
	 * 通过id获取可视化模板组件配置
	 * 
	 * @param id
	 *            可视化模板组件配置id
	 * @return
	 */
	@Override
	public VisibleTemplateModuleEntity getEntity(java.lang.String id) {
		return commonService.getEntity(VisibleTemplateModuleEntity.class, id);
	}

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
	@Override
	public Map<String, Object> getPageList(VisibleTemplateModuleEntity visibleTemplateModule, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateModuleEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, visibleTemplateModule, param);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<VisibleTemplateModuleEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleTemplateModuleList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除可视化模板组件配置
	 * 
	 * @param visibleTemplateModule
	 */
	@Override
	public void delete(VisibleTemplateModuleEntity visibleTemplateModule) {
		commonService.delete(visibleTemplateModule);
		clearCache();
	}

	/**
	 * 获取所有可视化模板组件，demo模板
	 * @return
	 */
	@Override
	public List<VisibleTemplateModuleVODemoEntity> AllDemo() {
		String key = JEDIS_LIST_KEY + "allDemo";

		List<VisibleTemplateModuleVODemoEntity> data = jedis.getList(key, VisibleTemplateModuleVODemoEntity.class);
		if (data != null) {
			return data;
		}

		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateModuleEntity.class);

		//指定要返回的列
		DetachedCriteria dc = cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("moduleKey").as("moduleKey"));
		pList.add(Projections.property("moduleName").as("moduleName"));
		pList.add(Projections.property("demo").as("demo"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(VisibleTemplateModuleVODemoEntity.class));

		cq.addOrder("sort", SortDirection.desc);
		cq.addOrder("createTime", SortDirection.asc);
		cq.add();
		data = commonService.getListByCriteriaQuery(cq, false);

		jedis.setEX(key,data);
		jedis.sadd(JEDIS_LIST_KEYS,key);
		return data;
	}

	/**
	 * 根据组件键获取配置模板
	 * @param moduleKey 组件key
	 * @return
	 */
	@Override
	public VisibleTemplateModuleVOTemplateEntity findByModuleKey(
			String moduleKey) {
		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateModuleEntity.class);

		// 指定要返回的列
		DetachedCriteria dc = cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("template").as("template"));
		pList.add(Projections.property("demo").as("demo"));
		pList.add(Projections.property("controllerCode").as("controllerCode"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers
				.aliasToBean(VisibleTemplateModuleVOTemplateEntity.class));
		cq.eq("moduleKey", moduleKey);
		cq.add();
		List<VisibleTemplateModuleVOTemplateEntity> template = commonService
				.getListByCriteriaQuery(cq, false);
		if (template != null && template.size() > 0) {
			return template.get(0);
		}
		return null;
	}

	/**
	 * 清除缓存
	 */
	private void clearCache(){
		Set<String> keys = jedis.smembers(JEDIS_LIST_KEYS);
		if (keys == null) {
			return;
		}
		for (String key : keys) {
			jedis.del(key);
		}
		jedis.del(JEDIS_LIST_KEYS);
	}

	/**
	 * 获取组件功能列表
	 *
	 * @return
	 */
	@Override
	public List<VisibleTemplateModuleVOControllerEntity> getControllerList() {

		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateModuleEntity.class);

		//指定要返回的列
		DetachedCriteria dc =cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("moduleKey").as("moduleKey"));
		pList.add(Projections.property("controllerCode").as("controllerCode"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(VisibleTemplateModuleVOControllerEntity.class));

		cq.add();

		return commonService.getListByCriteriaQuery(cq, false);
	}

	/**
	 * 获取组件列表，key为组件moduleKey;value为模板控制功能
	 *
	 * @return
	 */
	@Override
	public Map<String, String> getModuleControllerMap() {

		Map<String, String> m = new HashMap<String, String>();

		List<VisibleTemplateModuleVOControllerEntity> moduleList = this
				.getControllerList();

		if (moduleList != null && moduleList.size() > 0) {
			for (int i = 0; i < moduleList.size(); i++) {
				VisibleTemplateModuleVOControllerEntity controller = moduleList.get(i);
				m.put(controller.getModuleKey(), controller.getControllerCode());
			}
		}

		return m;
	}

	/**
	 * 获取所有组件
	 *
	 * @param keyword 根据关键字模糊查询组件名和组件键
	 * @return
	 */
	@Override
	public List<VisibleTemplateModuleEntity> getAllModule(String keyword) {
		CriteriaQuery cq = new CriteriaQuery(VisibleTemplateModuleEntity.class);
		if (StringUtils.isNotBlank(keyword)) {
			cq.or(Restrictions.like("moduleName", keyword, MatchMode.ANYWHERE), Restrictions.like("moduleKey", keyword, MatchMode.ANYWHERE));
		}
		cq.addOrder("sort", SortDirection.desc);
		cq.addOrder("createTime", SortDirection.desc);
		cq.add();
		List<VisibleTemplateModuleEntity> moduleList = commonService
				.getListByCriteriaQuery(cq, false);
		return moduleList;
	}

}