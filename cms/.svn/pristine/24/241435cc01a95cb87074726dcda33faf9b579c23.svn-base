package com.leimingtech.cms.entity.visibletemplate;

import com.leimingtech.base.entity.IdEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 分页条件
 * @author 
 * @date 2016-11-17 17:27:56
 * @version V1.0   
 *
 */
@Entity
@Table(name = "visible_content_list_param", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class VisibleContentListParamEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 4721724941539304147L;
	/** 组件键值 */
	private String moduleKey;
	/** 模板id */
	private String templateId;
	/** 组件id */
	private String moduleId;
	/** 栏目id */
	private String catId;
	/** 创建人 */
	private String createBy;
	/** 创建时间 */
	private java.util.Date createTime;
	/** 修改时间 */
	private java.util.Date updateTime;
	/** 修改人 */
	private String updateBy;
	/** 站点id */
	private String siteId;
	/**页数*/
	private int count;

	@Column(name = "COUNT", nullable = true, precision = 10, scale = 0)
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 组件键值
	 */
	@Column(name = "MODULE_KEY", nullable = true, length = 255)
	public String getModuleKey() {
		return this.moduleKey;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 组件键值
	 */
	public void setModuleKey(String moduleKey) {
		this.moduleKey = moduleKey;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 模板id
	 */
	@Column(name = "TEMPLATE_ID", nullable = true, length = 32)
	public String getTemplateId() {
		return this.templateId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 模板id
	 */
	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 组件id
	 */
	@Column(name = "MODULE_ID", nullable = true, length = 32)
	public String getModuleId() {
		return this.moduleId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 组件id
	 */
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 栏目id
	 */
	@Column(name = "CATID", nullable = true, length = 32)
	public String getCatId() {
		return this.catId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 栏目id
	 */
	public void setCatId(String catId) {
		this.catId = catId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 创建人
	 */
	@Column(name = "CREATE_BY", nullable = true, length = 32)
	public String getCreateBy() {
		return this.createBy;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 创建人
	 */
	public void setCreateBy(String createBy) {
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
	public String getUpdateBy() {
		return this.updateBy;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 修改人
	 */
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 站点id
	 */
	@Column(name = "SITE_ID", nullable = true, length = 32)
	public String getSiteId() {
		return this.siteId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 站点id
	 */
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
}
