package com.leimingtech.ueditor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.core.util.StringUtils;
import com.leimingtech.ueditor.define.ActionMap;
import com.leimingtech.ueditor.define.AppInfo;
import com.leimingtech.ueditor.define.BaseState;
import com.leimingtech.ueditor.define.State;
import com.leimingtech.ueditor.hunter.FileManager;
import com.leimingtech.ueditor.hunter.ImageHunter;
import com.leimingtech.ueditor.upload.Uploader;

public class ActionEnter {

	private HttpServletRequest request = null;

	private String rootPath = null;
	private String contextPath = null;
	private String isMember = null;
	private String actionType = null;

	private ConfigManager configManager = null;

	private boolean save = true;

	public ActionEnter(HttpServletRequest request, String rootPath,String isMember) {

		this.request = request;
		this.rootPath = rootPath;
		if(StringUtils.isNotEmpty(isMember)){
			this.isMember = isMember;
		}
		this.actionType = request.getParameter("action");
		this.contextPath = request.getContextPath();
		this.configManager = ConfigManager.getInstance(this.rootPath, this.contextPath, request.getRequestURI());

		String issave = request.getParameter("save");// 是否保存到图库/视频库/附件库
		if (StringUtils.isNotEmpty(issave) && "false".equalsIgnoreCase(issave)) {
			save = false;// 默认为保存
		}

	}

	public String exec() {

		String callbackName = this.request.getParameter("callback");

		if (callbackName != null) {

			if (!validCallbackName(callbackName)) {
				return new BaseState(false, AppInfo.ILLEGAL).toJSONString();
			}

			return callbackName + "(" + this.invoke() + ");";

		} else {
			return this.invoke();
		}

	}

	public String invoke() {

		if (actionType == null || !ActionMap.mapping.containsKey(actionType)) {
			return new BaseState(false, AppInfo.INVALID_ACTION).toJSONString();
		}

		if (this.configManager == null || !this.configManager.valid()) {
			return new BaseState(false, AppInfo.CONFIG_ERROR).toJSONString();
		}

		State state = null;

		int actionCode = ActionMap.getType(this.actionType);

		Map<String, Object> conf = new HashMap<String, Object>();
		conf.put("save", save);//是否保存到图库/视频库/附件库

		switch (actionCode) {

		case ActionMap.CONFIG:
			return this.configManager.getAllConfig().toString();

		case ActionMap.UPLOAD_IMAGE:
		case ActionMap.UPLOAD_SCRAWL:
		case ActionMap.UPLOAD_VIDEO:
		case ActionMap.UPLOAD_FILE:
			conf.putAll(this.configManager.getConfig(actionCode));
			conf.put("upload_file_type", actionCode);
			state = new Uploader(request, conf,isMember).doExec();
			break;

		case ActionMap.CATCH_IMAGE:
			conf.putAll(configManager.getConfig(actionCode));
			conf.put("upload_file_type", actionCode);
			String[] list = this.request.getParameterValues((String) conf.get("fieldName"));
			state = new ImageHunter(conf).capture(list);
			break;

		case ActionMap.LIST_IMAGE:
		case ActionMap.LIST_FILE:
			conf.putAll(configManager.getConfig(actionCode));
			conf.put("upload_file_type", actionCode);
			int start = this.getStartIndex();
			state = new FileManager(conf).listFile(start);
			break;

		}

		return state.toJSONString();

	}

	public int getStartIndex() {

		String start = this.request.getParameter("start");

		try {
			return Integer.parseInt(start);
		} catch (Exception e) {
			return 0;
		}

	}

	/**
	 * callback参数验证
	 */
	public boolean validCallbackName(String name) {

		if (name.matches("^[a-zA-Z_]+[\\w0-9_]*$")) {
			return true;
		}

		return false;

	}

}