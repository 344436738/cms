package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by wangtao on 2017/5/22 0022.
 */

@ApiModel(value="我的收藏",description = "MyCollectionApiEntity")
@XmlRootElement(name = "root")
public class MyCollectionApiEntity extends BaseApiEntity {
    @ApiModelProperty(value="数据",required = true)
    private MyCollectionList ret;

    @Override
    public MyCollectionList getRet() {
        return ret;
    }

    public void setRet(MyCollectionList ret) {
        this.ret = ret;
    }
}
