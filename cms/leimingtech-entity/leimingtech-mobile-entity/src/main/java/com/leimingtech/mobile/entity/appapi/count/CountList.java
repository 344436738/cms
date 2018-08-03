package com.leimingtech.mobile.entity.appapi.count;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by llj on 2017/5/22.
 */
@ApiModel
public class CountList {

    @ApiModelProperty(value = "验证码列表")
    private List<CountEntity> countList;

    public List<CountEntity> getCountList() {
        return countList;
    }

    public void setCountList(List<CountEntity> countList) {
        this.countList = countList;
    }
}
