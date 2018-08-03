package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by hejiping on 2017/5/22.
 */
@ApiModel
public class ValidCodeList {

    @ApiModelProperty(value = "验证码列表")
    private List<ValidCodeEntity> validCodeList;

    public List<ValidCodeEntity> getValidCodeList() {
        return validCodeList;
    }

    public void setValidCodeList(List<ValidCodeEntity> validCodeList) {
        this.validCodeList = validCodeList;
    }
}
