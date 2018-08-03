package com.leimingtech.mobile.entity.appapi.login;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * Created by wangtao  on 2017/5/21 0021.
 */

@ApiModel
public class LoginEntity {
    @ApiModelProperty(value="用户名",required = true)
    private String uesName;//用户名
    @ApiModelProperty(value="密码",required = true)
    private String passWord;//密码
    @ApiModelProperty(value="手机号",required = true)
    private String telphone;
    private Date createDate;

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUesName() {
        return uesName;
    }

    public void setUesName(String uesName) {
        this.uesName = uesName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
}
