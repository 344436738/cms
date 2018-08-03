package com.leimingtech.mobile.entity.appapi.comment;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by llj on 2017/5/21.
 */
@ApiModel(value="评论实体",description = "commentApiEntity")
@XmlRootElement(name = "root")
public class CommentApiEntity extends BaseApiEntity {

    @ApiModelProperty(value = "数据", required = true)
    private CommentEntityList ret;

    @Override
    public CommentEntityList getRet() {
        return ret;
    }

    public void setRet(CommentEntityList ret) {
        this.ret = ret;
    }

}
