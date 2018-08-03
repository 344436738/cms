package com.leimingtech.mobile.entity.advertisemen;

import com.leimingtech.base.entity.IdEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 内容页广告
 * @author 
 * @date 2014-08-20 21:05:58
 * @version V1.0   
 *
 */
@Entity
@Table(name = "cm_advertisemen_content", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class AdvertisemenContentEntity extends IdEntity implements java.io.Serializable {
	 
	/**是否是内置广告*/
	private java.lang.Integer isInside;
	/**广告图片地址*/
	private java.lang.String imgUrl;
	/**广告连接地址*/
	private java.lang.String connectUrl;
	/**广告广告代码*/
	private java.lang.String advertisementCode;
	/**创建时间*/
	private java.util.Date createdtime;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  是否是内置广告
	 */
	@Column(name ="IS_INSIDE",nullable=false,precision=3,scale=0)
	public java.lang.Integer getIsInside(){
		return this.isInside;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  是否是内置广告
	 */
	public void setIsInside(java.lang.Integer isInside){
		this.isInside = isInside;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  广告图片地址
	 */
	@Column(name ="IMG_URL",nullable=true,length=20)
	public java.lang.String getImgUrl(){
		return this.imgUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  广告图片地址
	 */
	public void setImgUrl(java.lang.String imgUrl){
		this.imgUrl = imgUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  广告连接地址
	 */
	@Column(name ="CONNECT_URL",nullable=true,length=20)
	public java.lang.String getConnectUrl(){
		return this.connectUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  广告连接地址
	 */
	public void setConnectUrl(java.lang.String connectUrl){
		this.connectUrl = connectUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  广告广告代码
	 */
	@Column(name ="ADVERTISEMENT_CODE",nullable=true,length=1000)
	public java.lang.String getAdvertisementCode(){
		return this.advertisementCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  广告广告代码
	 */
	public void setAdvertisementCode(java.lang.String advertisementCode){
		this.advertisementCode = advertisementCode;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建时间
	 */
	@Column(name = "CREATEDTIME", nullable = true)
	public java.util.Date getCreatedtime() {
		return createdtime;
	}
	/**
	 *方法: 设置java.lang.String
	 *@return: java.lang.String  创建时间
	 */
	public void setCreatedtime(java.util.Date createdtime) {
		this.createdtime = createdtime;
	}
	
}
