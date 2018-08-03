package com.leimingtech.cms.entity.visibletemplate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

import java.util.Date;

/**   
 * @Title: Entity
 * @Description: 可视化图片条件
 * @author 
 * @date 2016-11-25 18:18:27
 * @version V1.0   
 *
 */
@Entity
@Table(name = "visible_image_param", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class VisibleImageParamEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = -5435830520606119977L;
	/** 组件键值 */
	private java.lang.String moduleKey;
	/** 模板id */
	private java.lang.String templateId;
	/** 组件id */
	private java.lang.String moduleId;
	/** 图片地址 */
	private java.lang.String imageUrl;
	/** 宽度 */
	private java.lang.Integer width;
	/** 高度 */
	private java.lang.Integer height;
	/** 描述 */
	private java.lang.String description;
	/** 链接 */
	private java.lang.String linkUrl;
	/** 新窗口打开（1,是、0否） */
	private java.lang.Integer blank;
	/** 创建人 */
	private java.lang.String createBy;
	/** 创建时间 */
	private java.util.Date createTime;
	/** 修改时间 */
	private java.util.Date updateTime;
	/** 修改人 */
	private java.lang.String updateBy;
	/** 站点id */
	private java.lang.String siteId;

	public VisibleImageParamEntity() {
	}

	public VisibleImageParamEntity(String moduleKey, String templateId, String moduleId, String imageUrl,
								   Integer width, Integer height, String description, String linkUrl, Integer blank,
								   String createBy, Date createTime, Date updateTime, String updateBy, String siteId) {
		this.moduleKey = moduleKey;
		this.templateId = templateId;
		this.moduleId = moduleId;
		this.imageUrl = imageUrl;
		this.width = width;
		this.height = height;
		this.description = description;
		this.linkUrl = linkUrl;
		this.blank = blank;
		this.createBy = createBy;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.updateBy = updateBy;
		this.siteId = siteId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 组件键值
	 */
	@Column(name = "MODULE_KEY", nullable = true, length = 255)
	public java.lang.String getModuleKey() {
		return this.moduleKey;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 组件键值
	 */
	public void setModuleKey(java.lang.String moduleKey) {
		this.moduleKey = moduleKey;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 模板id
	 */
	@Column(name = "TEMPLATE_ID", nullable = true, length = 32)
	public java.lang.String getTemplateId() {
		return this.templateId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 模板id
	 */
	public void setTemplateId(java.lang.String templateId) {
		this.templateId = templateId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 组件id
	 */
	@Column(name = "MODULE_ID", nullable = true, length = 32)
	public java.lang.String getModuleId() {
		return this.moduleId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 组件id
	 */
	public void setModuleId(java.lang.String moduleId) {
		this.moduleId = moduleId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 图片地址
	 */
	@Column(name = "IMAGE_URL", nullable = true, length = 500)
	public java.lang.String getImageUrl() {
		return this.imageUrl;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 图片地址
	 */
	public void setImageUrl(java.lang.String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 宽度
	 */
	@Column(name = "WIDTH", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getWidth() {
		return this.width;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 宽度
	 */
	public void setWidth(java.lang.Integer width) {
		if (width == null) {
			this.width = 0;
		} else {
			this.width = width;
		}
	}
	
	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 高度
	 */
	@Column(name = "HEIGHT", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getHeight() {
		return this.height;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 高度
	 */
	public void setHeight(java.lang.Integer height) {
		if (height == null) {
			this.height = 0;
		} else {
			this.height = height;
		}
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
	 * @return: java.lang.String 链接
	 */
	@Column(name = "LINK_URL", nullable = true, length = 255)
	public java.lang.String getLinkUrl() {
		return this.linkUrl;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 链接
	 */
	public void setLinkUrl(java.lang.String linkUrl) {
		this.linkUrl = linkUrl;
	}
	
	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 新窗口打开（1,是、0否）
	 */
	@Column(name = "BLANK", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getBlank() {
		return this.blank;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 新窗口打开（1,是、0否）
	 */
	public void setBlank(java.lang.Integer blank) {
		if (blank == null) {
			this.blank = 0;
		} else {
			this.blank = blank;
		}
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 创建人
	 */
	@Column(name = "CREATE_BY", nullable = true, length = 32)
	public java.lang.String getCreateBy() {
		return this.createBy;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 创建人
	 */
	public void setCreateBy(java.lang.String createBy) {
		this.createBy = createBy;
	}
	
	/**
	 * 方法: 取得java.util.Date
	 *
	 * @return: java.util.Date 创建时间
	 */
	@Column(name = "CREATE_TIME", nullable = true)
	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 创建时间
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
	/**
	 * 方法: 取得java.util.Date
	 *
	 * @return: java.util.Date 修改时间
	 */
	@Column(name = "UPDATE_TIME", nullable = true)
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 修改时间
	 */
	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 修改人
	 */
	@Column(name = "UPDATE_BY", nullable = true, length = 32)
	public java.lang.String getUpdateBy() {
		return this.updateBy;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 修改人
	 */
	public void setUpdateBy(java.lang.String updateBy) {
		this.updateBy = updateBy;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 站点id
	 */
	@Column(name = "SITE_ID", nullable = true, length = 32)
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
}
