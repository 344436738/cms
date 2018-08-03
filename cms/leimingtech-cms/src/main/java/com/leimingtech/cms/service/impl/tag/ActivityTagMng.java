package com.leimingtech.cms.service.impl.tag;

import com.leimingtech.base.entity.temp.ActivityEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.cms.service.tag.IActivityTagMng;
import com.leimingtech.base.entity.temp.ActivityEntity;
import com.leimingtech.core.service.CommonService;

/**
 * 投票标签接口实现
 * 
 * @author liuzhen 2014年5月21日 17:45:28
 * 
 */
@Service("activityTagMng")
@Transactional
public class ActivityTagMng implements IActivityTagMng {
	/**
	 * 获取活动
	 * 
	 * @param params
	 * @return
	 */
	@Autowired
	private CommonService commonService;

	@Override
	public ActivityEntity getActivity(String name) {
		ActivityEntity activity =commonService.findUniqueByProperty(ActivityEntity.class, "contentid", name);
		if(activity==null){
			activity = new ActivityEntity();
		}
		return activity;
	}
}
