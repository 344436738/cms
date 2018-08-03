package com.leimingtech.mobile.entity.appapi.contentstatistics;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by hejiping on 2017/5/23.
 */
@ApiModel
public class ContentStatisticsList {
    @ApiModelProperty(value="内容访问统计接口")
    private List<ContentStatisticsEntity> contentStatisticsList;

    public List<ContentStatisticsEntity> getContentStatisticsList() {
        return contentStatisticsList;
    }

    public void setContentStatisticsList(List<ContentStatisticsEntity> contentStatisticsList) {
        this.contentStatisticsList = contentStatisticsList;
    }
}
