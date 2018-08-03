package com.leimingtech.wechat.service.wechatenterprisecontent;

import java.util.List;
import java.util.Map;

import com.leimingtech.wechat.entity.wechatenterprisecontent.WechatEnterpriseContentEntity;

/**
 * @Title: interface
 * @Description: 企业号推送内容接口
 * @author
 * @date 2017-03-28 08:49:36
 * @version V1.0
 * 
 */
public interface WechatEnterpriseContentServiceI {

	/**
	 * 保存企业号推送内容
	 * 
	 * @param wechatEnterpriseContent
	 * @return
	 */
	java.lang.String save(WechatEnterpriseContentEntity wechatEnterpriseContent);

	/**
	 * 更新企业号推送内容
	 * 
	 * @param wechatEnterpriseContent
	 */
	void saveOrUpdate(WechatEnterpriseContentEntity wechatEnterpriseContent);

	/**
	 * 通过id获取企业号推送内容
	 * 
	 * @param id
	 *            企业号推送内容id
	 * @return
	 */
	WechatEnterpriseContentEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的企业号推送内容数据集
	 * 
	 * @param wechatEnterpriseContent
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return wechatEnterpriseContentList企业号推送内容数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(String param, int pageSize,
									int pageNo);

	/**
	 * 删除企业号推送内容
	 * 
	 * @param wechatEnterpriseContent
	 */
	void delete(WechatEnterpriseContentEntity wechatEnterpriseContent);

	/**
	 * 获取内容
	 * @param enterprisePushId
	 * @return
     */
	List<WechatEnterpriseContentEntity>   enterpriseCotentList(String enterprisePushId);
}
