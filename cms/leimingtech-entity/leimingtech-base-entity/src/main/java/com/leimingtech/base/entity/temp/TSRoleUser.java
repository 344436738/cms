package com.leimingtech.base.entity.temp;

import  com.leimingtech.base.entity.IdEntity;

import javax.persistence.*;


/**
 * TSRoleUser entity.
 * @author  
 */
@Entity
@Table(name = "cms_role_user")
public class TSRoleUser extends IdEntity implements java.io.Serializable {
	private TSUser TSUser;
	private TSRole TSRole;
	private String siteId;
	/**创建时间*/
	private java.util.Date createdtime;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid")

	public TSUser getTSUser() {
		return this.TSUser;
	}

	public void setTSUser(TSUser TSUser) {
		this.TSUser = TSUser;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "roleid")
	public TSRole getTSRole() {
		return this.TSRole;
	}

	public void setTSRole(TSRole TSRole) {
		this.TSRole = TSRole;
	}

	@Column(name ="SITE_ID" ,nullable = true,length = 32)
	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	/**
	 *方法: 取得java.lang.Date
	 *@return: java.lang.Date  创建时间
	 */
	@JoinColumn(name = "CREATEDTIME", nullable = true)
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