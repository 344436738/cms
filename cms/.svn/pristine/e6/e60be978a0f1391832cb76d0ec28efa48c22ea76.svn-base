package com.leimingtech.mobile.service.impl.advertisemen;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.mobile.entity.advertisemen.AdvertisemenContentEntity;
import com.leimingtech.mobile.service.advertisemen.AdvertisemenContentServiceI;

@Service("advertisemenContentService")
@Transactional
public class AdvertisemenContentServiceImpl extends CommonServiceImpl implements AdvertisemenContentServiceI {

	@Override
	public Map<String, Object> getListByPage(Integer pageNo, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>(); //返回的结果的容器
		List<AdvertisemenContentEntity> list = null; //返回的内容
		int pageCount = 0; // 返回最大页码
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageSize = (pageSize == null || pageSize == 0) ? 10 : pageSize;
		//查询方法的封装，需要的参数是当前操作的实体类
		CriteriaQuery query = new CriteriaQuery(AdvertisemenContentEntity.class, pageSize, pageNo, "", "");
		//排序
		query.addOrder("id", SortDirection.desc);
		//加载参数
		query.add();
		//分页查询结果封装类
		PageList pageList = this.getPageList(query, true); 
		list = pageList.getResultList();
		pageCount = (int) Math.ceil((double) pageList.getCount() / (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		if (list != null & list.size() > 0) { //判断是否有数据
			map.put("list", list);
		} else {
			map.put("list", "空值");
		}

		map.put("pageCount", pageCount);
		map.put("pageSize", pageSize);

		return map;
	}
	
}