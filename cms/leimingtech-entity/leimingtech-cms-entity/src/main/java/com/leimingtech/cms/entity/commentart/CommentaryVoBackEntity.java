package com.leimingtech.cms.entity.commentart;

/**
 * Created by Administrator on 2017/4/18.
 */
public class CommentaryVoBackEntity {

    private String contentTitle;//文章 标题
    private String contentUrl;//文章 url
    private String commentaryContent;//评论 内容
    private String commentaryCreatedtime;//评论 时间
    private String userName;//评论 人
    private String commentaryIsCheck;//评论 审核状态
    private String commentaryId;//评论ID

    public String getCommentaryId() {
        return commentaryId;
    }

    public void setCommentaryId(String commentaryId) {
        this.commentaryId = commentaryId;
    }

    public String getContentTitle() {
        return contentTitle;
    }

    public void setContentTitle(String contentTitle) {
        this.contentTitle = contentTitle;
    }

    public String getContentUrl() {
        return contentUrl;
    }

    public void setContentUrl(String contentUrl) {
        this.contentUrl = contentUrl;
    }

    public String getCommentaryContent() {
        return commentaryContent;
    }

    public void setCommentaryContent(String commentaryContent) {
        this.commentaryContent = commentaryContent;
    }

    public String getCommentaryCreatedtime() {
        return commentaryCreatedtime;
    }

    public void setCommentaryCreatedtime(String commentaryCreatedtime) {
        this.commentaryCreatedtime = commentaryCreatedtime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCommentaryIsCheck() {
        return commentaryIsCheck;
    }

    public void setCommentaryIsCheck(String commentaryIsCheck) {
        this.commentaryIsCheck = commentaryIsCheck;
    }
}
