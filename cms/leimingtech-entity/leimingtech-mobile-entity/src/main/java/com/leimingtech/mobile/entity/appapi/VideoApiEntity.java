package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/22.
 */
@ApiModel(value="视频列表",description = "VideoApiEntity")
@XmlRootElement(name="root")
public class VideoApiEntity extends BaseApiEntity {

    @ApiModelProperty(value="视频列表")
    private VideoList ret;

    @Override
    public VideoList getRet() {
        return ret;
    }

    public void setRet(VideoList ret) {
        this.ret = ret;
    }
}
