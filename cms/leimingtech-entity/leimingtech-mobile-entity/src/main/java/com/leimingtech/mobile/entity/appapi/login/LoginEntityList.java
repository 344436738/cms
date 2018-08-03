package com.leimingtech.mobile.entity.appapi.login;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by wangtao on 2017/5/21 0021.
 */
@ApiModel
public class LoginEntityList {
    @ApiModelProperty(value="list",required = true)
    private List<LoginEntity> list;

    public List<LoginEntity> getList() {
        return list;
    }

    public void setList(List<LoginEntity> list) {
        this.list = list;
    }
}
