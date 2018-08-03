package com.leimingtech.mobile.entity.appapi.comment;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

/**
 * Created by llj on 2017/5/21.
 * 评论实体
 */
@ApiModel
public class CommentEntity {

    @NotBlank(message="评论内容不能为空")
    @ApiModelProperty(value="评论内容",required = true)
    private String commentContent;//评论内容

    @NotBlank(message="内容id不能为空")
    @ApiModelProperty(value="内容id",required = true)
    private String contentId;//新闻编号
    @NotBlank(message="内容id不能为空")
    @ApiModelProperty(value="内容id",required = true)
    private String commentPerson;//评论人
    private Date commentTime;//评论时间
    private Integer supportCount;//点赞总数

    private Integer replyCount;//回复总数
    @ApiModelProperty(value="内容id",required = true)
    private Integer isHot;//是否是热门评论 1：是 0：否
    @ApiModelProperty(value="是否匿名评论",required = true)
    private  Integer anonymous;//是否匿名评论 1：是 0：否
    @ApiModelProperty(value="是否是游客",required = true)
    private Integer tourist;//是否游客评论 1：是 0：否

    public Integer getAnonymous() {
        return anonymous;
    }

    public void setAnonymous(Integer anonymous) {
        this.anonymous = anonymous;
    }

    public Integer getTourist() {
        return tourist;
    }

    public void setTourist(Integer tourist) {
        this.tourist = tourist;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getContentId() {
        return contentId;
    }

    public void setContentId(String contentId) {
        this.contentId = contentId;
    }

    public String getCommentPerson() {
        return commentPerson;
    }

    public void setCommentPerson(String commentPerson) {
        this.commentPerson = commentPerson;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getSupportCount() {
        return supportCount;
    }

    public void setSupportCount(Integer supportCount) {
        this.supportCount = supportCount;
    }

    public Integer getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(Integer replyCount) {
        this.replyCount = replyCount;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }
}
