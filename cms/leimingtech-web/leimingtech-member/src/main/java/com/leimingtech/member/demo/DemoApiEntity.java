package com.leimingtech.member.demo;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by liuzhen on 2017/4/25.
 */
@ApiModel
@XmlRootElement(name = "root")
public class DemoApiEntity extends BaseApiEntity {

    @ApiModelProperty(value = "数据", required = true)
    private DemoEntity ret;

    @Override
    public DemoEntity getRet() {
        return ret;
    }

    public void setRet(DemoEntity ret) {
        this.ret = ret;
    }
}
