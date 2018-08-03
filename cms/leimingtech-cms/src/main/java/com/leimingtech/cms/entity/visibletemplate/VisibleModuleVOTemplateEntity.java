package com.leimingtech.cms.entity.visibletemplate;


import com.leimingtech.core.util.MapJsonUtil;

import java.util.Map;

/**
 * 可视化模板组件  模板
 * @author liuzhen
 *
 */
public class VisibleModuleVOTemplateEntity {

	private String id;
	/** 模板操作代码 */
	private java.lang.String template;
	/**组件模板中需要的参数*/
	private String params;

	public Map<String,Object> getParams() {
		return MapJsonUtil.parseJSON2Map(params);
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 方法: 取得java.lang.String
	 *
	 * @return: java.lang.String 模板操作代码
	 */
	public java.lang.String getTemplate() {
		return this.template;
	}

	/**
	 * 方法: 设置java.lang.String
	 *
	 * @param: java.lang.String 模板操作代码
	 */
	public void setTemplate(java.lang.String template) {
		this.template = template;
	}
	
}
