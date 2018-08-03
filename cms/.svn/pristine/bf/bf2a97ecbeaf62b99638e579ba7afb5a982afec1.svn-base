package com.leimingtech.mobile.entity.appapi.tipoff;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/23.
 */
@ApiModel(value = "爆料",description = "tipOffApiEntity")
@XmlRootElement(name="root")
public class TipOffApiEntity extends BaseApiEntity {
    @ApiModelProperty(value="爆料列表")
    private TipOffList ret;

    @Override
    public TipOffList getRet() {
        return ret;
    }

    public void setRet(TipOffList ret) {
        this.ret = ret;
    }
}
