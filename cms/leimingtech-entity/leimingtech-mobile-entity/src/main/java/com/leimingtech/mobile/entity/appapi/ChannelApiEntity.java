package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/21.
 */
@ApiModel(value="频道列表",description = "channelApiEntity")
@XmlRootElement(name="root")
public class ChannelApiEntity extends BaseApiEntity {

    @ApiModelProperty("频道列表")
    private ChannelList ret;

    @Override
    public ChannelList getRet() {
        return ret;
    }

    public void setRet(ChannelList ret) {
        this.ret = ret;
    }
}
