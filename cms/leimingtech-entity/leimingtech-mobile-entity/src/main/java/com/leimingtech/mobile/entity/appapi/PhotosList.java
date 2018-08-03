package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by hejiping on 2017/5/22.
 */
@ApiModel
public class PhotosList {

    @ApiModelProperty(value="页码",required = true)
    private Integer pageNo;

    @ApiModelProperty(value="条数",required = true)
    private Integer pageSize;

    @ApiModelProperty(value="组图列表")
    private List<PhotosEntity> photoList ;

    public List<PhotosEntity> getPhotoList() {
        return photoList;
    }

    public void setPhotoList(List<PhotosEntity> photoList) {
        this.photoList = photoList;
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
