package com.leimingtech.core.service;

import com.leimingtech.base.entity.temp.ContentsMobileEntity;

import java.util.Map;



public interface IArticleMobileTagMng extends CommonService{

	/**
	 * 获取内容相关模型
	 * @param content
	 * @return
	 */
	public Map<String, Object> getContent(ContentsMobileEntity content);
}
