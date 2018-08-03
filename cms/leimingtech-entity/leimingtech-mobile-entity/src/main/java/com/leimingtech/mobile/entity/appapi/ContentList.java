package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by hejiping on 2017/5/21.
 */
public class ContentList {


    @ApiModelProperty(value="pageNo",required = true)
    private Integer pageNo;

    @ApiModelProperty(value="pageSize",required = true)
    private Integer pageSize;

    @ApiModelProperty(value="内容列表")
    private List<ContentEntity> contentxList;

    @ApiModelProperty(value="轮播图")
    private List<CarouselFigureEntity> carouselList;

    public List<CarouselFigureEntity> getCarouselList() {
        return carouselList;
    }

    public void setCarouselList(List<CarouselFigureEntity> carouselList) {
        this.carouselList = carouselList;
    }

    public List<ContentEntity> getContentxList() {
        return contentxList;
    }

    public void setContentxList(List<ContentEntity> contentxList) {
        this.contentxList = contentxList;
    }


    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
