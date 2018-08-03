package com.leimingtech.base.entity.temp;

import  com.leimingtech.base.entity.IdEntity;

import javax.persistence.*;

/**
 * TRoleFunction entity. 
 *  @author  
 */
@Entity
@Table(name = "cms_role_function")
public class TSRoleFunction extends IdEntity implements java.io.Serializable {
	private String functionid;
	private String roleid;
	/**创建时间*/
	private java.util.Date createdtime;

	@Column(name = "roleid", length = 32)
	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	@Column(name = "functionid", length = 32)
	public String getFunctionid() {
		return functionid;
	}

	public void setFunctionid(String functionid) {
		this.functionid = functionid;
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