package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

/**
 * Created by hejiping on 2017/5/22.
 */
@ApiModel
public class PhotosEntity {
    @ApiModelProperty(value="编号")
    private String id;
    @ApiModelProperty(value="标题")
    private String title;
    @ApiModelProperty(value="来源")
    private String fromType;
    @ApiModelProperty(value="预留图片1")
    private String imgUrl1;
    @ApiModelProperty(value="发布时间")
    private String createDate;
    @ApiModelProperty(value="新闻类型")
    private String newsType;//2：组图
    @ApiModelProperty(value="图片描述")
    private String imgDesc;

    public String getImgDesc() {
        return imgDesc;
    }

    public void setImgDesc(String imgDesc) {
        this.imgDesc = imgDesc;
    }

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

    public String getImgUrl1() {
        return imgUrl1;
    }

    public void setImgUrl1(String imgUrl1) {
        this.imgUrl1 = imgUrl1;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
