package com.leimingtech.mobile.entity.appapi.tipoff;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * Created by hejiping on 2017/5/23.
 */
@ApiModel
public class TipOffEntity {

    @ApiModelProperty(value="爆料内容")
    private String tipOffContent;
    @ApiModelProperty(value="爆料人")
    private String tipOffMember;
    @ApiModelProperty(value="爆料时间")
    private Date createDate;

    public String getTipOffContent() {
        return tipOffContent;
    }

    public void setTipOffContent(String tipOffContent) {
        this.tipOffContent = tipOffContent;
    }

    public String getTipOffMember() {
        return tipOffMember;
    }

    public void setTipOffMember(String tipOffMember) {
        this.tipOffMember = tipOffMember;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
