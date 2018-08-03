package com.leimingtech.ueditor.upload;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.core.util.StringUtils;
import com.leimingtech.ueditor.define.State;

public class Uploader {
	private HttpServletRequest request = null;
	private Map<String, Object> conf = null;
	private String isMember = null;
	public Uploader(HttpServletRequest request, Map<String, Object> conf,String isMember) {
		this.request = request;
		this.conf = conf;
		if(StringUtils.isNotEmpty(isMember)){
			this.isMember = isMember;
		}
	}

	public final State doExec() {
		String filedName = (String) this.conf.get("fieldName");
		State state = null;

		if ("true".equals(this.conf.get("isBase64"))) {
			state = Base64Uploader.save(this.request.getParameter(filedName),
					this.conf,this.isMember);
		} else {
			state = BinaryUploader.save(this.request, this.conf,this.isMember);
		}

		return state;
	}
}
