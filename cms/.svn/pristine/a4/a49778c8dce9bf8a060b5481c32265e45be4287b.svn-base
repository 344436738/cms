package com.leimingtech.wechat.entity.wechatenterprisetag;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 微信企业号标签
 * @author 
 * @date 2017-03-24 11:26:02
 * @version V1.0   
 *
 */
@Entity
@Table(name = "wechat_enterprise_tag", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class WechatEnterpriseTagEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = -5775013974187001246L;
	/** 标签id */
	private java.lang.String tagId;
	/** 标签名字 */
	private java.lang.String tagName;
	/** 企业号唯一标识*/
	private java.lang.String enterpriseId;
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 标签id
	 */
	@Column(name = "TAG_ID", nullable = true, length = 32)
	public java.lang.String getTagId() {
		return this.tagId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 标签id
	 */
	public void setTagId(java.lang.String tagId) {
		this.tagId = tagId;
	}
	
	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 标签名字
	 */
	@Column(name = "TAG_NAME", nullable = true, length = 255)
	public java.lang.String getTagName() {
		return this.tagName;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 标签名字
	 */
	public void setTagName(java.lang.String tagName) {
		this.tagName = tagName;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 企业号唯一标识
	 */
	@Column(name = "ENTERPRISE_ID", nullable = true, length = 255)
	public java.lang.String getEnterpriseId() {
		return this.enterpriseId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 企业号唯一标识
	 */
	public void setEnterpriseId(java.lang.String enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
}
