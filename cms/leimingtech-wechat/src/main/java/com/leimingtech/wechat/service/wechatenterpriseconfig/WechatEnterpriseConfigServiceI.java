package com.leimingtech.wechat.service.wechatenterpriseconfig;

import java.util.List;
import java.util.Map;

import com.leimingtech.wechat.entity.wechatcorpsite.WechatCorpSiteEntity;
import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;

/**
 * @Title: interface
 * @Description: 微信企业号配置类接口
 * @author
 * @date 2017-03-24 11:17:22
 * @version V1.0
 * 
 */
public interface WechatEnterpriseConfigServiceI {

	/**
	 * 保存微信企业号配置类
	 * 
	 * @param wechatEnterpriseConfigEntity
	 * @return
	 */
	java.lang.String save(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity);

	/**
	 * 更新微信企业号配置类
	 * 
	 * @param wechatEnterpriseConfigEntity
	 */
	void saveOrUpdate(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity);

	/**
	 * 通过id获取微信企业号配置类
	 * 
	 * @param id
	 *            微信企业号配置类id
	 * @return
	 */
	WechatEnterpriseConfigEntity getEntity(java.lang.String id);

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
	Map<String, Object> getPageList(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity, Map param, int pageSize,
									int pageNo);

	/**
	 * 删除微信企业号配置类
	 * 
	 * @param wechatEnterpriseConfigEntity
	 */
	void delete(WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity);

	/**
	 * 检验accessToken是否过期
	 */
	String accessToke(String enterpriseId);

	/**
	 * 保存站点绑定的企业号
	 * @param configCheck
	 * @param siteId
     */
	void saveWechatRelevance(String[] configCheck, String siteId);

	/**
	 * 根据站点id获取关联的企业号
	 * @param siteId
	 * @return
     */
	List<WechatCorpSiteEntity> getConfigList(String siteId);
}
