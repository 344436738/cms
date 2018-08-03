package com.leimingtech.mobile.entity.appapi.comment;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by llj on 2017/5/21.
 */
@ApiModel
public class CommentEntityList {

    @ApiModelProperty(value="list",required = true)
    private List<CommentEntity> list;

    @ApiModelProperty(value="pageCount",required = true)
    private int pageCount; //页码总数
    @ApiModelProperty(value="pageSize",required = true)
    private int pageSize; //每页条数

    public List<CommentEntity> getList() {
        return list;
    }

    public void setList(List<CommentEntity> list) {
        this.list = list;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
