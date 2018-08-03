package com.leimingtech.mobile.entity.appapi.login;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by wangtao on 2017/5/21 0021.
 */

@ApiModel(value="登录",description = "loginApiEntity")
@XmlRootElement(name = "root")
public class LoginApiEntity extends BaseApiEntity {
    @ApiModelProperty(value="数据",required = true)
    private LoginEntityList ret;

    @Override
    public LoginEntityList getRet() {
        return ret;
    }

    public void setRet(LoginEntityList ret) {
        this.ret = ret;
    }
}
