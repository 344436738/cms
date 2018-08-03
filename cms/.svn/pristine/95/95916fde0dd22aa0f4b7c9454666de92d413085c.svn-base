package com.leimingtech.base.entity.temp;
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

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import  com.leimingtech.base.entity.IdEntity;


/**   
 * @Title: Entity
 * @Description: 分类管理
 * @author leiming
 * @date 2014-04-09 09:43:54
 * @version V1.0   
 *
 */
@Entity
@Table(name = "cms_classify", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class ClassifyEntity extends IdEntity implements java.io.Serializable {
	 
	/**分类名称*/
	private java.lang.String name;
	/**分类描述*/
	private java.lang.String info;
	/**显示顺序*/
	private java.lang.String sorts;
	/**分类图片外链地址（宽720高400）*/
	private java.lang.String img;
	/**外链网站或活动*/
	private java.lang.String url;
	/**首页显示*/
	private java.lang.String status;
	/**token*/
	private java.lang.String token;
	/**分类级别*/
	private java.lang.Integer levels;
	private  ClassifyEntity  classify ;
	private  List<ClassifyEntity> classifys=new ArrayList<ClassifyEntity>();
	
	/**创建时间*/
	private java.util.Date createdtime;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentid")
	public ClassifyEntity getClassify() {
		return this.classify;
	}

	public void setClassify(ClassifyEntity classify) {
		this.classify = classify;
	}
	 
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "classify")
	public List<ClassifyEntity> getClassifys() {
		return classifys;
	}
	public void setClassifys(List<ClassifyEntity> classifys) {
		this.classifys = classifys;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分类名称
	 */
	
	
	@Column(name ="NAME",nullable=false,length=60)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类名称
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分类描述
	 */
	
	
	@Column(name ="INFO",nullable=false,length=90)
	public java.lang.String getInfo(){
		return this.info;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类描述
	 */
	public void setInfo(java.lang.String info){
		this.info = info;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  显示顺序
	 */
	
	
	@Column(name ="SORTS",nullable=false,length=6)
	public java.lang.String getSorts(){
		return this.sorts;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  显示顺序
	 */
	public void setSorts(java.lang.String sorts){
		this.sorts = sorts;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分类图片外链地址（宽720高400）
	 */
	
	
	@Column(name ="IMG",nullable=false,length=255)
	public java.lang.String getImg(){
		return this.img;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类图片外链地址（宽720高400）
	 */
	public void setImg(java.lang.String img){
		this.img = img;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外链网站或活动
	 */
	
	
	@Column(name ="URL",nullable=false,length=255)
	public java.lang.String getUrl(){
		return this.url;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外链网站或活动
	 */
	public void setUrl(java.lang.String url){
		this.url = url;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  首页显示
	 */
	
	
	@Column(name ="STATUS",nullable=false,length=1)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  首页显示
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  token
	 */
	
	
	@Column(name ="TOKEN",nullable=false,length=30)
	public java.lang.String getToken(){
		return this.token;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  token
	 */
	public void setToken(java.lang.String token){
		this.token = token;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  分类级别
	 */
	
	
	@Column(name ="LEVELS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getLevels(){
		return this.levels;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  分类级别
	 */
	public void setLevels(java.lang.Integer levels){
		this.levels = levels;
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
