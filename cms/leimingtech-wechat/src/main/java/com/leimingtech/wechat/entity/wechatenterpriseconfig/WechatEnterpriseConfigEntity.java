package com.leimingtech.wechat.entity.wechatenterpriseconfig;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

import java.util.Date;

/**   
 * @Title: Entity
 * @Description: 微信企业号配置类
 * @author 
 * @date 2017-03-24 11:17:22
 * @version V1.0   
 *
 */
@Entity
@Table(name = "wechat_enterprise_config", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class WechatEnterpriseConfigEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 2479230717806371530L;
	/** 企业号标识 */
	private java.lang.String corpId;
	/** 管理组凭证密钥 */
	private java.lang.String corpSecret;
	/** 企业号名称 */
	private java.lang.String corpName;
	/** 企业号获取访问接口token */
	private java.lang.String accessToken;
	/** EncodingAESKey */
	private java.lang.String agentid;
	/** 创建人 */
	private java.lang.String createBy;
	/** 创建时间 */
	private Date createtime;
	/** access_token获取时间 */
	private java.lang.String accessTokenTime;

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 企业号标识
	 */
	@Column(name = "CORP_ID", nullable = true, length = 255)
	public java.lang.String getCorpId() {
		return this.corpId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号标识
	 */
	public void setCorpId(java.lang.String corpId) {
		this.corpId = corpId;
	}



	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 企业号创建人
	 */
	@Column(name = "CREATE_BY", nullable = true, length = 255)
	public java.lang.String getCreateBy() {
		return this.createBy;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号创建人
	 */
	public void setCreateBy(java.lang.String createBy) {
		this.createBy = createBy;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 管理组凭证密钥
	 */
	@Column(name = "CORP_SECRET", nullable = true, length = 255)
	public java.lang.String getCorpSecret() {
		return this.corpSecret;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 管理组凭证密钥
	 */
	public void setCorpSecret(java.lang.String corpSecret) {
		this.corpSecret = corpSecret;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号名称
	 */
	@Column(name = "CORP_NAME", nullable = true, length = 255)
	public String getCorpName() {
		return corpName;
	}
	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号名称
	 */
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 企业号获取访问接口token
	 */
	@Column(name = "ACCESS_TOKEN", nullable = true, length = 255)
	public java.lang.String getAccessToken() {
		return this.accessToken;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号获取访问接口token
	 */
	public void setAccessToken(java.lang.String accessToken) {
		this.accessToken = accessToken;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String EncodingAESKey
	 */
	@Column(name = "AGENTID", nullable = true, length = 255)
	public java.lang.String getAgentid() {
		return this.agentid;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String EncodingAESKey
	 */
	public void setAgentid(java.lang.String agentid) {
		this.agentid = agentid;
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
	 * 方法: 取得java.util.Date
	 *
	 * @return: java.util.Date 创建时间
	 */
	@Column(name = "ACCESS_TOKEN_TIME", nullable = true)
	public java.lang.String getAccessTokenTime() {
		return this.accessTokenTime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 创建时间
	 */
	public void setAccessTokenTime(java.lang.String accessTokenTime) {
		this.accessTokenTime = accessTokenTime;
	}
}
