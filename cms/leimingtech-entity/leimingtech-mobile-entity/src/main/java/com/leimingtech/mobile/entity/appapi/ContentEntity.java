package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

/**
 * Created by hejiping on 2017/5/21.
 */
@ApiModel
public class ContentEntity {
    @ApiModelProperty(value="编号")
    private String id;
    @ApiModelProperty(value="标题")
    private String title;
    @ApiModelProperty(value="内容")
    private String conent;
    @ApiModelProperty(value="来源")
    private String fromType;
    @ApiModelProperty(value="新闻类型")
    private String newsType;
    @ApiModelProperty(value="展示类型")
    private String showType;//1：新闻  2：组图  3：视频
    @ApiModelProperty(value="预留图片1")
    private String imgUrl1;
    @ApiModelProperty(value="预留图片2")
    private String imgUrl2;
    @ApiModelProperty(value="预留图片3")
    private String imgUrl3;
    @ApiModelProperty(value="发布时间")
    private String createDate;
    @ApiModelProperty(value="频道编号",required = true)
    private String channelId;
    @ApiModelProperty(value="频道编号")
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId;
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

    public String getConent() {
        return conent;
    }

    public void setConent(String conent) {
        this.conent = conent;
    }

    public String getFromType() {
        return fromType;
    }

    public void setFromType(String fromType) {
        this.fromType = fromType;
    }

    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType;
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getImgUrl1() {
        return imgUrl1;
    }

    public void setImgUrl1(String imgUrl1) {
        this.imgUrl1 = imgUrl1;
    }

    public String getImgUrl2() {
        return imgUrl2;
    }

    public void setImgUrl2(String imgUrl2) {
        this.imgUrl2 = imgUrl2;
    }

    public String getImgUrl3() {
        return imgUrl3;
    }

    public void setImgUrl3(String imgUrl3) {
        this.imgUrl3 = imgUrl3;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
