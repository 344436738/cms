package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by Administrator on 2017/5/22 0022.
 */
@ApiModel(value="收藏实体",description = "collectionApiEntity")
@XmlRootElement(name = "root")
public class CollectionApiEntity extends BaseApiEntity {
    @ApiModelProperty(value = "数据",required = true)
     private  CollectionList ret;

    @Override
    public CollectionList getRet() {
        return ret;
    }

    public void setRet(CollectionList ret) {
        this.ret = ret;
    }

}
