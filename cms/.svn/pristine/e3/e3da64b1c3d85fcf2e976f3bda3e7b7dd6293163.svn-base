package com.leimingtech.core.service;

import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.VoteEntity;

public interface VoteServiceI extends CommonService{

	/**
	 * 保存投票
	 * @param contents
	 * @param vote
	 */
	void saveVote(ContentsEntity contents,VoteEntity vote);
	/**
	 * 修改投票
	 * @param contents
	 * @param vote
	 * @param contentcat
	 * @param voteOptionList
	 * @param temporary
	 * @param divValue
	 */
	void updateVote(ContentsEntity contents, VoteEntity vote,
			ContentCatEntity contentcat, String temporary, String divValue);
}
