package com.leimingtech.core.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.core.service.ClassifyServiceI;

@Service("classifyService")
@Transactional
public class ClassifyServiceImpl extends CommonServiceImpl implements ClassifyServiceI {
	
}