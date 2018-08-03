package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/19.
 */
@ApiModel(value="启动图实体",description = "boodiagramApiEntity")
@XmlRootElement(name = "root")
public class BoodiagramApiEntity extends BaseApiEntity {

    @ApiModelProperty(value="数据",required = true)
    private BoodiagramList ret;


    @Override
    public BoodiagramList getRet() {
        return ret;
    }

    public void setRet(BoodiagramList ret) {
        this.ret = ret;
    }
}
