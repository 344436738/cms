package com.leimingtech.mobile.entity.appapi.count;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

/**
 * Created by llj on 2017/5/22.
 */
@ApiModel
public class CountEntity {

    @ApiModelProperty(value = "总数")
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
