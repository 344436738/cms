package com.leimingtech.wechat.service.impl.wechatenterpriseconfig;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.wechat.entity.wechatcorpsite.WechatCorpSiteEntity;
import com.leimingtech.wechat.util.WechatEnterpriseRequestUtil;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;
import com.leimingtech.wechat.service.wechatenterpriseconfig.WechatEnterpriseConfigServiceI;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;

/**
 * @Title: interface
 * @Description: 微信企业号配置类接口实现
 * @author
 * @date 2017-03-24 11:17:22
 * @version V1.0
 * 
 */
@Service("wechatEnterpriseConfigEntityService")
@Transactional
public class WechatEnterpriseConfigServiceImpl implements WechatEnterpriseConfigServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	
	/**
	 * 保存微信企业号配置类
	 * 
	 * @param wechatEnterpriseConfigEntity
	 * @return
	 */
	public java.lang.String save(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity) {
		Date date = new Date();
		String userId = UserUtils.getSite().getId();
		wechatEnterpriseConfigEntity.setCreatetime(date);
		wechatEnterpriseConfigEntity.setCreateBy(userId);
		commonService.save(wechatEnterpriseConfigEntity);
		return wechatEnterpriseConfigEntity.getId();
	}

	/**
	 * 更新微信企业号配置类
	 * 
	 * @param wechatEnterpriseConfigEntity
	 */
	@Override
	public void saveOrUpdate(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity) {
		commonService.saveOrUpdate(wechatEnterpriseConfigEntity);
	}

	/**
	 * 通过id获取微信企业号配置类
	 * 
	 * @param id
	 *            微信企业号配置类id
	 * @return
	 */
	@Override
	public WechatEnterpriseConfigEntity getEntity(java.lang.String id) {
		return commonService.getEntity(WechatEnterpriseConfigEntity.class, id);
	}

	/**
	 * 获取分页后的微信企业号配置类数据集
	 * 
	 * @param wechatEnterpriseConfigEntity
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return wechatEnterpriseConfigEntityList微信企业号配置类数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity, Map param,
										   int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(WechatEnterpriseConfigEntity.class, pageSize, pageNo,
				"", "");
		//查询条件组装器
		HqlGenerateUtil.installHql(cq, wechatEnterpriseConfigEntity, param);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<WechatEnterpriseConfigEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		CriteriaQuery corpSiteCq = new CriteriaQuery(WechatCorpSiteEntity.class);
		DetachedCriteria dc = corpSiteCq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("corpId").as("corpId"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(WechatCorpSiteEntity.class));
		corpSiteCq.eq("siteId", UserUtils.getSiteId());
		corpSiteCq.add();
		List<WechatCorpSiteEntity> wechatCorpSiteEntityList = commonService.getListByCriteriaQuery(corpSiteCq,true);
		String configList="";
		if(wechatCorpSiteEntityList!=null && wechatCorpSiteEntityList.size()>0){
			for(WechatCorpSiteEntity wechatCorpSiteEntity : wechatCorpSiteEntityList){
				configList = wechatCorpSiteEntity.getCorpId()+",";
			}
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseConfigEntityList", resultList);
		m.put("configList",configList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除微信企业号配置类
	 * 
	 * @param wechatEnterpriseConfigEntity
	 */
	@Override
	public void delete(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity) {
		commonService.delete(wechatEnterpriseConfigEntity);
	}

	/**
	 * 校验accessToken是否过期
	 * @param enterpriseId
	 * @return
     */
	@Override
	public String accessToke(String enterpriseId) {
		if(StringUtils.isNotEmpty(enterpriseId)){
			WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity = commonService.get(WechatEnterpriseConfigEntity.class,enterpriseId);
			if(wechatEnterpriseConfigEntity==null){
				return null;
			}
			Date date = new Date();
			long accessTime = Long.parseLong(wechatEnterpriseConfigEntity.getAccessTokenTime());
			long time = date.getTime()-accessTime;
			long i  =  time/1000;
			if(i<=7200){
				return wechatEnterpriseConfigEntity.getAccessToken();
			}else {
				String accessToken = WechatEnterpriseRequestUtil.getAccessToKen(wechatEnterpriseConfigEntity.getCorpId(),wechatEnterpriseConfigEntity.getCorpSecret());
				wechatEnterpriseConfigEntity.setAccessToken(accessToken);
				wechatEnterpriseConfigEntity.setAccessTokenTime(String.valueOf(date.getTime()));
				commonService.save(wechatEnterpriseConfigEntity);
				return accessToken;
			}
		}
		return null;
	}

	/**
	 * 保存站点绑定的企业号
	 * @param configCheck
	 * @param siteId
     */
	@Override
	public void saveWechatRelevance(String[] configCheck, String siteId) {
		//删除之前保留的绑定信息
		List<WechatCorpSiteEntity> wechatCorpSiteEntityList = commonService.findByProperty(WechatCorpSiteEntity.class,"siteId",siteId);
		if(wechatCorpSiteEntityList != null && wechatCorpSiteEntityList.size()>0){
			commonService.deleteAllEntitie(wechatCorpSiteEntityList);
		}
		if(configCheck!=null && configCheck.length>0){
			for(int i = 0;i<configCheck.length;i++){
				WechatCorpSiteEntity wechatCorpSite = new WechatCorpSiteEntity();
				wechatCorpSite.setCorpId(configCheck[i]);
				WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity = commonService.getEntity(WechatEnterpriseConfigEntity.class,configCheck[i]);
				wechatCorpSite.setCorpName(wechatEnterpriseConfigEntity.getCorpName());
				wechatCorpSite.setCreateTime(new Date());
				wechatCorpSite.setSiteId(siteId);
				wechatCorpSite.setCreateBy(UserUtils.getUser().getUserName());
				commonService.save(wechatCorpSite);
			}
		}
	}

	/**
	 * 根据站点id获取关联的企业号
	 * @param siteId
	 * @return
     */
	@Override
	public List<WechatCorpSiteEntity> getConfigList(String siteId) {
		List<WechatCorpSiteEntity> wechatCorpSiteEntityList = commonService.findByProperty(WechatCorpSiteEntity.class,"siteId",siteId);
		if(wechatCorpSiteEntityList!=null && wechatCorpSiteEntityList.size()>0){
			return  wechatCorpSiteEntityList;
		}
		return null;
	}
}