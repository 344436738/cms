package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by wangtao on 2017/5/22 0022.
 */

@ApiModel
public class MyCollectionList {
    @ApiModelProperty(value="list",required = true)
    private List<MyCollectionEntity> list;

    public List<MyCollectionEntity> getList() {
        return list;
    }

    public void setList(List<MyCollectionEntity> list) {
        this.list = list;
    }
}
