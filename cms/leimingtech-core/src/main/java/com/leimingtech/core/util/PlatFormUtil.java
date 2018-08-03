package com.leimingtech.core.util;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import  com.leimingtech.base.entity.Principal;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.*;


import com.leimingtech.common.ApplicationContextUtil;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.springframework.context.ConfigurableApplicationContext;

import com.leimingtech.core.common.CmsConstants;

import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.UserService;
import com.leimingtech.core.service.WaterMarkServiceI;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 平台工具类
 * 
 * @author liuzhen 2014年7月10日 18:42:31
 * 
 */
public class PlatFormUtil {

//	/**
//	 * 获取当前session中管理员
//	 *
//	 * @return
//	 */
//	public static final TSUser getSessionUser() {
//
//		if(ClientManager.getInstance().getClient(session.getId()) != null) {
//			return ClientManager.getInstance().getClient(session.getId()).getUser();
//		}
//		return null;
//	}
//
//	/**
//	 * 获取当前session中站点
//	 *
//	 * @return
//	 */
//	public static final SiteEntity getSessionSite() {
//
//		if(ClientManager.getInstance().getClient(session.getId()) != null) {
//			return UserUtils.getSite();
//		}
//		return null;
//	}
//
//	/**
//	 * 获取当前session中站点
//	 *
//	 * @param session
//	 *            ContextHolderUtils.getSession()
//	 * @return
//	 */
//	public static final SiteEntity getSessionSite(HttpSession session) {
//		if(ClientManager.getInstance().getClient(session.getId()) != null) {
//			return UserUtils.getSite();
//		}
//		return null;
//	}
//
//	/**
//	 * 获取当前session中站点id
//	 *
//	 * @return
//	 */
//	public static final String getSessionSiteId() {
//		SiteEntity site = getSessionSite();
//		if(site != null) {
//			return site.getId();
//		}
//
//		return "0";
//
//	}

	/**
	 * 获取前端session中的站点
	 *
	 * @return
	 */
	public static final SiteEntity getFrontSessionSite() {
		return MemberUtils.getSite();
	}

	/**
	 * 获取前端session中的站点id
	 *
	 * @return
	 */
	public static final String getFrontSessionSiteId() {
		SiteEntity site = getFrontSessionSite();
		String siteid = null;
		if(site != null) {
			siteid = site.getId();
		}
		return siteid;
	}

	/**
	 * 获取站点域名
	 *
	 * @return
	 */
	public static final String getCurrentSitedomain() {
		SiteEntity site = UserUtils.getSite();
		if(site != null && com.leimingtech.common.utils.StringUtils.isNotEmpty(site.getDomain())) {
			String domain=site.getProtocol()+site.getDomain();
			return domain;
		}
		return "";
	}

	/**
	 * 是否开启图片打水印
	 *
	 * @return
	 */
	public static final Boolean isOpenWatermark() {
		Map<String , String> mCache = PfConfigEntity.pfconfigCache;
		String watermark = mCache.get("watermark");
		if(com.leimingtech.common.utils.StringUtils.isNotEmpty(watermark) && "1".equals(watermark)) {
			return true;
		}
		return false;
	}

	/**
	 * 获取水印图片路径
	 *
	 * @return
	 */
	public static final Map<String , Object> findWatermarkImageUrl(HttpSession session) {
		if(isOpenWatermark()) {

			WaterMarkServiceI waterMarkService = (WaterMarkServiceI)getInterface("waterMarkService");
			List<WaterMarkEntity> waterMarks = waterMarkService.getList(WaterMarkEntity.class);

			if(waterMarks != null && waterMarks.size() > 0) {
				WaterMarkEntity waterMark = waterMarks.get(0);

				String separator = System.getProperty("file.separator");

				String imagepath = waterMark.getImagepath();

				if(com.leimingtech.common.utils.StringUtils.isNotEmpty(imagepath)) {
					imagepath = imagepath.replaceAll("/" , separator + separator);
					String sitePath = CmsConstants.getSitePath(session);

					if(new File(sitePath + imagepath).exists()) {
						Map<String , Object> m = new HashMap<String , Object>();

						m.put("imagePath" , sitePath + imagepath);
						m.put("position" , waterMark.getPosition());

						return m;
					}
				}
			}
		}
		return null;
	}

	/**
	 * 从spring容器中获取systemservice接口
	 *
	 * @return
	 */
	public static SystemService getSystemService() {
		ConfigurableApplicationContext applicationContext = (ConfigurableApplicationContext) SpringContextHolder.getApplicationContext();
		SystemService systemService = (SystemService)applicationContext.getBean("systemService");
		return systemService;
	}

	/**
	 * 通过注入的接口名从spring容器中获取接口实例
	 *
	 * @param InterfaceName
	 *            注入的接口名
	 * @return
	 */
	public static Object getInterface(String InterfaceName) {
		ConfigurableApplicationContext applicationContext = (ConfigurableApplicationContext) SpringContextHolder.getApplicationContext();
		return applicationContext.getBean(InterfaceName);
	}


	/**
	 * 根据request获取完整的域名，如http://www.aaa.com:8080 如果端口为80则为：http://www.aaa.com
	 *
	 * @return
	 */
	public static String getDomail() {
		HttpServletRequest request = com.leimingtech.common.ContextHolderUtils.getRequest();
		String port = "" + request.getServerPort();
		if("80".equals(port)) {
			port = "";
		} else {
			port = ":" + port;
		}
		String contextPath = request.getContextPath();
		if("/".equals(contextPath)) {
			contextPath = "";
		}

		String domain = request.getScheme()+"://" + ("localhost".equals(request.getServerName()) ? "127.0.0.1" : request.getServerName()) + port + contextPath;
		return domain;
	}

	/**
	 * 传入模板返回静态页面
	 *
	 * @param templatepath
	 *            模板路径
	 * @param data
	 *            注入模板数据
	 * @return 生成后的内容
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static String generateFile(String templatepath , Map<String , Object> data) throws TemplateException , IOException {
		if(data == null) {
			data = new HashMap<String , Object>();
		}

		String template=FileUtil.readText(new File(templatepath), "UTF-8");

		StringWriter result = new StringWriter();
		try {
			Template t = new Template("name", new StringReader(template), new Configuration());
			t.process(data, result);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}

		return result.toString();
	}

	/**
	 * 当前用户所拥有的角色
	 *
	 * @return
	 */
	public static final List<TSRole> getRoleUser() {
		List<TSRole> roleList = new ArrayList<TSRole>();
		UserService userService = (UserService)getInterface("userService");

		Subject subject = SecurityUtils.getSubject();
		Principal principal = (Principal) subject.getPrincipal();

		String userId = principal.getId();
		List<TSRoleUser> roleUserList = userService.findByProperty(TSRoleUser.class , "TSUser.id" , userId);
		for(TSRoleUser roleUser : roleUserList) {
			TSRole role = userService.get(TSRole.class , roleUser.getTSRole().getId());
			roleList.add(role);
		}
		return roleList;
	}

	@Test
	public void test() {
		try {
			System.out.println(PlatFormUtil.generateFile("D:\\project\\java\\lmcms\\lmcms-framework\\WebRoot\\wwwroot\\www\\template\\footer.html" , null));
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
