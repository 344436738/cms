package com.leimingtech.cms.entity.sinotransstats;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**
 * @Title: Entity
 * @Description: 统计pv/uv/ip
 * @author
 * @date 2017-04-11 16:54:02
 * @version V1.0
 *
 */
@Entity
@Table(name = "cms_sinotrans_stats", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class SinotransStatsEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = -6745915186736487486L;
	/** 站点id */
	private java.lang.String siteId;
	/**站点name*/
	private java.lang.String sitename;
	/** 栏目id */
	private java.lang.String catId;
	/** 栏目name */
	private java.lang.String catName;
	/** 访问时间 */
	private java.util.Date createTime;
	/** 所有服栏目id*/
	private java.lang.String pathids;
	/** 访问ip */
	private java.lang.String ip;
	/** 浏览器 */
	private java.lang.String browser;
	/** 微信id */
	private java.lang.String openid;
	/** 0男、1女 */
	private java.lang.Integer wechatSex;
	/** 用户id */
	private java.lang.String userId;
	/** 所在省 */
	private java.lang.String province;
	/** 所在市 */
	private java.lang.String city;
	/** 县/旗 */
	private java.lang.String county;
	/** 年 */
	private java.lang.Integer dateYyyy;
	/** 月 */
	private java.lang.Integer dateMm;
	/** 日 */
	private java.lang.Integer dateDd;
	/** 时 */
	private java.lang.Integer dateHh;
	/** 分 */
	private java.lang.Integer dateMinute;
	/** 秒 */
	private java.lang.Integer dateSs;
	/** 城市编码 */
	private java.lang.Integer cityCode;
	/** 内容id */
	private java.lang.String contentId;
	/** 当前浏览器语言 */
	private java.lang.String language;
	/** 操作系统 */
	private java.lang.String os;
	/** 屏幕分辩率 */
	private java.lang.String screen;
	/** 引用页面url,HTTP_REFERER */
	private java.lang.String referer;
	/** 上一页面域名 */
	private java.lang.String referrerHost;
	/** 当前页面url */
	private java.lang.String url;
	/** 颜色深度 */
	private java.lang.String colorDepth;
	/** 浏览器是否启用cookie\0否1是 */
	private java.lang.Integer cookieEnabled;
	/** 浏览器是否安装flash插件\0否1是 */
	private java.lang.Integer flashEnabled;
	/** flash版本 */
	private java.lang.Integer flashVersion;
	/** 来检测当前浏览器是否支持 Java小程序applet\0否1是 */
	private java.lang.Integer javaEnabled;

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 站点id
	 */
	@Column(name = "PATHIDS", nullable = true, length = 255)
	public java.lang.String getPathids() {
		return this.pathids;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 站点id
	 */
	public void setPathids(java.lang.String pathids) {
		this.pathids = pathids;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 站点id
	 */
	@Column(name = "SITE_ID", nullable = false, length = 50)
	public java.lang.String getSiteId() {
		return this.siteId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 站点id
	 */
	public void setSiteId(java.lang.String siteId) {
		this.siteId = siteId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 栏目id
	 */
	@Column(name = "CAT_ID",length = 50)
	public java.lang.String getCatId() {
		return this.catId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 栏目id
	 */
	public void setCatId(java.lang.String catId) {
		this.catId = catId;
	}
	@Column(name = "SITE_NAME",length = 255)
	public String getSitename() {
		return sitename;
	}

	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	@Column(name = "CAT_NAME",length = 255)
	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	/**
	 * 方法: 取得java.util.Date
	 *
	 * @return: java.util.Date 访问时间
	 */
	@Column(name = "CREATE_TIME", nullable = false)
	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 访问时间
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 访问ip
	 */
	@Column(name = "IP", nullable = true, length = 255)
	public java.lang.String getIp() {
		return this.ip;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 访问ip
	 */
	public void setIp(java.lang.String ip) {
		this.ip = ip;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 浏览器
	 */
	@Column(name = "BROWSER", nullable = true, length = 50)
	public java.lang.String getBrowser() {
		return this.browser;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 浏览器
	 */
	public void setBrowser(java.lang.String browser) {
		this.browser = browser;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 微信id
	 */
	@Column(name = "OPENID", nullable = true, length = 255)
	public java.lang.String getOpenid() {
		return this.openid;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 微信id
	 */
	public void setOpenid(java.lang.String openid) {
		this.openid = openid;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 0男、1女
	 */
	@Column(name = "WECHAT_SEX", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getWechatSex() {
		return this.wechatSex;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 0男、1女
	 */
	public void setWechatSex(java.lang.Integer wechatSex) {
		this.wechatSex = wechatSex;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 用户id
	 */
	@Column(name = "USER_ID", nullable = false, length = 50)
	public java.lang.String getUserId() {
		return this.userId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 用户id
	 */
	public void setUserId(java.lang.String userId) {
		this.userId = userId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 所在省
	 */
	@Column(name = "PROVINCE", nullable = true, length = 255)
	public java.lang.String getProvince() {
		return this.province;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 所在省
	 */
	public void setProvince(java.lang.String province) {
		this.province = province;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 所在市
	 */
	@Column(name = "CITY", nullable = true, length = 255)
	public java.lang.String getCity() {
		return this.city;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 所在市
	 */
	public void setCity(java.lang.String city) {
		this.city = city;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 县/旗
	 */
	@Column(name = "COUNTY", nullable = true, length = 255)
	public java.lang.String getCounty() {
		return this.county;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 县/旗
	 */
	public void setCounty(java.lang.String county) {
		this.county = county;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 年
	 */
	@Column(name = "DATE_YYYY", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getDateYyyy() {
		return this.dateYyyy;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 年
	 */
	public void setDateYyyy(java.lang.Integer dateYyyy) {
		this.dateYyyy = dateYyyy;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 月
	 */
	@Column(name = "DATE_MM", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getDateMm() {
		return this.dateMm;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 月
	 */
	public void setDateMm(java.lang.Integer dateMm) {
		this.dateMm = dateMm;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 日
	 */
	@Column(name = "DATE_DD", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getDateDd() {
		return this.dateDd;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 日
	 */
	public void setDateDd(java.lang.Integer dateDd) {
		this.dateDd = dateDd;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 时
	 */
	@Column(name = "DATE_HH", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getDateHh() {
		return this.dateHh;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 时
	 */
	public void setDateHh(java.lang.Integer dateHh) {
		this.dateHh = dateHh;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 分
	 */
	@Column(name = "DATE_MINUTE", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getDateMinute() {
		return this.dateMinute;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 分
	 */
	public void setDateMinute(java.lang.Integer dateMinute) {
		this.dateMinute = dateMinute;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 秒
	 */
	@Column(name = "DATE_SS", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getDateSs() {
		return this.dateSs;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 秒
	 */
	public void setDateSs(java.lang.Integer dateSs) {
		this.dateSs = dateSs;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 城市编码
	 */
	@Column(name = "CITY_CODE", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getCityCode() {
		return this.cityCode;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 城市编码
	 */
	public void setCityCode(java.lang.Integer cityCode) {
		this.cityCode = cityCode;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 内容id
	 */
	@Column(name = "CONTENT_ID", nullable = true, length = 50)
	public java.lang.String getContentId() {
		return this.contentId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 内容id
	 */
	public void setContentId(java.lang.String contentId) {
		this.contentId = contentId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 当前浏览器语言
	 */
	@Column(name = "LANGUAGE", nullable = true, length = 50)
	public java.lang.String getLanguage() {
		return this.language;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 当前浏览器语言
	 */
	public void setLanguage(java.lang.String language) {
		this.language = language;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 操作系统
	 */
	@Column(name = "OS", nullable = true, length = 50)
	public java.lang.String getOs() {
		return this.os;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 操作系统
	 */
	public void setOs(java.lang.String os) {
		this.os = os;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 屏幕分辩率
	 */
	@Column(name = "SCREEN", nullable = true, length = 20)
	public java.lang.String getScreen() {
		return this.screen;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 屏幕分辩率
	 */
	public void setScreen(java.lang.String screen) {
		this.screen = screen;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 引用页面url,HTTP_REFERER
	 */
	@Column(name = "REFERER", nullable = true, length = 2000)
	public java.lang.String getReferer() {
		return this.referer;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 引用页面url,HTTP_REFERER
	 */
	public void setReferer(java.lang.String referer) {
		this.referer = referer;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 上一页面域名
	 */
	@Column(name = "REFERRER_HOST", nullable = true, length = 1000)
	public java.lang.String getReferrerHost() {
		return this.referrerHost;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 上一页面域名
	 */
	public void setReferrerHost(java.lang.String referrerHost) {
		this.referrerHost = referrerHost;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 当前页面url
	 */
	@Column(name = "URL", nullable = true, length = 2000)
	public java.lang.String getUrl() {
		return this.url;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 当前页面url
	 */
	public void setUrl(java.lang.String url) {
		this.url = url;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 颜色深度
	 */
	@Column(name = "COLOR_DEPTH", nullable = true, length = 20)
	public java.lang.String getColorDepth() {
		return this.colorDepth;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 颜色深度
	 */
	public void setColorDepth(java.lang.String colorDepth) {
		this.colorDepth = colorDepth;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 浏览器是否启用cookie\0否1是
	 */
	@Column(name = "COOKIE_ENABLED", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getCookieEnabled() {
		return this.cookieEnabled;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 浏览器是否启用cookie\0否1是
	 */
	public void setCookieEnabled(java.lang.Integer cookieEnabled) {
		this.cookieEnabled = cookieEnabled;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 浏览器是否安装flash插件\0否1是
	 */
	@Column(name = "FLASH_ENABLED", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getFlashEnabled() {
		return this.flashEnabled;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 浏览器是否安装flash插件\0否1是
	 */
	public void setFlashEnabled(java.lang.Integer flashEnabled) {
		this.flashEnabled = flashEnabled;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer flash版本
	 */
	@Column(name = "FLASH_VERSION", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getFlashVersion() {
		return this.flashVersion;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer flash版本
	 */
	public void setFlashVersion(java.lang.Integer flashVersion) {
		this.flashVersion = flashVersion;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 来检测当前浏览器是否支持 Java小程序applet\0否1是
	 */
	@Column(name = "JAVA_ENABLED", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getJavaEnabled() {
		return this.javaEnabled;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 来检测当前浏览器是否支持 Java小程序applet\0否1是
	 */
	public void setJavaEnabled(java.lang.Integer javaEnabled) {
		this.javaEnabled = javaEnabled;
	}
}
