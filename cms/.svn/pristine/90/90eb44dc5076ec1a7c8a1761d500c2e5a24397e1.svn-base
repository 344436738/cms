package com.leimingtech.core.service;

import java.util.List;

import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.temp.PictureAloneEntity;
import com.leimingtech.base.entity.temp.PictureGroupEntity;

public interface PictureGroupServiceI extends CommonService{

	/**
	 * 保存组图
	 * @param contents
	 * @param pictureGroup
	 */
	void savePictureGroup(ContentsEntity contents,PictureGroupEntity pictureGroup);
	/**
	 * 修改组图
	 * @param contents
	 * @param pictureGroup
	 * @param contentcat
	 * @param pictureAloneList
	 * @param temporary
	 * @param divValue
	 */
	void updatePictureGroup(ContentsEntity contents,PictureGroupEntity pictureGroup,ContentCatEntity contentcat,List<PictureAloneEntity> pictureAloneList,String temporary,String divValue);

	/**
	 * 根据内容id获取组图
	 * @param contentid
	 * @return
	 */
	List<PictureAloneEntity> pictureList (String contentid);

}
