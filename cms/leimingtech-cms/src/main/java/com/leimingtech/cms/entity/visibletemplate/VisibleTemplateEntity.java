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
 * @Description: 可视化模板
 * @author 
 * @date 2016-10-11 13:55:38
 * @version V1.0   
 *
 */
@Entity
@Table(name = "visible_template", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class VisibleTemplateEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 8874161547292091752L;
	/** 标题 */
	private java.lang.String title;
	/** 备注 */
	private java.lang.String remark;
	/**自定义css路径存储*/
	private String cssPath;
	/** 模板类型（1、首页；2、栏目首页；3、栏目列表页；4、文章详情页；5、图片详情页；6、视频详情页；7、投票详情页；8、调查详情页；9、活动详情页；10、专题页） */
	private java.lang.Integer templateType;
	/** 可视化模板代码 */
	private java.lang.String visibleTemplate;
	/** 模板操作代码 */
	private java.lang.String template;
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

	public VisibleTemplateEntity() {
	}

	/**
	 * 新建模板时的构造
	 * @param templateType
	 * @param title
	 * @param createBy
	 * @param createTime
     * @param siteId
     */
	public VisibleTemplateEntity(Integer templateType, String title, String createBy, Date createTime, String siteId) {
		this.templateType = templateType;
		this.title = title;
		this.createBy = createBy;
		this.createTime = createTime;
		this.updateBy = createBy;
		this.updateTime = createTime;
		this.siteId = siteId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 标题
	 */
	@Column(name = "TITLE", nullable = true, length = 50)
	public java.lang.String getTitle() {
		return this.title;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 标题
	 */
	public void setTitle(java.lang.String title) {
		this.title = title;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 备注
	 */
	@Column(name = "REMARK", nullable = true, length = 255)
	public java.lang.String getRemark() {
		return this.remark;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 备注
	 */
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	/**自定义css路径存储*/
	@Column(name = "CSS_PATH", nullable = true, length = 2000)
	public String getCssPath() {
		return cssPath;
	}

	/**自定义css路径存储*/
	public void setCssPath(String cssPath) {
		this.cssPath = cssPath;
	}

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 模板类型（1、首页；2、栏目首页；3、栏目列表页；4、文章详情页；5、图片详情页；6、视频详情页；7、投票详情页；8、调查详情页；9、活动详情页；10、专题页）
	 */
	@Column(name = "TEMPLATE_TYPE", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getTemplateType() {
		return this.templateType;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 模板类型（1、首页；2、栏目首页；3、栏目列表页；4、文章详情页；5、图片详情页；6、视频详情页；7、投票详情页；8、调查详情页；9、活动详情页；10、专题页）
	 */
	public void setTemplateType(java.lang.Integer templateType) {
		this.templateType = templateType;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 可视化模板代码
	 */
	@Column(name = "VISIBLE_TEMPLATE", nullable = true)
	public java.lang.String getVisibleTemplate() {
		return this.visibleTemplate;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 可视化模板代码
	 */
	public void setVisibleTemplate(java.lang.String visibleTemplate) {
		this.visibleTemplate = visibleTemplate;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 模板操作代码
	 */
	@Column(name = "TEMPLATE", nullable = true)
	public java.lang.String getTemplate() {
		return this.template;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 模板操作代码
	 */
	public void setTemplate(java.lang.String template) {
		this.template = template;
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
