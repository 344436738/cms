package com.leimingtech.cms.service.impl.tag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leimingtech.base.entity.temp.ContentsEntity;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.cms.service.tag.IPictureGroupTagMng;
import com.leimingtech.common.hibernate.SortDirection;

import com.leimingtech.base.entity.temp.PictureAloneEntity;
import com.leimingtech.base.entity.temp.PictureGroupEntity;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.core.util.StringUtils;

/**
 * 组图标签接口实现
 * 
 * @author liuzhen 2014年5月26日 17:57:26
 * 
 */
@Service("pictureGroupTagMng")
@Transactional
public class PictureGroupTagMng extends CommonServiceImpl implements
		IPictureGroupTagMng {

	/**
	 * 获取组图
	 */
	@Override
	public Object getPictureGroupByTag(Map params) {
		if (MapUtils.isEmpty(params))
			return null;
		String contentid = (String) params.get("contentid");
		if (StringUtils.isEmpty(contentid) || !StringUtils.isNumeric(contentid))
			return null;
		String articleid = contentid;// 文章id
		CriteriaQuery cq = new CriteriaQuery(PictureGroupEntity.class);
		cq.eq("contentid", articleid);
		cq.addOrder("sort", SortDirection.desc);
		cq.add();
		List<PictureGroupEntity> pictureGroupList = getListByCriteriaQuery(cq,
				false);
		if (pictureGroupList != null && pictureGroupList.size() > 0) {
			ContentsEntity article = getEntity(ContentsEntity.class, articleid);

			Map<String, Object> map = new HashMap<String, Object>();
			if(pictureGroupList!=null && pictureGroupList.size()>0){
				map.put("pictureGroup", pictureGroupList.get(0));
			}else{
				map.put("pictureGroup", new PictureGroupEntity());
			}

			if(article==null){
				article = new ContentsEntity();
			}
			map.put("article", article);
			return map;
		}
		return new HashMap<String, Object>();
	}

	/**
	 * 获取组图数据
	 */
	@Override
	public Object getPictureDataByTag(Map params) {
		if (MapUtils.isEmpty(params))
			return null;

		String pgid = (String) params.get("pgid");
		if (StringUtils.isEmpty(pgid) || !StringUtils.isNumeric(pgid))
			return null;

		Integer picturegroupid = Integer.valueOf(pgid);// 组图id
		CriteriaQuery cq = new CriteriaQuery(PictureAloneEntity.class);
		cq.eq("picturegroupid", pgid);
		cq.addOrder("pictureSort", SortDirection.desc);
		cq.add();
		return getListByCriteriaQuery(cq, false);
	}

}
