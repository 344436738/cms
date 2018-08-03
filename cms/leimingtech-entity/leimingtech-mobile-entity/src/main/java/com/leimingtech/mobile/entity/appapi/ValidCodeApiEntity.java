package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/22.
 */
@ApiModel(value = "验证码",description = "validCodeApiEntity")
@XmlRootElement(name="root")
public class ValidCodeApiEntity extends BaseApiEntity {

    @ApiModelProperty(value="数据")
    private ValidCodeList ret;

    @Override
    public ValidCodeList getRet() {
        return ret;
    }

    public void setRet(ValidCodeList ret) {
        this.ret = ret;
    }
}
