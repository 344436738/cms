package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by hejiping on 2017/5/21.
 */
@ApiModel
public class ChannelList {

    @ApiModelProperty(value="channelList")
    private List<ChannelEntity> channelList;

    public List<ChannelEntity> getChannelList() {
        return channelList;
    }

    public void setChannelList(List<ChannelEntity> channelList) {
        this.channelList = channelList;
    }
}
