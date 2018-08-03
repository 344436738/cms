package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

/**
 * Created by wangtao  on 2017/5/22 0022.
 */
@ApiModel
public class CollectionEntity {
    @ApiModelProperty(value="文章编号",required = true)
    private  String articleID; //文章编号
    @ApiModelProperty(value="收藏人",required = true)
    private  String collectors;//收藏人
    @ApiModelProperty(value="收藏时间",required = true)
    private  String collectionTime;//收藏时间
    @ApiModelProperty(value="收藏状态(1:收藏 0:取消收藏)")
    private  Integer collected ;//收藏状态 (1)

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getCollectors() {
        return collectors;
    }

    public void setCollectors(String collectors) {
        this.collectors = collectors;
    }

    public String getCollectionTime() {
        return collectionTime;
    }

    public void setCollectionTime(String collectionTime) {
        this.collectionTime = collectionTime;
    }

    public Integer getCollected() {
        return collected;
    }

    public void setCollected(Integer collected) {
        this.collected = collected;
    }
}
