package com.leimingtech.cms.controller;

import org.springframework.stereotype.Controller;

import com.leimingtech.base.entity.temp.*;
import com.leimingtech.core.service.ContentsServiceI;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/9.
 */
@Controller
@RequestMapping("/front/contentsFrontController")
public class ContentsFrontController {


    @Autowired
    private ContentsServiceI contentsService;

    /**
     * 增加赞数
     *
     * @param contentId
     */

    @ResponseBody
    @RequestMapping(params = "addSupport")
    public Integer addSupport(String  contentId) {

        return contentsService.addSupport(contentId);
    }

    /**
     * 增加反对数
     *
     * @param contentId
     */
    @ResponseBody
    @RequestMapping(params = "addOppose")
    public Integer addOppose(String  contentId) {

        return contentsService.addOppose(contentId);
    }
    /**
     * 获取赞同数
     *
     * @param contentId
     */
    @ResponseBody
    @RequestMapping(params = "getSupport")
    public String getSupport(String  contentId) {
        JSONObject j =new  JSONObject();
        ContentsEntity content=contentsService.get(ContentsEntity.class,contentId);
        Integer support = content.getSupport();
        Integer oppose = content.getOppose();
        j.accumulate("support",support);
        j.accumulate("oppose",oppose);
        return  j.toString();

    }
    /**
     * 获取反对数
     *
     * @param contentId
     */
    @ResponseBody
    @RequestMapping(params = "getOppose")
    public Integer getOppose(String  contentId) {

        return contentsService.getOppose(contentId);
    }

    /**
     * 增加浏览量
     *
     * @param contentId
     */
    @RequestMapping(params = "addPv")
    @ResponseBody
    public void addPv(String  contentId) {
        contentsService.addPv(contentId);
    }

    /**
     * 查询 评论数量
     *
     * @param contentId
     */
    @RequestMapping(params = "calculationCommentCount")
    @ResponseBody
    public String calculationCommentCount(String  contentId) {
        JSONObject j = new JSONObject();
        long commentCount = contentsService.calculationCommentCount(contentId);
        j.accumulate("commentCount", commentCount);
        String msg = j.toString();
        return msg;
    }
}
