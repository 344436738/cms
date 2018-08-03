package com.leimingtech.cms.service.impl.contribute;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leimingtech.core.util.UserUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.cms.entity.contribute.ContentCatVO;
import com.leimingtech.cms.entity.contribute.ContributeConfigEntity;
import com.leimingtech.cms.service.contribute.ContributeConfigServiceI;
import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.oConvertUtils;

/**
 * @Title: interface
 * @Description: 投稿配置接口实现
 * @author
 * @date 2016-09-05 09:22:08
 * @version V1.0
 * 
 */
@Service("contributeConfigService")
@Transactional
public class ContributeConfigServiceImpl implements ContributeConfigServiceI {

	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;

	/**
	 * 保存投稿配置
	 * 
	 * @param contributeConfig
	 * @return
	 */
	public java.lang.String save(ContributeConfigEntity contributeConfig) {
		
		String id = (String) commonService.save(contributeConfig);
		return id;
	}
	

	/**
	 * 更新投稿配置
	 * 
	 * @param contributeConfig
	 */
	@Override
	public void saveOrUpdate(ContributeConfigEntity contributeConfig) {
		
		if(StringUtils.isBlank(contributeConfig.getDepartIds())&&StringUtils.isBlank(contributeConfig.getMemberIds())){
			contributeConfig.setOpenFlag(1);
		}else{
			contributeConfig.setOpenFlag(0);
		}
		
		contributeConfig.setUpdateBy(UserUtils.getUser().getId());
		contributeConfig.setUpdateTime(new Date());
		
		commonService.saveOrUpdate(contributeConfig);
	}

	/**
	 * 通过id获取投稿配置
	 * 
	 * @param id
	 *            投稿配置id
	 * @return
	 */
	@Override
	public ContributeConfigEntity getEntity(java.lang.String id) {
		return commonService.getEntity(ContributeConfigEntity.class, id);
	}

	/**
	 * 获取分页后的投稿配置数据集
	 * 
	 * @param contributeConfig
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return contributeConfigList投稿配置数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(
			ContributeConfigEntity contributeConfig, Map param, int pageSize,
			int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(ContributeConfigEntity.class,
				pageSize, pageNo, "", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, contributeConfig, param);
		cq.addOrder("sort", SortDirection.asc);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<ContributeConfigEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("contributeConfigList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}
	
	/**
	 * 删除投稿配置
	 * 
	 * @param contributeConfig
	 */
	@Override
	public void delete(ContributeConfigEntity contributeConfig) {
		commonService.delete(contributeConfig);
	}

	@Override
	public void add(String catId, String catTitle, String siteId) {

		ContributeConfigEntity contributeConfig = new ContributeConfigEntity();

		String userId = UserUtils.getUser().getId();
		Date date = new Date();

		contributeConfig.setCatId(catId);
		contributeConfig.setCatName(catTitle);
		contributeConfig.setOpenFlag(1);
		contributeConfig.setSort(getMaxSortBySiteId(siteId) + 1);
		contributeConfig.setSiteId(siteId);
		contributeConfig.setCreateTime(date);
		contributeConfig.setCreateBy(userId);
		contributeConfig.setUpdateBy(userId);
		contributeConfig.setUpdateTime(date);
		contributeConfig.setDepartIds("");
		contributeConfig.setMemberIds("");

		this.save(contributeConfig);
	}

	@Override
	public void deleteByCatId(String catId) {
		this.commonService.executeSql("delete from cms_contribute_config where catId = ? ",catId);
	}

	/**
	 * 按照数据进行调整排序值
	 * @param ids
	 */
	@Override
	public void updateSort(String[] ids) {
		if(ids==null || ids.length==0){
			return;
		}
		
		for (int i = 0; i < ids.length; i++) {
			updateSort(ids[i],i+1);
		}
	}
	
	/**
	 * 修改单个字段的排序值
	 * @param id
	 * @param newSort
	 * @return 修改时受影响的行数 大于0证明已经更新成功
	 */
	private int updateSort(String id, int newSort) {
		String sql = "update cms_contribute_config set sort = ? where id = ?";
		return commonService.executeSql(sql, newSort, id);
	}
	
	/**
	 * 获取指定方案中的最大排序值
	 * 
	 * @param modelId
	 * @return
	 */
	@Override
	public int getMaxSortBySiteId(String siteId) {
		String sql = "select max(sort) max from cms_contribute_config where site_id = ?";
		Map<String, Object> m = commonService.findOneForJdbc(sql, siteId);
		int maxSort = oConvertUtils.getInt(m.get("max"), 0);
		return maxSort;
	}

	/**
	 * 根据栏目名模糊查询，根据站点筛选
	 */
	@Override
	public List<ContributeConfigEntity> getAllList(String catName,
			String siteId) {
		CriteriaQuery cq = new CriteriaQuery(ContributeConfigEntity.class);
		
		//指定要返回的列
		DetachedCriteria dc =cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList(); 
		pList.add(Projections.property("id").as("id"));  
		pList.add(Projections.property("catName").as("catName"));  
		pList.add(Projections.property("openFlag").as("openFlag"));  
		pList.add(Projections.property("departIds").as("departIds"));  
		pList.add(Projections.property("memberIds").as("memberIds"));  
		dc.setProjection(pList);  
		dc.setResultTransformer(Transformers.aliasToBean(ContributeConfigEntity.class)); 
		
		cq.eq("siteId", siteId);
		if(StringUtils.isNotBlank(catName)){
			cq.like("catName", catName, MatchMode.ANYWHERE);
		}
		cq.addOrder("sort", SortDirection.asc);
		cq.add();
		List<ContributeConfigEntity> resultList = commonService.getListByCriteriaQuery(cq, false);
		return resultList;
	}


	@Override
	public List<ContentCatVO> getContentCatList(String siteId,
			String[] departs, String memberId) {
//		CriteriaQuery cq = new CriteriaQuery(ContributeConfigEntity.class);
//		
//		//指定要返回的列
//		DetachedCriteria dc =cq.getDetachedCriteria();
//		ProjectionList pList = Projections.projectionList(); 
//		pList.add(Projections.property("catId").as("catId"));  
//		pList.add(Projections.property("catName").as("catName"));  
//		dc.setProjection(pList);  
//		dc.setResultTransformer(Transformers.aliasToBean(ContentCatVO.class));
//		cq.eq("siteId", siteId);
//		
//		cq.add(Restrictions.or(Restrictions.eq("openFlag", 1),Restrictions.or(Restrictions.in("departIds",departs), Restrictions.like("memberIds",memberId,MatchMode.ANYWHERE))));
//		
//		cq.addOrder("sort", SortDirection.asc);
//		cq.add();
//		List<ContentCatVO> resultList = commonService.getListByCriteriaQuery(cq, false);
		
		List<Object> params=new ArrayList<Object>();
		
		StringBuilder hql=new StringBuilder();
		hql.append(" select new "+ContentCatVO.class.getCanonicalName()+"(catId,catName) ");
		hql.append(" from "+ContributeConfigEntity.class.getSimpleName()+" ");
		hql.append(" where siteId= ? and ");
		params.add(siteId);
		hql.append(" ( ");
		hql.append(" openFlag = 1 ");
		hql.append(" or memberIds like ? ");
		params.add("%"+memberId+",%");
		
		if(departs!=null && departs.length>0){
			for (int i = 0; i < departs.length; i++) {
				hql.append(" or departIds like ? ");
				params.add("%"+departs[i]+",%");
			}
		}
		
		hql.append(" ) ");
		
		hql.append(" order by sort asc ");
		
		List<ContentCatVO> list=commonService.findHql(hql.toString(), params.toArray());
		
		return list;
	}
	
}