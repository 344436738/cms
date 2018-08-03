package com.leimingtech.core.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leimingtech.core.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.base.entity.temp.BusinessConsultingEntity;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.BusinessConsultingServiceI;
import com.leimingtech.core.service.CommonService;


/**
 * @Title: interface
 * @Description: 业务咨询接口实现
 * @author
 * @date 2016-03-31 14:27:11
 * @version V1.0
 * 
 */
@Service("businessConsultingService")
@Transactional
public class BusinessConsultingServiceImpl implements BusinessConsultingServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	
	/**
	 * 保存业务咨询
	 * 
	 * @param businessConsulting
	 * @return
	 */
	public java.lang.String save(BusinessConsultingEntity businessConsulting) {
		return (java.lang.String) commonService.save(businessConsulting);
	}

	/**
	 * 更新业务咨询
	 * 
	 * @param businessConsulting
	 */
	@Override
	public void saveOrUpdate(BusinessConsultingEntity businessConsulting) {
		commonService.saveOrUpdate(businessConsulting);
	}

	/**
	 * 通过id获取业务咨询
	 * 
	 * @param id
	 *            业务咨询id
	 * @return
	 */
	@Override
	public BusinessConsultingEntity getEntity(java.lang.String id) {
		return commonService.getEntity(BusinessConsultingEntity.class, id);
	}

	/**
	 * 获取分页后的业务咨询数据集
	 * 
	 * @param businessConsulting
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return businessConsultingList业务咨询数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(BusinessConsultingEntity businessConsulting, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(BusinessConsultingEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, businessConsulting, param);
		cq.addOrder("createtime",SortDirection.desc);
		cq.eq("siteid", UserUtils.getSiteId());
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<BusinessConsultingEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("businessConsultingList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除业务咨询
	 * 
	 * @param businessConsulting
	 */
	@Override
	public void delete(BusinessConsultingEntity businessConsulting) {
		commonService.delete(businessConsulting);
	}
	
}