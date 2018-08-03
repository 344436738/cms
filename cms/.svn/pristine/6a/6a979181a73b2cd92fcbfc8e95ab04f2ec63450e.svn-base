package com.leimingtech.cms.service.impl.tag;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leimingtech.base.entity.temp.ContentsEntity;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.cms.service.tag.IVoteTagMng;
import com.leimingtech.common.hibernate.SortDirection;

import com.leimingtech.base.entity.temp.VoteEntity;
import com.leimingtech.base.entity.temp.VoteOptionEntity;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.core.util.StringUtils;

/**
 * 投票标签接口实现
 * 
 * @author liuzhen 2014年5月21日 17:45:28
 * 
 */
@Service("voteTagMng")
@Transactional
public class VoteTagMng extends CommonServiceImpl implements IVoteTagMng {
	/**
	 * 通过标签传递参数获取投票
	 * 
	 * @param params
	 * @return
	 */
	public Object getVote(Map params) {
		if (MapUtils.isEmpty(params))
			return null;

		String contentid = (String) params.get("contentid");
		if (StringUtils.isEmpty(contentid))
			return null;

		String articleid = String.valueOf(contentid);// 文章id

		// 获取站点id
//
//
//		Integer siteid = client.getSite().getId();

		CriteriaQuery cq = new CriteriaQuery(VoteEntity.class);
		cq.eq("contentid", articleid);
//		cq.eq("siteid", siteid);
		Date date = new Date();
		/*cq.gt("voteendtime", date);
		cq.lt("votestarttime", date);*/
		cq.add();
		List<VoteEntity> voteList = getListByCriteriaQuery(cq, false);
		if (voteList != null && voteList.size() > 0) {
			ContentsEntity article = getEntity(ContentsEntity.class, articleid);

			Map<String, Object> map = new HashMap<String, Object>();
			if(voteList==null || voteList.size()<0){
				map.put("vote", new VoteEntity());
			}

			if(article==null){
				article = new ContentsEntity();
			}
			map.put("vote", voteList.get(0));
			map.put("content", article);
			return map;
		}
		return new HashMap<String,Object>();
	}

	/**
	 * 通过标签传递参数获取投票选项
	 * 
	 * @param params
	 * @return
	 */
	public Object getVoteOption(Map params) {
		if (MapUtils.isEmpty(params))
			return null;

		String voteid = (String) params.get("voteid");
		if (StringUtils.isEmpty(voteid))
			return null;

		String vid = String.valueOf(voteid);// 投票id

		// 获取站点id
//
//
//		Integer siteid = client.getSite().getId();

		CriteriaQuery cq = new CriteriaQuery(VoteOptionEntity.class);
//		cq.eq("siteid", siteid);
		cq.eq("voteid", vid);
		cq.addOrder("optionsort", SortDirection.desc);
		cq.add();
		return getListByCriteriaQuery(cq, false);
	}
}
