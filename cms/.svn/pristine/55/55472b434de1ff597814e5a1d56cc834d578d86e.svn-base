package com.leimingtech.mobile.entity.appapi.reply;

import com.leimingtech.mobile.entity.appapi.BaseApiEntity;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by llj on 2017/5/21.
 */
@ApiModel(value="回复实体",description = "replyApiEntity")
@XmlRootElement(name = "root")
public class ReplyApiEntity extends BaseApiEntity {

    @ApiModelProperty(value = "数据", required = true)
    private ReplyEntityList ret;

    @Override
    public ReplyEntityList getRet() {
        return ret;
    }

    public void setRet(ReplyEntityList ret) {
        this.ret = ret;
    }

}
