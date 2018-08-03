package com.leimingtech.wechat.entity.wechatenterprisecontent;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 企业号推送内容
 * @author 
 * @date 2017-03-28 08:49:36
 * @version V1.0   
 *
 */
@Entity
@Table(name = "wechat_enterprise_content", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class WechatEnterpriseContentEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 7063119981146387425L;
	/** 内容标题 */
	private java.lang.String title;
	/** 图文消息 */
	private java.lang.String articles;
	/** 描述 */
	private java.lang.String description;
	/** 点击后跳转的链接 */
	private java.lang.String url;
	/** 图文消息的图片链接 */
	private java.lang.String picurl;
	/** 选择的文章id */
	private java.lang.String contentId;
	/** 作者 */
	private java.lang.String author;
	/** 创建时间 */
	private java.util.Date createtime;
	/** 站点 */
	private java.lang.String siteId;
	/** 栏目 */
	private java.lang.String catId;
	/** 企业配置id*/
	private java.lang.String configId;

	/** 企业配置id*/
	private java.lang.String pushId;

	@Column(name = "CONFIG_ID", nullable = true, length = 32)
	public String getConfigId() {
		return configId;
	}

	public void setConfigId(String configId) {
		this.configId = configId;
	}

	@Column(name = "PUSH_ID", nullable = true, length = 32)
	public String getPushId() {
		return pushId;
	}

	public void setPushId(String pushId) {
		this.pushId = pushId;
	}
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 内容标题
	 */
	@Column(name = "TITLE", nullable = true, length = 255)
	public java.lang.String getTitle() {
		return this.title;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 内容标题
	 */
	public void setTitle(java.lang.String title) {
		this.title = title;
	}
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 图文消息
	 */
	@Column(name = "ARTICLES", nullable = true, length = 65535)
	public java.lang.String getArticles() {
		return this.articles;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 图文消息
	 */
	public void setArticles(java.lang.String articles) {
		this.articles = articles;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 描述
	 */
	@Column(name = "DESCRIPTION", nullable = true, length = 255)
	public java.lang.String getDescription() {
		return this.description;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 描述
	 */
	public void setDescription(java.lang.String description) {
		this.description = description;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 点击后跳转的链接
	 */
	@Column(name = "URL", nullable = true, length = 255)
	public java.lang.String getUrl() {
		return this.url;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 点击后跳转的链接
	 */
	public void setUrl(java.lang.String url) {
		this.url = url;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 图文消息的图片链接
	 */
	@Column(name = "PICURL", nullable = true, length = 255)
	public java.lang.String getPicurl() {
		return this.picurl;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 图文消息的图片链接
	 */
	public void setPicurl(java.lang.String picurl) {
		this.picurl = picurl;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 选择的文章id
	 */
	@Column(name = "CONTENT_ID", nullable = true, length = 32)
	public java.lang.String getContentId() {
		return this.contentId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 选择的文章id
	 */
	public void setContentId(java.lang.String contentId) {
		this.contentId = contentId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 作者
	 */
	@Column(name = "AUTHOR", nullable = true, length = 255)
	public java.lang.String getAuthor() {
		return this.author;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 作者
	 */
	public void setAuthor(java.lang.String author) {
		this.author = author;
	}
	
	/**
	 * 方法: 取得java.util.Date
	 *
	 * @return: java.util.Date 创建时间
	 */
	@Column(name = "CREATETIME", nullable = true)
	public java.util.Date getCreatetime() {
		return this.createtime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 创建时间
	 */
	public void setCreatetime(java.util.Date createtime) {
		this.createtime = createtime;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 站点
	 */
	@Column(name = "SITE_ID", nullable = true, length = 32)
	public java.lang.String getSiteId() {
		return this.siteId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 站点
	 */
	public void setSiteId(java.lang.String siteId) {
		this.siteId = siteId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 栏目
	 */
	@Column(name = "CAT_ID", nullable = true, length = 32)
	public java.lang.String getCatId() {
		return this.catId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 栏目
	 */
	public void setCatId(java.lang.String catId) {
		this.catId = catId;
	}
}
