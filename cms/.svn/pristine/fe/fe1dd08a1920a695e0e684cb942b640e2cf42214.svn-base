package com.leimingtech.mobile.entity.appapi.reply;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

/**
 * Created by llj on 2017/5/21.
 * 评论实体
 */
@ApiModel
public class ReplyEntity {

    @NotBlank(message="回复内容不能为空")
    @ApiModelProperty(value="回复内容",required = true)
    private String replyContent;//回复内容
    private String replyPerson;//回复人
    private Date replyTime;//回复时间
    private Integer supportCount;//点赞数

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyPerson() {
        return replyPerson;
    }

    public void setReplyPerson(String replyPerson) {
        this.replyPerson = replyPerson;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public Integer getSupportCount() {
        return supportCount;
    }

    public void setSupportCount(Integer supportCount) {
        this.supportCount = supportCount;
    }
}
