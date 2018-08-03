package com.leimingtech.base.entity.temp;
import  com.leimingtech.base.entity.IdEntity;
import org.hibernate.annotations.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 *菜单权限表
 * @author  
 */
@Entity
@Table(name = "cms_function")
public class TSFunction extends IdEntity implements java.io.Serializable {
	private String parentId;//父菜单
	private String name;//菜单名称
	private int level;//菜单所在层级
	private String href;//菜单地址
	private Integer sort;//菜单排序
	private String permission;//权限标识
	private String icon;//图标class样式
	private java.lang.String parentIds;//所有父节点id
	private Integer showFlag;//是否在菜单中显示（1显示、0不显示）
	private int childShowCount;//子集中展示的数量
	private String target;//目标 留空或者“_blank”
	private String createBy;//创建人
	private java.util.Date createdTime;//创建时间
	private java.util.Date updateTime;//修改时间
	private Integer flag;//平台管理员菜单权限标识
	private String updateBy;//修改人
	private String remarks;//备注

	/**
	 * 方法: 取得java.lang.Integer
	 *
	 * @return: java.lang.Integer 平台管理员菜单标识
	 */
	@Column(name = "PLATFORM_MANAGER_FLAG", nullable = false, precision = 10, scale = 0)
	public java.lang.Integer getFlag() {
		return this.flag;
	}

	/**
	 * 方法: 设置java.lang.Integer
	 *
	 * @param: java.lang.Integer 平台管理员菜单标识
	 */
	public void setFlag(java.lang.Integer flag) {
		this.flag = flag;
	}

	@Column(name = "parent_id", length = 32)
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "fun_level")
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	@Column(name = "href", length = 100)
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Column(name = "sort")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name = "permission", length = 200)
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	@Column(name = "icon", length = 32)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "parent_ids", length = 2000)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	@Column(name = "show_flag")
	public Integer getShowFlag() {
		return showFlag;
	}

	public void setShowFlag(Integer showFlag) {
		this.showFlag = showFlag;
	}

	@Column(name = "child_show_count")
	public int getChildShowCount() {
		return childShowCount;
	}

	public void setChildShowCount(int childShowCount) {
		this.childShowCount = childShowCount;
	}

	@Column(name = "target", length = 20)
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Column(name = "create_by", length = 32)
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name = "created_time")
	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	@Column(name = "update_time")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "update_by")
	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name = "remarks", length = 255)
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}