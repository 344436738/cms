package com.leimingtech.mobile.entity.appapi.member;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by llj on 2017/5/22.
 */
@ApiModel(value="评论实体",description = "commentApiEntity")
@XmlRootElement(name = "root")
public class MemberApiEntity extends BaseApiEntity {

    @ApiModelProperty(value = "数据", required = true)
    private MemberEntityList ret;

    @Override
    public MemberEntityList getRet() {
        return ret;
    }

    public void setRet(MemberEntityList ret) {
        this.ret = ret;
    }

}
