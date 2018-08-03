package com.leimingtech.mobile.entity.appapi.tipoff;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by hejiping on 2017/5/23.
 */
@ApiModel
public class TipOffList {

    @ApiModelProperty("爆料")
    private List<TipOffEntity> tipOffList;

    public List<TipOffEntity> getTipOffList() {
        return tipOffList;
    }

    public void setTipOffList(List<TipOffEntity> tipOffList) {
        this.tipOffList = tipOffList;
    }
}
