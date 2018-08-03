package com.leimingtech.cms.entity.visibletemplate;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;

/**
 * 模板组件demo
 * 
 * @author liuzhen
 * 
 */
public class VisibleTemplateModuleVODemoEntity implements Serializable {
	/** 组件键值，唯一标识 */
	private java.lang.String moduleKey;
	/** 名称 */
	private java.lang.String moduleName;
	/** 示例效果代码 */
	private java.lang.String demo;

	public java.lang.String getModuleKey() {
		return moduleKey;
	}

	public void setModuleKey(java.lang.String moduleKey) {
		this.moduleKey = moduleKey;
	}

	public java.lang.String getModuleName() {
		return moduleName;
	}

	public void setModuleName(java.lang.String moduleName) {
		this.moduleName = moduleName;
	}

	public java.lang.String getDemo() {
		if(StringUtils.isNotBlank(demo)){
			demo=StringEscapeUtils.unescapeHtml(demo);
		}
		return demo;
	}

	public void setDemo(java.lang.String demo) {
		this.demo = demo;
	}

}
