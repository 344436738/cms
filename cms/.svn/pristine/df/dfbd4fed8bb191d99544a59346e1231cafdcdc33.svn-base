package com.leimingtech.mobile.entity.appapi.member;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

/**
 * Created by llj on 2017/5/22.
 * 用户实体
 */
@ApiModel
public class MemberEntity {

    private String id;//用户id

    @NotBlank(message = "用户昵称不能为空")
    @ApiModelProperty(value = "用户昵称", required = true)
    private String userName;//用户昵称

    private String password;//密码

    private String siteId;//站点id

    private Date createTime;//创建时间

    private String phoneNumber;//电话号码

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
