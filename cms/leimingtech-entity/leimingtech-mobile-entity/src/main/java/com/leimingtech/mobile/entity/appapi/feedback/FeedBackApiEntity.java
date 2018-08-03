package com.leimingtech.mobile.entity.appapi.feedback;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/23.
 */
@ApiModel(value="反馈实体" , description = "feedBackApiEntity")
@XmlRootElement(name="root")
public class FeedBackApiEntity extends BaseApiEntity {
    @ApiModelProperty(value="数据")
    private FeedBackList ret;

    @Override
    public FeedBackList getRet() {
        return ret;
    }

    public void setRet(FeedBackList ret) {
        this.ret = ret;
    }
}
