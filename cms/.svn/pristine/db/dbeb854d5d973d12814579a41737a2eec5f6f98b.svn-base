package com.leimingtech.wechat.service.wechatenterprisepush;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;
import com.leimingtech.wechat.entity.wechatenterprisepush.WechatenterprisePushEntity;
import net.sf.json.JSONArray;

/**
 * @Title: interface
 * @Description: 企业号推送接口
 * @author
 * @date 2017-03-28 16:16:57
 * @version V1.0
 * 
 */
public interface WechatenterprisePushServiceI {

	/**
	 * 保存企业号推送
	 * 
	 * @param wechatenterprisePush
	 * @return
	 */
	java.lang.String save(WechatenterprisePushEntity wechatenterprisePush);

	/**
	 * 更新企业号推送
	 * 
	 * @param wechatenterprisePush
	 */
	void saveOrUpdate(WechatenterprisePushEntity wechatenterprisePush);

	/**
	 * 通过id获取企业号推送
	 * 
	 * @param id
	 *            企业号推送id
	 * @return
	 */
	WechatenterprisePushEntity getEntity(java.lang.String id);

	/**
	 * 获取分页后的企业号推送数据集
	 * 
	 * @param wechatenterprisePush
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return wechatenterprisePushList企业号推送数据集 pageCount总页数
	 */
	Map<String, Object> getPageList(WechatenterprisePushEntity wechatenterprisePush, Map param, int pageSize,
			int pageNo);

	/**
	 * 删除企业号推送
	 * 
	 * @param wechatenterprisePush
	 */
	void delete(WechatenterprisePushEntity wechatenterprisePush);

	boolean pushContents(String pushId);


	/**
	 * 获取全部添加的企业号
	 * @return
     */
	List<WechatEnterpriseConfigEntity> getConfigList();

	String save(String[] contentId, String tagList, String[] contentIds, String[] title, String enterpriseCorpId, String enterprisePushId, String[] author, String[] description, String[] url, String[] picurl, String[] catId);
}
