package com.leimingtech.core.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.core.service.VoteOptionServiceI;

@Service("voteOptionService")
@Transactional
public class VoteOptionServiceImpl extends CommonServiceImpl implements VoteOptionServiceI {
	
}