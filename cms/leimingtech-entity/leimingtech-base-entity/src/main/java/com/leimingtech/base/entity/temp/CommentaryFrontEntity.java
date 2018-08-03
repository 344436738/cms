package com.leimingtech.base.entity.temp;

import com.leimingtech.base.entity.IdEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * @Title: Entity
 * @Description: 评论
 * @author zhangdaihao
 * @date 2014-05-06 15:26:26
 * @version V1.0
 *
 */
@Entity
@Table(name = "cms_commentary", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class CommentaryFrontEntity extends IdEntity implements java.io.Serializable {

	/**用户名*/
	private String username;

	/**文章主题*/
	private String title;
	/**内容*/
	private String content;
	/**评论人*/
	private String commentaryperson;
	/**评论人ID*/
	private String personid;
	/**评论时间*/
	private Date commentarytime;

	/**文章id*/
	private String contentid;

	/**评价类型*/
	private String commentType;
	/**审核状态*/
	private String ischeck;

	/**创建时间*/
	private Date createdtime;

	/** 审核人*/
	private String auditorName;

	/**审核人ID*/
	private String auditorId;

	/**审核时间*/
	private Date auditorCreateTime;

	/**点赞数*/
	private Integer supportcount;

	/**贬赞数*/
	private Integer opposecount;

	/**跟帖数量*/
	private Integer replycount;

	/**站点Id*/
	private String siteId;
	@Column(name ="site_id",nullable=true,length=32)
	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	@Column(name ="reply_count",nullable=true,length=11)
	public Integer getReplycount() {
		return replycount;
	}
	
	public void setReplycount(Integer replycount) {
		this.replycount = replycount;
	}
	@Column(name ="auditor_name",nullable=true,length=255)
	public String getAuditorName() {
		return auditorName;
	}
	@Column(name ="auditor_id",nullable=true,length=32)
	public String getAuditorId() {
		return auditorId;
	}
	
	public void setAuditorId(String auditorId) {
		this.auditorId = auditorId;
	}
	@Column(name ="auditor_create_time",nullable=true)
	public Date getAuditorCreateTime() {
		return auditorCreateTime;
	}

	public void setAuditorCreateTime(Date auditorCreateTime) {
		this.auditorCreateTime = auditorCreateTime;
	}

	/**
	 *方法: 取得 赞同数
	 *@return: java.lang.Integer  赞同数
	 */
	@Column(name ="support_count",nullable=true,length=11)
	public Integer getSupportcount() {
		return supportcount;
	}

	public void setSupportcount(Integer supportcount) {
		this.supportcount = supportcount;
	}

	/**
	 *方法: 取得 反对数
	 *@return: java.lang.Integer  赞同数
	 */
	@Column(name ="oppose_count",nullable=true,length=11)
	public Integer getOpposecount() {
		return opposecount;
	}


	public void setOpposecount(Integer opposecount) {
		this.opposecount = opposecount;
	}

	public void setAuditorName(String auditorName) {
		this.auditorName = auditorName;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户名
	 */
	@Column(name ="user_name",nullable=true,length=255)
	public String getUsername(){
		return this.username;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户名
	 */
	public void setUsername(String username){
		this.username = username;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  文章主题
	 */
	@Column(name ="title",nullable=true,length=255)
	public String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文章主题
	 */
	public void setTitle(String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  内容
	 */
	@Column(name ="content",nullable=true,length=255)
	public String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  内容
	 */
	public void setContent(String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论人
	 */
	@Column(name ="commentary_person",nullable=true,length=255)
	public String getCommentaryperson(){
		return this.commentaryperson;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论人
	 */
	public void setCommentaryperson(String commentaryperson){
		this.commentaryperson = commentaryperson;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论人ID
	 */
	@Column(name ="person_id",nullable=true,length=32)
	public String getPersonid(){
		return this.personid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论人ID
	 */
	public void setPersonid(String personid){
		this.personid = personid;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  评论时间
	 */
	@Column(name ="commentary_time",nullable=true)
	public Date getCommentarytime(){
		return this.commentarytime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  评论时间
	 */
	public void setCommentarytime(Date commentarytime){
		this.commentarytime = commentarytime;
	}




	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  文章id
	 */

	@Column(name ="content_id",nullable=true,length=32)
	public String getContentid(){

		return this.contentid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文章id
	 */
	public void setContentid(String contentid){
		this.contentid = contentid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评价类型
	 */
	@Column(name ="comment_type",nullable=true,length=50)
	public String getCommentType(){
		return this.commentType;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评价类型
	 */
	public void setCommentType(String commentType){
		this.commentType = commentType;
	}

	/**
	 * 方法: 取得java.lang.String
	 * @return java.lang.String 审核状态
	 */
	@Column(name ="is_check",nullable=true,length=10)
	public String getIscheck() {
		return ischeck;
	}

	/**
	 * 方法：设置java.lang.String
	 * @param ischeck   审核状态
	 */
	public void setIscheck(String ischeck) {
		this.ischeck = ischeck;
	}

	/**
	 *方法: 取得java.lang.Date
	 *@return: java.lang.Date  创建时间
	 */
	@Column(name = "createdtime", nullable = true)
	public Date getCreatedtime() {
		return createdtime;
	}
	/**
	 *方法: 设置java.lang.Date
	 *@return: java.lang.Date  创建时间
	 */
	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

}
