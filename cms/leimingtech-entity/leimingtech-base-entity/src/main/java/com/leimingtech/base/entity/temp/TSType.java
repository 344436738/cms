package com.leimingtech.base.entity.temp;
// default package

import  com.leimingtech.base.entity.IdEntity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 通用类型字典表
 *  @author  
 */
@Entity
@Table(name = "cms_type")
public class TSType extends IdEntity implements java.io.Serializable {

	private TSTypegroup TSTypegroup;//类型分组
	private TSType TSType;//父类型
	private String typename;//类型名称
	private String typecode;//类型编码
//	private List<TPProcess> TSProcesses = new ArrayList();
	private List<TSType> TSTypes =new ArrayList();
	/**创建时间*/
	private java.util.Date createdtime;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "typegroupid")
	public TSTypegroup getTSTypegroup() {
		return this.TSTypegroup;
	}

	public void setTSTypegroup(TSTypegroup TSTypegroup) {
		this.TSTypegroup = TSTypegroup;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "typepid")
	public TSType getTSType() {
		return this.TSType;
	}

	public void setTSType(TSType TSType) {
		this.TSType = TSType;
	}

	@Column(name = "typename", length = 50)
	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	@Column(name = "typecode", length = 50)
	public String getTypecode() {
		return this.typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}
	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "TSType")
//	public List<TPProcess> getTSProcesses() {
//		return this.TSProcesses;
//	}
//
//	public void setTSProcesses(List<TPProcess> TSProcesses) {
//		this.TSProcesses = TSProcesses;
//	}


	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "TSType")
	public List<TSType> getTSTypes() {
		return this.TSTypes;
	}

	public void setTSTypes(List<TSType> TSTypes) {
		this.TSTypes = TSTypes;
	}
	/**
	 *方法: 取得java.lang.Date
	 *@return: java.lang.Date  创建时间
	 */
	@Column(name = "CREATEDTIME", nullable = true)
	public java.util.Date getCreatedtime() {
		return createdtime;
	}
	/**
	 *方法: 设置java.lang.Date
	 *@return: java.lang.Date  创建时间
	 */
	public void setCreatedtime(java.util.Date createdtime) {
		this.createdtime = createdtime;
	}
}