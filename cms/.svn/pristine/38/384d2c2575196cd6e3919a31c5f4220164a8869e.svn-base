package com.leimingtech.cms.tag.lmtag;

import java.util.HashMap;
import java.util.Map;

import com.leimingtech.cms.tag.macrotag.SingleContentTag;
import com.leimingtech.cms.tag.macrotag.PagebarTag;
import com.leimingtech.common.ApplicationContextUtil;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.TagCreator;
import org.springframework.context.ConfigurableApplicationContext;

import com.leimingtech.cms.tag.macrotag.ContentTag;
import com.leimingtech.cms.tag.macrotag.UpperTag;

public class TagMap {

	private static final Map<String, Object> tagMap = new HashMap<String, Object>();

	static {
		CatalogTag catalogTag = SpringContextHolder.getBean(CatalogTag.class);
		tagMap.put("catalogTag", catalogTag);

		ArticleTag articleTag = SpringContextHolder.getBean(ArticleTag.class);
		tagMap.put("articleTag", articleTag);
		
		UpperTag upperTag = SpringContextHolder.getBean(UpperTag.class);
		tagMap.put("upperTag", upperTag);
		
		ContentTag contentTag = SpringContextHolder.getBean(ContentTag.class);
		tagMap.put("lmcms_content", contentTag);

		com.leimingtech.cms.tag.macrotag.CatalogTag content_Tag = SpringContextHolder.getBean(com.leimingtech.cms.tag.macrotag.CatalogTag.class);
		tagMap.put("lmcms_catalog", content_Tag);

		PagebarTag pagebarTag = SpringContextHolder.getBean(PagebarTag.class);
		tagMap.put("lmcms_pagebar", pagebarTag);

		 SingleContentTag singleContentTagTag = SpringContextHolder.getBean(SingleContentTag.class);
		tagMap.put("lmcms_singleContent", singleContentTagTag);

		tagMap.put("newTag", new TagCreator());
	}

	public static Map<String, Object> getTagMap() {
		return tagMap;
	}
	 
}
