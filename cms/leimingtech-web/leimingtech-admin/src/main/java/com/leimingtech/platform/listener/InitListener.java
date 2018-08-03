package com.leimingtech.platform.listener;

import javax.servlet.ServletContextEvent;

import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateServiceI;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.core.service.SiteServiceI;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.leimingtech.common.Globals;
import com.leimingtech.core.service.SystemService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统初始化监听器,在系统启动时运行,进行一些初始化工作
 * 
 * @author laien
 * 
 */
public class InitListener implements javax.servlet.ServletContextListener {
	
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
	
	public void contextInitialized(ServletContextEvent event) {
//		SystemService systemService = SpringContextHolder.getBean(SystemService.class);
		Globals.CONTEXTPATH = event.getServletContext().getContextPath();
//
//		/**
//		 * 第一部分：对数据字典进行缓存
//		 */
//		systemService.initAllTypeGroups();
//
//		/**
//		 * 对平台配置进行缓存 2014-05-16 add by linjm
//		 */
//		systemService.initAllPfConfig();
//		// 装载所有内容抓取规则
//		systemService.loadContentExtractorule();
//		// 装载所有微信接口参数
//		systemService.loadWechatConfig();

	}
	
}
