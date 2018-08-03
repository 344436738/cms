package com.leimingtech.core.util;

import  com.leimingtech.base.entity.Principal;
import  com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.service.MemberDepartServiceI;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.service.contentcatdefault.ContentCatDefaultServiceI;
import com.leimingtech.core.service.departchannel.TSDepartChannelServiceI;
import com.leimingtech.core.service.jedis.JedisClient;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 会员工具类
 * Created by liuzhen on 2017/4/20.
 */
public class MemberUtils {

    private static JedisClient jedis = SpringContextHolder.getBean(JedisClient.class);
    private static MemberServiceI memberService = SpringContextHolder.getBean(MemberServiceI.class);
    private static SiteServiceI siteService = SpringContextHolder.getBean(SiteServiceI.class);
    private static ContentCatDefaultServiceI contentCatDefaultService = SpringContextHolder.getBean(ContentCatDefaultServiceI.class);
    private static MemberDepartServiceI memberDepartService = SpringContextHolder.getBean(MemberDepartServiceI.class);
    private static TSDepartChannelServiceI departChannelService = SpringContextHolder.getBean(TSDepartChannelServiceI.class);

    private static final String MEMBER_CACHE = "memberCache";
    private static final String USER_CACHE_ID_ = "id_";
    private static final String USER_CACHE_LOGIN_NAME_ = "ln";

    private static final String SITE_CACHE = "siteCache";
    private static final String SITE_CACHE_ID_ = "id_";

    private static final String CONTENTCAT_DEFAULT_CACHE = "contentCatDefaultCache";//栏目默认权限缓存

    private static final String MEMBER_SESSION_SITE_ID = "memberSessionSiteId";


    /**
     * 用户是否登陆
     * @return
     */
    public static boolean isLogin(){
        return getPrincipal() != null;
    }

    public static Set<String> getContentCatIds(){
        Set<String> s=new HashSet<>();
        List<String> defaultList=contentCatDefaultService.getAllContentCatId();
        if(defaultList!=null && defaultList.size()>0){
            s.addAll(defaultList);
        }

        if(isLogin()){
            //如果当前用户已登录，则获取用户所在部门的栏目权限
            List<String> departs=memberDepartService.getMemberDeparIdsList(getMemberId());
            List<String> contentCatList=departChannelService.getContentCatIdsByDeparts(departs);
            if(contentCatList!=null && contentCatList.size()>0){
                s.addAll(contentCatList);
            }
        }

        return s;
    }

    /**
     * 根据ID获取会员
     *
     * @param memberId 会员id
     * @return 取不到返回null
     */
    public static MemberEntity getMember(String memberId) {
        MemberEntity member = jedis.hget(MEMBER_CACHE, USER_CACHE_ID_ + memberId, MemberEntity.class);
        if (member == null) {
            member = memberService.getMember(memberId);
            if (member == null) {
                return null;
            }
            jedis.hset(MEMBER_CACHE, USER_CACHE_ID_ + member.getId(), member);
            jedis.hset(MEMBER_CACHE, USER_CACHE_LOGIN_NAME_ + member.getUsername(), member);
        }
        return member;
    }

    /**
     * 根据登录名获取会员
     *
     * @param loginName
     * @return 取不到返回null
     */
    public static MemberEntity getUserByLoginName(String loginName) {
        MemberEntity member = jedis.hget(MEMBER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName, MemberEntity.class);
        if (member == null) {
            member = memberService.getMemberByUsername(loginName);
            if (member == null) {
                return null;
            }
            jedis.hset(MEMBER_CACHE, USER_CACHE_ID_ + member.getId(), member);
            jedis.hset(MEMBER_CACHE, USER_CACHE_LOGIN_NAME_ + member.getUsername(), member);
        }
        return member;
    }

    /**
     * 清除当前用户缓存
     */
    public static void clearCache() {
//        removeCache(MEMBER_SESSION_SITE_ID);
//        jedis.del(MEMBER_SESSION_SITE_ID);
        MemberUtils.clearCache(getMember());
    }

    /**
     * 清除指定会员缓存
     *
     * @param member
     */
    public static void clearCache(MemberEntity member) {
        jedis.hdel(MEMBER_CACHE, USER_CACHE_ID_ + member.getId());
        jedis.hdel(MEMBER_CACHE, USER_CACHE_LOGIN_NAME_ + member.getUsername());
    }

    /**
     * 获取当前会员
     *
     * @return 取不到返回 new MemberEntity()
     */
    public static MemberEntity getMember() {
        Principal principal = getPrincipal();
        if (principal != null) {
            MemberEntity member = getMember(principal.getId());
            if (member != null) {
                return member;
            }
            return new MemberEntity();
        }
        // 如果没有登录，则返回实例化空的member对象。
        return new MemberEntity();
    }

    /**
     * 获取当前会员id，只有在确定已登录后才能这样获取
     *
     * @return
     */
    public static String getMemberId() {
        Principal principal = getPrincipal();
        return principal.getId();
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
        if (com.leimingtech.common.utils.StringUtils.isBlank(siteId)) {
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
        String siteId =  jedis.get(MEMBER_SESSION_SITE_ID);
        return siteId;
    }

    /**
     * 更改或者设置当前站点
     *
     * @param siteId 站点id
     */
    public static void setSite(String siteId) {
        jedis.set(MEMBER_SESSION_SITE_ID, siteId);
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
