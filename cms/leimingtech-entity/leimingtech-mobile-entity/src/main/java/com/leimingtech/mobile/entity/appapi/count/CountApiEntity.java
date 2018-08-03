package com.leimingtech.mobile.entity.appapi.count;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by llj on 2017/5/22.
 */
@ApiModel(value = "总数",description = "countApiEntity")
@XmlRootElement(name="root")
public class CountApiEntity extends BaseApiEntity {

    @ApiModelProperty(value="数据")
    private CountList ret;

    @Override
    public CountList getRet() {
        return ret;
    }

    public void setRet(CountList ret) {
        this.ret = ret;
    }
}
