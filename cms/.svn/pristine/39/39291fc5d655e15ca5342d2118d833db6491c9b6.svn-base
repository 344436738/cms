package com.leimingtech.timingtask.time;


import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.service.LuceneServiceI;
import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.service.ContentIllegalServiceI;
import com.leimingtech.core.service.ContentsServiceI;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;


public class RegularTasksToCMS {
	@Autowired
	private LuceneServiceI luceneServiceImpl;
	@Autowired
	private IStatic staticImpl;
	@Autowired
	private ContentsServiceI contentsService;
	@Autowired
	private ContentIllegalServiceI contentIllegalServiceImpl;
	@Autowired
	private SiteServiceI siteService;

	// private static long time=0;

	/**
	 * 定时发布内容，每30分钟执行一次
	 */

	public void publishContentTenMinutes() {
		List<SiteEntity> siteList = new ArrayList<SiteEntity>();
		siteList = siteService.siteList();
		for (SiteEntity siteEntity : siteList) {
			if(siteEntity.getIsSwitch().equals("0")){
				long curTime = System.currentTimeMillis();
				try {
					LogUtil.info("站点《" + siteEntity.getSiteName() + "》开始发布");
					staticImpl.staticSite(siteEntity, -1);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					LogUtil.info("站点《" + siteEntity.getSiteName() + "》发布结束\t总耗时："
							+ (System.currentTimeMillis() - curTime) + "毫秒");
				}
			}
		}
	}



	/**
	 * 定时下架内容，每5分钟执行一次
	 */

	public void oneOClockPerDay() {
		SiteServiceI siteService= SpringContextHolder.getBean(SiteServiceI.class);
		siteService.getAllSiteList();
		List<SiteEntity> siteList=siteService.siteList();

		for (SiteEntity siteEntity : siteList) {
			luceneServiceImpl.creatIndex(siteEntity);
		}
		List<ContentsEntity> list = new ArrayList<ContentsEntity>();
		try {
			list = contentsService.getOfflineContent();
			for (ContentsEntity contentsEntity : list) {
				System.out.println("id:" + contentsEntity.getId() + "《"
						+ contentsEntity.getTitle() + "》\t已下架");
				contentIllegalServiceImpl.delContentHtmlFile(contentsEntity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 定时生成索引, 每40分钟执行一次
	 */
	public void s10() {
		LogUtil.info("建立索引 开始");
		long starttime = System.currentTimeMillis();
		List<SiteEntity> siteList = new ArrayList<SiteEntity>();
		siteList = siteService.siteList();
		for (SiteEntity siteEntity : siteList) {
			luceneServiceImpl.creatIndex(siteEntity);
		}
		LogUtil.info("建立索引 结束 生成索引耗时"
				+ (System.currentTimeMillis() - starttime) + "毫秒.");
	}

}
