package  com.leimingtech.base.entity.sitepermissions;

import  com.leimingtech.base.entity.IdEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 站点用户权限
 * @author 
 * @date 2017-04-28 16:31:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "cms_site_user", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
public class SitePermissionsEntity extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = -7890586125418134133L;
	/** 站点id */
	private String siteId;
	/** 用户id */
	private String userId;
	/** 用户身份 身份字段 1超级管理员2平台管理员/3站点管理员/4编辑人员**/
	private int userStatus;

	/** 创建时间 */

	private java.util.Date createTime;

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 1超级管理员2平台管理员/3站点管理员/4编辑人员
	 */
	@Column(name = "USER_STATUS", nullable = true, length = 2)
	public int getUserStatus() {
		return userStatus;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 1超级管理员2平台管理员/3站点管理员/4编辑人员
	 */
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 站点id
	 */
	@Column(name = "SITE_ID", nullable = true, length = 32)
	public String getSiteId() {
		return this.siteId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 站点id
	 */
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 用户id
	 */
	@Column(name = "USER_ID", nullable = true, length = 32)
	public String getUserId() {
		return this.userId;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 用户id
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	/**
	 * 方法: 取得java.util.Date
	 *
	 * @return: java.util.Date 创建时间
	 */
	@Column(name = "CREATE_TIME", nullable = true)
	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	/**
	 * 方法: 设置java.util.Date
	 *
	 * @param: java.util.Date 创建时间
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
}
