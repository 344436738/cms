package com.leimingtech.mobile.entity.appapi.contentstatistics;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/23.
 */
@ApiModel(value="内容访问统计接口",description = "contentStatisticsApiEntity")
@XmlRootElement(name="root")
public class ContentStatisticsApiEntity extends BaseApiEntity {
    @ApiModelProperty(value="数据")
    private ContentStatisticsList ret;

    @Override
    public ContentStatisticsList getRet() {
        return ret;
    }

    public void setRet(ContentStatisticsList ret) {
        this.ret = ret;
    }
}
