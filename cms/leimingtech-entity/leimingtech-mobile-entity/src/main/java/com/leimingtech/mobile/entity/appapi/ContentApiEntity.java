package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/21.
 */
@ApiModel(value="内容列表",description = "contentApiEntity")
@XmlRootElement(name="root")
public class ContentApiEntity extends BaseApiEntity {

    @ApiModelProperty(value="内容列表")
    private ContentList ret;

    @Override
    public ContentList getRet() {
        return ret;
    }

    public void setRet(ContentList ret) {
        this.ret = ret;
    }
}
