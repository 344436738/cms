package com.leimingtech.cms.entity.contribute;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 投稿配置
 * @author 
 * @date 2016-09-05 09:22:08
 * @version V1.0   
 *
 */
@Entity
@Table(name = "cms_contribute_config", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ContributeConfigEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = -7337910610175403101L;
	/** 栏目id */
	private java.lang.String catId;
	/** 栏目名 */
	private java.lang.String catName;
	/** 允许所有人（0否、1是） */
	private java.lang.Integer openFlag;
	/** 部门集合 */
	private java.lang.String departIds;
	/** 用户集合 */
	private java.lang.String memberIds;
	/** 排序 */
	private java.lang.Integer sort;
	/** 站点id */
	private java.lang.String siteId;
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
	 * @return: java.lang.String 栏目id
	 */
	@Column(name = "CAT_ID", nullable = true, length = 32)
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
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 栏目名
	 */
	@Column(name = "CAT_NAME", nullable = true, length = 100)
	public java.lang.String getCatName() {
		return this.catName;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 栏目名
	 */
	public void setCatName(java.lang.String catName) {
		this.catName = catName;
	}
	
	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 允许所有人（0否、1是）
	 */
	@Column(name = "OPEN_FLAG", nullable = true, precision = 10, scale = 0)
	public java.lang.Integer getOpenFlag() {
		return this.openFlag;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 允许所有人（0否、1是）
	 */
	public void setOpenFlag(java.lang.Integer openFlag) {
		this.openFlag = openFlag;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 部门集合
	 */
	@Column(name = "DEPART_IDS", nullable = true, length = 1000)
	public java.lang.String getDepartIds() {
		return this.departIds;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 部门集合
	 */
	public void setDepartIds(java.lang.String departIds) {
		this.departIds = departIds;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 用户集合
	 */
	@Column(name = "MEMBER_IDS", nullable = true, length = 1000)
	public java.lang.String getMemberIds() {
		return this.memberIds;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 用户集合
	 */
	public void setMemberIds(java.lang.String memberIds) {
		this.memberIds = memberIds;
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
