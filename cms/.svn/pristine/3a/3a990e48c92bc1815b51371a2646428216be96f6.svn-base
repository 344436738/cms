package com.leimingtech.core.service.impl;

import com.leimingtech.base.entity.temp.CommentaryFrontEntity;
import com.leimingtech.core.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.core.service.CommentaryFrontServiceI;

import java.util.List;

@Service("commentaryFrontService")
@Transactional
public class CommentaryFrontServiceImpl extends CommonServiceImpl implements CommentaryFrontServiceI {

    @Autowired
    private CommonService commonService;

    @Override
    public List showCommentaryList(String contentId) {

        String sql = "select content,commentaryPerson,commentaryTime,supportcount,opposecount from cms_commentary  where contentId = '"
                + contentId + "'";
        executeSql(sql);



        return null;
    }

    /**
     * 增加赞同数
     *
     * @param commentId
     */
    @Override
    public Integer addSupport(String commentId) {
        String sql = "update cms_commentary set support_count = support_count+1 where id = '"
                + commentId + "'";
        executeSql(sql);
        CommentaryFrontEntity commentary=commonService.get(CommentaryFrontEntity.class,commentId);
        return commentary.getSupportcount();
    }

    /**
     * 增加反对数
     *
     * @param commentId
     */
    @Override
    public Integer addOppose(String commentId) {
        String sql = "update cms_commentary set oppose_count = oppose_count+1 where id = '"
                + commentId + "'";
        executeSql(sql);
        CommentaryFrontEntity commentary=commonService.get(CommentaryFrontEntity.class,commentId);
        return commentary.getOpposecount();
    }
}