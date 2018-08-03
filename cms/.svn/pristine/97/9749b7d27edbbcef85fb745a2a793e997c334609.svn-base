package com.leimingtech.mobile.entity.appapi.login;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by wangtao on 2017/5/21 0021.
 */

@ApiModel(value="登录",description = "thirdLoginApiEntity")
@XmlRootElement(name = "root")
public class ThirdLoginApiEntity extends BaseApiEntity {
    @ApiModelProperty(value="数据",required = true)
    private ThirdLoginEntityList ret;

    @Override
    public ThirdLoginEntityList getRet() {
        return ret;
    }

    public void setRet(ThirdLoginEntityList ret) {
        this.ret = ret;
    }
}
