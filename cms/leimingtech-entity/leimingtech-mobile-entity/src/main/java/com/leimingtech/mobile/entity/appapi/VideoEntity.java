package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

/**
 * Created by hejiping on 2017/5/22.
 */
@ApiModel
public class VideoEntity {
    @ApiModelProperty(value="编号")
    private String id;
    @ApiModelProperty(value="标题")
    private String title;
    @ApiModelProperty(value="来源")
    private String fromType;
    @ApiModelProperty(value="播放时长")
    private String playDuration;
    @ApiModelProperty(value="播放次数")
    private String palyNum;
    @ApiModelProperty(value="发布时间")
    private String createDate;
    @ApiModelProperty(value="视频路径")
    private String videoUrl;
    @ApiModelProperty(value="新闻类型")
    private String newsType;//3：视频


    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFromType() {
        return fromType;
    }

    public void setFromType(String fromType) {
        this.fromType = fromType;
    }

    public String getPlayDuration() {
        return playDuration;
    }

    public void setPlayDuration(String playDuration) {
        this.playDuration = playDuration;
    }

    public String getPalyNum() {
        return palyNum;
    }

    public void setPalyNum(String palyNum) {
        this.palyNum = palyNum;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}
