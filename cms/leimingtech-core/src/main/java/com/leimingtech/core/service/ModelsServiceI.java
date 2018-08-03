package com.leimingtech.core.service;

import java.util.List;

import  com.leimingtech.base.entity.model.ModelsEntity;

public interface ModelsServiceI {

	/**
	 * 获取所有开启的模型
	 * 
	 * @return
	 */
	List<ModelsEntity> getAllOpenModels();
}
