package com.leimingtech.wechat.entity.wechatenterprisepush;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 企业号推送
 * @author 
 * @date 2017-03-28 16:16:57
 * @version V1.0   
 *
 */
@Entity
@Table(name = "wechat_enterprise_push", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class WechatenterprisePushEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 7682542404854740175L;
	/** 企业号名称 */
	private java.lang.String enterpriseConfigName;
	/** 企业号配置id */
	private java.lang.String enterpriseConfigId;
	/** 站点id */
	private java.lang.String siteId;
	/** 推送时间 */
	private java.util.Date createTime;
	/** 推送人 */
	private java.lang.String createBy;
	/** 是否推送 */
	private java.lang.String isSuccess;
	/** 推送标签 */
	private java.lang.String toTagList;
	private java.lang.String toPartyList;
	private java.lang.String toUserList;
	private java.lang.String msgType;
	private java.lang.String agentId;
	private java.lang.String pushContentTitle;

	@Column(name = "PUSH_CONTENT_TITLE", nullable = true, length = 255)
	public String getPushContentTitle() {
		return pushContentTitle;
	}

	public void setPushContentTitle(String pushContentTitle) {
		this.pushContentTitle = pushContentTitle;
	}

	@Column(name = "TOPARTY_LIST", nullable = true, length = 500)
	public String getToPartyList() {
		return toPartyList;
	}

	public void setToPartyList(String toPartyList) {
		this.toPartyList = toPartyList;
	}
	@Column(name = "TOUSER_LIST", nullable = true, length = 500)
	public String getToUserList() {
		return toUserList;
	}

	public void setToUserList(String toUserList) {
		this.toUserList = toUserList;
	}
	@Column(name = "MSGTYPE", nullable = true, length = 255)
	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	@Column(name = "AGENTID", nullable = true, length = 255)
	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	@Column(name = "TOTAG_LIST", nullable = true, length = 500)
	public String getToTagList() {
		return toTagList;
	}

	public void setToTagList(String toTagList) {
		this.toTagList = toTagList;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 企业号配置id
	 */
	@Column(name = "ENTERPRISE_CONFIG_ID", nullable = true, length = 255)
	public java.lang.String getEnterpriseConfigId() {
		return this.enterpriseConfigId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号配置id
	 */
	public void setEnterpriseConfigId(java.lang.String enterpriseConfigId) {
		this.enterpriseConfigId = enterpriseConfigId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 企业号名称
	 */
	@Column(name = "ENTERPRISE_CONFIG_NAME", nullable = true, length = 255)
	public java.lang.String getEnterpriseConfigName() {
		return this.enterpriseConfigName;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号名称
	 */
	public void setEnterpriseConfigName(java.lang.String enterpriseConfigName) {
		this.enterpriseConfigName = enterpriseConfigName;
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
	 * @return: java.util.Date 推送时间
	 */
	@Column(name = "CREATE_TIME", nullable = true)
	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 推送时间
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 推送人
	 */
	@Column(name = "CREATE_BY", nullable = true, length = 255)
	public java.lang.String getCreateBy() {
		return this.createBy;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 推送人
	 */
	public void setCreateBy(java.lang.String createBy) {
		this.createBy = createBy;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 是否推送
	 */
	@Column(name = "IS_SUCCESS", nullable = true, length = 50)
	public java.lang.String getIsSuccess() {
		return this.isSuccess;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 是否推送
	 */
	public void setIsSuccess(java.lang.String isSuccess) {
		this.isSuccess = isSuccess;
	}
}
