package com.leimingtech.wechat.service.impl.wechatenterprisecontent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.wechat.entity.wechatenterprisecontent.WechatEnterpriseContentEntity;
import com.leimingtech.wechat.service.wechatenterprisecontent.WechatEnterpriseContentServiceI;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;

/**
 * @Title: interface
 * @Description: 企业号推送内容接口实现
 * @author
 * @date 2017-03-28 08:49:36
 * @version V1.0
 * 
 */
@Service("wechatEnterpriseContentService")
@Transactional
public class WechatEnterpriseContentServiceImpl implements WechatEnterpriseContentServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	
	/**
	 * 保存企业号推送内容
	 * 
	 * @param wechatEnterpriseContent
	 * @return
	 */
	public java.lang.String save(WechatEnterpriseContentEntity wechatEnterpriseContent) {
		return (java.lang.String) commonService.save(wechatEnterpriseContent);
	}

	/**
	 * 更新企业号推送内容
	 * 
	 * @param wechatEnterpriseContent
	 */
	@Override
	public void saveOrUpdate(WechatEnterpriseContentEntity wechatEnterpriseContent) {
		commonService.saveOrUpdate(wechatEnterpriseContent);
	}

	/**
	 * 通过id获取企业号推送内容
	 * 
	 * @param id
	 *            企业号推送内容id
	 * @return
	 */
	@Override
	public WechatEnterpriseContentEntity getEntity(java.lang.String id) {
		return commonService.getEntity(WechatEnterpriseContentEntity.class, id);
	}

	/**
	 * 获取分页后的企业号推送内容数据集
	 *
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return wechatEnterpriseContentList企业号推送内容数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(String id,
										   int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(WechatEnterpriseContentEntity.class, pageSize, pageNo,
				"", "");
		cq.eq("configId",id);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<WechatEnterpriseContentEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();

		m.put("wechatEnterpriseContentList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除企业号推送内容
	 * 
	 * @param wechatEnterpriseContent
	 */
	@Override
	public void delete(WechatEnterpriseContentEntity wechatEnterpriseContent) {
		commonService.delete(wechatEnterpriseContent);
	}

	@Override
	public List<WechatEnterpriseContentEntity> enterpriseCotentList(String enterprisePushId) {
		List<WechatEnterpriseContentEntity>contentEntityList = commonService.findByProperty(WechatEnterpriseContentEntity.class,"pushId",enterprisePushId);
		return contentEntityList;
	}

}