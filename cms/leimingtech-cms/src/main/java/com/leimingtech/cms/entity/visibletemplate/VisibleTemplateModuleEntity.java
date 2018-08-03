package com.leimingtech.cms.entity.visibletemplate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 可视化模板组件配置
 * @author 
 * @date 2016-09-28 14:24:16
 * @version V1.0   
 *
 */
@Entity
@Table(name = "visible_template_module", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class VisibleTemplateModuleEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 2794072090415597884L;
	/** 组件键值，唯一标识 */
	private java.lang.String moduleKey;
	/** 名称 */
	private java.lang.String moduleName;
	/** 模板代码 */
	private java.lang.String template;
	/** 示例效果代码 */
	private java.lang.String demo;
	/** 模板操作代码 */
	private java.lang.String controllerCode;
	/** 排序 */
	private java.lang.Integer sort;
	/** 创建时间 */
	private java.util.Date createTime;
	/** 创建人 */
	private java.lang.String createBy;
	/** 修改时间 */
	private java.util.Date updateTime;
	/** 修改人 */
	private java.lang.String updateBy;
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 组件键值，唯一标识
	 */
	@Column(name = "MODULE_KEY", nullable = true, length = 255)
	public java.lang.String getModuleKey() {
		return this.moduleKey;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 组件键值，唯一标识
	 */
	public void setModuleKey(java.lang.String moduleKey) {
		this.moduleKey = moduleKey;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 名称
	 */
	@Column(name = "MODULE_NAME", nullable = true, length = 255)
	public java.lang.String getModuleName() {
		return this.moduleName;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 名称
	 */
	public void setModuleName(java.lang.String moduleName) {
		this.moduleName = moduleName;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 模板代码
	 */
	@Column(name = "TEMPLATE", nullable = true, length = 65535)
	public java.lang.String getTemplate() {
		return this.template;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 模板代码
	 */
	public void setTemplate(java.lang.String template) {
		this.template = template;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 示例效果代码
	 */
	@Column(name = "DEMO", nullable = true, length = 65535)
	public java.lang.String getDemo() {
		return this.demo;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 示例效果代码
	 */
	public void setDemo(java.lang.String demo) {
		this.demo = demo;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 模板操作代码
	 */
	@Column(name = "CONTROLLER_CODE", nullable = true, length = 65535)
	public java.lang.String getControllerCode() {
		return this.controllerCode;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 模板操作代码
	 */
	public void setControllerCode(java.lang.String controllerCode) {
		this.controllerCode = controllerCode;
	}
	
	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 排序
	 */
	@Column(name = "SORT", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getSort() {
		return this.sort;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 排序
	 */
	public void setSort(java.lang.Integer sort) {
		this.sort = sort;
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
}
