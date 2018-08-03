package com.leimingtech.core.service;

import java.util.List;

import com.leimingtech.base.entity.temp.ActivityEntity;
import com.leimingtech.base.entity.temp.ActivityOptionContentEntity;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;

public interface ActivityServiceI extends CommonService{
	/**
	 * 保存活动
	 * @param contents
	 * @param vote
	 */
	void saveActivity(ContentsEntity contents,ActivityEntity activity);
	/**
	 * 修改活动
	 * @param contents
	 * @param vote
	 * @param contentcat
	 * @param voteOptionList
	 * @param temporary
	 * @param divValue
	 */
	void updateActivity(ContentsEntity contents,ActivityEntity activity,ContentCatEntity contentcat,List<ActivityOptionContentEntity> activityOptionList,String temporary,String divValue);
}
