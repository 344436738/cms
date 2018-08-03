package com.leimingtech.wechat.entity.wechatcorpsite;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.leimingtech.base.entity.IdEntity;

import java.util.Date;

/**   
 * @Title: Entity
 * @Description: 企业号关联表
 * @author 
 * @date 2017-03-27 11:51:32
 * @version V1.0   
 *
 */
@Entity
@Table(name = "wechat_corp_site", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class WechatCorpSiteEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = -5665940719433136690L;
	/** 企业号id */
	private String corpId;
	/** 企业号名称 */
	private String corpName;
	/** 创建时间 */
	private java.util.Date createTime;
	/** 创建时间*/
	private String createBy;


	@Column(name = "CREATE_BY", nullable = true, length = 255)
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name = "CORP_NAME", nullable = true, length = 255)
	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	/** 站点id */
	private String siteId;

	@Column(name = "CORP_ID", nullable = true, length = 255)
	public String getCorpId() {
		return corpId;
	}

	public void setCorpId(String corpId) {
		this.corpId = corpId;
	}
	@Column(name = "SITE_ID", nullable = true, length = 32)
	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	@Column(name = "CREATE_TIME", nullable = true)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	

}
