package com.leimingtech.cms.controller.visibletemplate;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

public class BaseController extends
		com.leimingtech.core.controller.BaseController {

	/** 基于@ExceptionHandler异常处理 */
	@ExceptionHandler
	@ResponseBody
	public String exp(HttpServletRequest request, Exception ex) {
		return new JSONObject().accumulate("isSuccess", false)
				.accumulate("msg", "系统异常：" + ex.getMessage()).toString();
	}
}
