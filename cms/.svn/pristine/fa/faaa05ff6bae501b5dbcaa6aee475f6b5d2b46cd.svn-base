package com.leimingtech.wechat.service.impl.wechatenterprisetag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leimingtech.core.util.StringUtils;
import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;
import com.leimingtech.wechat.service.wechatenterpriseconfig.WechatEnterpriseConfigServiceI;
import com.leimingtech.wechat.util.WechatEnterpriseRequestUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.wechat.entity.wechatenterprisetag.WechatEnterpriseTagEntity;
import com.leimingtech.wechat.service.wechatenterprisetag.WechatEnterpriseTagServiceI;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;

/**
 * @Title: interface
 * @Description: 微信企业号标签接口实现
 * @author
 * @date 2017-03-24 11:26:02
 * @version V1.0
 * 
 */
@Service("wechatEnterpriseTagService")
@Transactional
public class WechatEnterpriseTagServiceImpl implements WechatEnterpriseTagServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	@Autowired
	private WechatEnterpriseConfigServiceI wechatEnterpriseConfigServiceI;
	
	/**
	 * 保存微信企业号标签
	 * 
	 * @param wechatEnterpriseTag
	 * @return
	 */
	public java.lang.String save(WechatEnterpriseTagEntity wechatEnterpriseTag) {
		return (java.lang.String) commonService.save(wechatEnterpriseTag);
	}

	/**
	 * 更新微信企业号标签
	 * 
	 * @param wechatEnterpriseTag
	 */
	@Override
	public void saveOrUpdate(WechatEnterpriseTagEntity wechatEnterpriseTag) {
		commonService.saveOrUpdate(wechatEnterpriseTag);
	}

	/**
	 * 通过id获取微信企业号标签
	 * 
	 * @param id
	 *            微信企业号标签id
	 * @return
	 */
	@Override
	public WechatEnterpriseTagEntity getEntity(java.lang.String id) {
		return commonService.getEntity(WechatEnterpriseTagEntity.class, id);
	}

	@Override
	public Map<String, Object> getPageList(WechatEnterpriseTagEntity wechatEnterpriseTag, Map param ,String enterpriseId) {
		CriteriaQuery cq = new CriteriaQuery(WechatEnterpriseTagEntity.class);
		HqlGenerateUtil.installHql(cq, wechatEnterpriseTag, param);
		cq.eq("enterpriseId",enterpriseId);
		cq.add();
		PageList pageList = commonService.getPageList(cq, false);
		List<WechatEnterpriseTagEntity> resultList = pageList.getResultList();
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatEnterpriseTagList", resultList);
		return m;
	}

	/**
	 * 删除微信企业号标签
	 * 
	 * @param wechatEnterpriseTag
	 */
	@Override
	public void delete(WechatEnterpriseTagEntity wechatEnterpriseTag) {
		commonService.delete(wechatEnterpriseTag);
	}

	/**
	 * 获取指定企业下的标签
	 * @param enterpriseId 请求接口所需值参数
	 *
	 */
	@Override
	public boolean getEnterpriseTaglist(String enterpriseId) {
		try{
			WechatEnterpriseConfigEntity wechatEnterpriseConfig = wechatEnterpriseConfigServiceI.getEntity(enterpriseId);
			if(wechatEnterpriseConfig != null){
				String accessToken = wechatEnterpriseConfigServiceI.accessToke(wechatEnterpriseConfig.getId());
				if(StringUtils.isNotEmpty(accessToken)){
					List<WechatEnterpriseTagEntity> wechatEnterpriseTagEntities = commonService.findByProperty(WechatEnterpriseTagEntity.class,"enterpriseId",enterpriseId);
					//同步企业号标签前删除该企业号之前同步的标签
					if(wechatEnterpriseTagEntities!=null && wechatEnterpriseTagEntities.size()>0){
						commonService.deleteAllEntitie(wechatEnterpriseTagEntities);
					}
					String url = "https://qyapi.weixin.qq.com/cgi-bin/tag/list?access_token="+accessToken;
					JSONObject jsonObject  = WechatEnterpriseRequestUtil.HttpRequest(url,"POST",null);
					if(null!=jsonObject){
						JSONArray jsonArray = (JSONArray) jsonObject.get("taglist");
						if(jsonArray != null && jsonArray.size()>0){
							for (int i = 0; i < jsonArray.size(); i++) {
								JSONObject json  = (JSONObject) jsonArray.get(i);
								WechatEnterpriseTagEntity wechatEnter = new WechatEnterpriseTagEntity();
								if(StringUtils.isNotEmpty(json.get("tagid"))){
									wechatEnter.setTagId(json.get("tagid").toString());
								}
								if(StringUtils.isNotEmpty(json.get("tagname"))){
									wechatEnter.setTagName(json.get("tagname").toString());
								}
								wechatEnter.setEnterpriseId(enterpriseId);
								commonService.saveOrUpdate(wechatEnter);
							}
							return true;
						}
					}
				}
			}else{
				return false;
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return false;
	}

}