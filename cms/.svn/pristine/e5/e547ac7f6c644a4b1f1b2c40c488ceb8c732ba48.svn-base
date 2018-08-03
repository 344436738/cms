package com.leimingtech.wechat.service.wechatenterprisetag;

import java.util.Map;

import com.leimingtech.wechat.entity.wechatenterprisetag.WechatEnterpriseTagEntity;

/**
 * @Title: interface
 * @Description: 微信企业号标签接口
 * @author
 * @date 2017-03-24 11:26:02
 * @version V1.0
 * 
 */
public interface WechatEnterpriseTagServiceI {

	/**
	 * 保存微信企业号标签
	 * 
	 * @param wechatEnterpriseTag
	 * @return
	 */
	java.lang.String save(WechatEnterpriseTagEntity wechatEnterpriseTag);

	/**
	 * 更新微信企业号标签
	 * 
	 * @param wechatEnterpriseTag
	 */
	void saveOrUpdate(WechatEnterpriseTagEntity wechatEnterpriseTag);

	/**
	 * 通过id获取微信企业号标签
	 * 
	 * @param id
	 *            微信企业号标签id
	 * @return
	 */
	WechatEnterpriseTagEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的微信企业号标签数据集
	 * 
	 * @param wechatEnterpriseTag
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @return wechatEnterpriseTagList微信企业号标签数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(WechatEnterpriseTagEntity wechatEnterpriseTag, Map param,String enterpriseId);

	/**
	 * 删除微信企业号标签
	 * 
	 * @param wechatEnterpriseTag
	 */
	void delete(WechatEnterpriseTagEntity wechatEnterpriseTag);

	/**
	 * 获取指定企业号下的标签
	 * @param enterpriseId
	 */
	boolean getEnterpriseTaglist(String enterpriseId);
}
