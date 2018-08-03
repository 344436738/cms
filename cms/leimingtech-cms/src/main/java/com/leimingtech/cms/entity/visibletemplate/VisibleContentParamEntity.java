package com.leimingtech.cms.entity.visibletemplate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 内容条件
 * @author 
 * @date 2016-11-17 17:27:56
 * @version V1.0   
 *
 */
@Entity
@Table(name = "visible_content_param", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class VisibleContentParamEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 4721724941539304147L;
	/** 组件键值 */
	private java.lang.String moduleKey;
	/** 模板id */
	private java.lang.String templateId;
	/** 组件id */
	private java.lang.String moduleId;
	/** 栏目id */
	private java.lang.String catid;
	/** 条数 */
	private java.lang.Integer count;
	/**是否必须包含缩略图（1包含、0不包含）*/
	private int image;
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
	 * @return: java.lang.String 栏目id
	 */
	@Column(name = "CATID", nullable = true, length = 32)
	public java.lang.String getCatid() {
		return this.catid;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 栏目id
	 */
	public void setCatid(java.lang.String catid) {
		this.catid = catid;
	}
	
	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 条数
	 */
	@Column(name = "COUNT", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getCount() {
		return this.count;
	}

	/**是否必须包含缩略图（1包含、0不包含）*/
	@Column(name = "IMAGE", nullable = true, precision = 10, scale = 0)
	public int getImage() {
		return image;
	}

	public void setImage(int image) {
		this.image = image;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 条数
	 */
	public void setCount(java.lang.Integer count) {
		this.count = count;
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
