package com.leimingtech.member.demo;


import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

@ApiModel
@XmlRootElement(name = "root")
public class BaseApiEntity<T> {
	@ApiModelProperty(value = "结果",required = true)
	private String code;
	@ApiModelProperty(value = "message",required = true)
	private String msg;
	@ApiModelProperty(value = "数据",required = true)
	private T ret;


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getRet() {
		return ret;
	}

	public void setRet(T ret) {
		if(ret==null){
			return;
		}
		this.ret = ret;
	}

}
