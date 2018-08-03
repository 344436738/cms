package com.leimingtech.cms.tag.lmtag;

import java.util.List;
import java.util.Map;

import com.leimingtech.base.entity.temp.LotteryEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.leimingtech.core.common.BaseFreeMarkerTag;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.WxLotteryServiceI;
import com.leimingtech.core.util.StringUtils;

import freemarker.template.TemplateModelException;

/**
 * 抽奖活动标签
 * 
 * @author liuzhen 2014年4月11日 14:12:59
 * 
 */
@Component
@Scope("prototype")
public class LotteryTag extends BaseFreeMarkerTag {

	@Autowired
	private WxLotteryServiceI wxLotteryService;

	@Override
	protected Object exec(Map params) throws TemplateModelException {
		String id = (String) params.get("id");
		if (StringUtils.isEmpty(id)) {
			CriteriaQuery cq = new CriteriaQuery(LotteryEntity.class);
			LotteryEntity l = new LotteryEntity();
			l.setType(1);
			HqlGenerateUtil.installHql(cq, l, null);
			List<LotteryEntity> lotteryList = wxLotteryService.getListByCriteriaQuery(cq, false);
			if (lotteryList != null && lotteryList.size() > 0) {
				id = lotteryList.get(lotteryList.size() - 1).getId().toString();
			}
		}

		LotteryEntity lottery = wxLotteryService.getEntity(LotteryEntity.class, Integer.valueOf(id));
		return lottery;
	}

}
