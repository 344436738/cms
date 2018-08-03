package com.leimingtech.platform.entity.demo;


import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "root")
public class BaseApiEntity<T> {
    private String code;
    private String msg;
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
        if (ret == null) {
            return;
        }
        this.ret = ret;
    }

}
