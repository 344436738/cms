package com.leimingtech.core.util;

import  com.leimingtech.base.entity.Principal;
import com.leimingtech.base.entity.site.SiteEntity;
import  com.leimingtech.base.entity.site.vo.SiteVOSimple;
import com.leimingtech.base.entity.temp.TSUser;
import  com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.service.RoleSiteServiceI;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.service.UserService;
import com.leimingtech.core.service.contentcatpriv.ContentCatPrivServiceI;
import com.leimingtech.core.service.jedis.JedisClient;
import com.leimingtech.core.service.mobilechannelpriv.MobileChannelPrivServiceI;
import com.leimingtech.core.util.constant.PersonnelStatusConstant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.List;

/**
 * 后台用户工具类
 *
 * @author liuzhen 2017年4月20日 10:48:45
 */
public class UserUtils {

    private static JedisClient jedis = SpringContextHolder.getBean(JedisClient.class);
    private static UserService userService = SpringContextHolder.getBean(UserService.class);
    private static SiteServiceI siteService = SpringContextHolder.getBean(SiteServiceI.class);
    private static RoleSiteServiceI roleSiteService = SpringContextHolder.getBean(RoleSiteServiceI.class);
    private static ContentCatPrivServiceI contentCatPrivService = SpringContextHolder.getBean(ContentCatPrivServiceI.class);
    private static MobileChannelPrivServiceI mobileChannelPrivService = SpringContextHolder.getBean(MobileChannelPrivServiceI.class);

    private static final String USER_CACHE = "userCache";
    private static final String USER_CACHE_ID_ = "id_";
    private static final String USER_CACHE_LOGIN_NAME_ = "ln";

    private static final String SITE_CACHE = "siteCache";
    private static final String SITE_CACHE_ID_ = "id_";

    private static final String SESSION_SITE_ID = "sessionSiteId";

    private static final String CACHE_MENU_LIST = "menuList";
    private static final String CACHE_SITE_LIST = "siteList";
    private static final String CACHE_CONTENTCAT_ID_LIST = "contentCatIdList";
    private static final String CACHE_MOBILECHANNEL_ID_LIST = "mobileChannelIdList";

    /**
     * 根据ID获取用户
     *
     * @param id
     * @return 取不到返回null
     */
    public static TSUser getUser(String id) {
        TSUser user = jedis.hget(USER_CACHE, USER_CACHE_ID_ + id, TSUser.class);
        if (user == null) {
            user = userService.getEntity(id);
            if (user == null) {
                return null;
            }
            jedis.hset(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
            jedis.hset(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getUserName(), user);
        }
        return user;
    }

    /**
     * 根据登录名获取用户
     *
     * @param loginName
     * @return 取不到返回null
     */
    public static TSUser getUserByLoginName(String loginName) {
        TSUser user = jedis.hget(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName, TSUser.class);
        if (user == null) {
            user = userService.getEntityByUserName(loginName);
            if (user == null) {
                return null;
            }
            jedis.hset(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
            jedis.hset(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getUserName(), user);
        }
        return user;
    }

    /**
     * 获取当前用户
     *
     * @return 取不到返回 new User()
     */
    public static TSUser getUser() {
        Principal principal = getPrincipal();
        if (principal != null) {
            TSUser user = getUser(principal.getId());
            if (user != null) {
                return user;
            }
            return new TSUser();
        }
        // 如果没有登录，则返回实例化空的User对象。
        return new TSUser();
    }

    /**
     * 获取当前用户id
     *
     * @return 取不到返回 new User()
     */
    public static String getUserId() {
        Principal principal = getPrincipal();
        return principal.getId();
    }


    /**
     * 获取当前用户授权菜单
     *
     * @return
     */
    public static List<FunctionVOShow> getMenuList() {

        List<FunctionVOShow> menuList = (List<FunctionVOShow>) getCache(CACHE_MENU_LIST);
//        if (menuList == null) {
            TSUser user = getUser();
            menuList = userService.getUserFunctionListByUserId(user.getId());
            putCache(CACHE_MENU_LIST, menuList);
//        }
        return menuList;
    }

    /**
     * 获取当前用户授权站点
     *
     * @return
     */
    public static List<SiteVOSimple> getSiteList() {
        TSUser user = getUser();
        List<SiteVOSimple> siteList = (List<SiteVOSimple>) getCache(CACHE_SITE_LIST);
        if (siteList == null || siteList.size()==0) {
            //判断用户身份
           int flag = user.getAuthentication();
           if(flag==PersonnelStatusConstant.ADMINISTRATOR_SUPER || flag==PersonnelStatusConstant.ADMINISTRATOR_PLATFORM){
                siteList = siteService.getAllSiteList();
           }else if(flag==PersonnelStatusConstant.ADMINISTRATOR_SITE){
               siteList = siteService.getListByUid(user);
           }else{
               siteList = roleSiteService.getSiteListByUserId(user.getId());
           }
            putCache(CACHE_SITE_LIST, siteList);
        }
        return siteList;
    }

    /**
     * 获取当前用户权限内的栏目数据
     *
     * @return
     */
    public static List<String> getContentCatIdList() {
        List<String> contentCatIdList = (List<String>) getCache(CACHE_CONTENTCAT_ID_LIST);
        if (contentCatIdList == null) {
            TSUser user = getUser();

            contentCatIdList = contentCatPrivService.getContentCatIdListByUserId(user.getId());

            putCache(CACHE_CONTENTCAT_ID_LIST, contentCatIdList);
        }
        return contentCatIdList;
    }

    /**
     * 获取当前用户权限内移动频道数据
     *
     * @return
     */
    public static List<String> getMobileChannelIdList() {
        List<String> mobileChannelIdList = (List<String>) getCache(CACHE_MOBILECHANNEL_ID_LIST);
        if (mobileChannelIdList == null) {
            TSUser user = getUser();

            mobileChannelIdList = mobileChannelPrivService.getMobileChannelIdListByUserId(user.getId());

            putCache(CACHE_MOBILECHANNEL_ID_LIST, mobileChannelIdList);
        }
        return mobileChannelIdList;
    }


    /**
     * 获取授权主要对象
     */
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    /**
     * 获取当前登录者对象
     */
    public static Principal getPrincipal() {
        try {
            Subject subject = SecurityUtils.getSubject();
            Principal principal = (Principal) subject.getPrincipal();
            if (principal != null) {
                return principal;
            }
//			subject.logout();
        } catch (UnavailableSecurityManagerException e) {

        } catch (InvalidSessionException e) {

        }
        return null;
    }

    /**
     * 获取当前用户所在站点信息
     *
     * @return
     */
    public static SiteEntity getSite() {
        String siteId = getSiteId();
        if (StringUtils.isBlank(siteId)) {
            return new SiteEntity();
        }

        SiteEntity site = getSite(siteId);
        if (site == null) {
            return new SiteEntity();
        }
        return site;
    }

    /**
     * 根据站点id获取站点
     *
     * @param siteId
     * @return
     */
    private static SiteEntity getSite(String siteId) {
        SiteEntity site = jedis.hget(SITE_CACHE, SITE_CACHE_ID_ + siteId, SiteEntity.class);
        if (site == null) {
            site = siteService.getSite(siteId);
            if (site == null) {
                return null;
            }
            jedis.hset(SITE_CACHE, SITE_CACHE_ID_ + site, site);
        }
        return site;
    }

    /**
     * 获取当前用户所在站点id
     *
     * @return
     */
    public static String getSiteId() {
        String siteId = oConvertUtils.getString(getSession().getAttribute(SESSION_SITE_ID), "");
        return siteId;
    }

    /**
     * 更改或者设置当前站点
     *
     * @param siteId 站点id
     */
    public static void setSite(String siteId) {
        getSession().setAttribute(SESSION_SITE_ID, siteId);
    }

    public static Session getSession() {
        try {
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession(false);
            if (session == null) {
                session = subject.getSession();
            }
            if (session != null) {
                return session;
            }
//			subject.logout();
        } catch (InvalidSessionException e) {

        }
        return null;
    }

    /**
     * 清除当前用户缓存
     */
    public static void clearCache() {
        removeCache(CACHE_MENU_LIST);
        removeCache(SESSION_SITE_ID);
        UserUtils.clearCache(getUser());
    }

    /**
     * 清除指定用户缓存
     *
     * @param user
     */
    public static void clearCache(TSUser user) {
        jedis.hdel(USER_CACHE, USER_CACHE_ID_ + user.getId());
        jedis.hdel(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getUserName());
    }

    // ============== User Cache ==============

    public static Object getCache(String key) {
        return getCache(key, null);
    }

    public static Object getCache(String key, Object defaultValue) {
//		Object obj = getCacheMap().getUser(key);
        Object obj = getSession().getAttribute(key);
        return obj == null ? defaultValue : obj;
    }

    public static void putCache(String key, Object value) {
//		getCacheMap().put(key, value);
        getSession().setAttribute(key, value);
    }

    public static void removeCache(String key) {
//		getCacheMap().remove(key);
        getSession().removeAttribute(key);
    }

//	public static Map<String, Object> getCacheMap(){
//		Principal principal = getPrincipal();
//		if(principal!=null){
//			return principal.getCacheMap();
//		}
//		return new HashMap<String, Object>();
//	}

}
