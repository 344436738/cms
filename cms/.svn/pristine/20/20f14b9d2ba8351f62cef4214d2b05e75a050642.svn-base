package com.leimingtech.cms.controller.reply;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.CommentaryFrontEntity;
import com.leimingtech.cms.entity.reply.ReplyEntity;
import com.leimingtech.cms.entity.reply.ReplyVoBackEntity;
import com.leimingtech.cms.service.reply.ReplyFrontServiceI;
import com.leimingtech.common.Globals;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 跟帖后台管理
 * Created by Administrator on 2017/4/14.
 */
@Controller
@RequestMapping("/replyController")
public class ReplyController {

    private String message;
    /** 跟帖接口 */
    @Autowired
    private ReplyFrontServiceI replyFrontService;

    @Autowired
    private MemberServiceI memberMng;

    @Autowired
    private CommonService commonService;

    @Autowired
    private SystemService systemService;

    /**
     * 跟帖展现
     *
     * @return
     */
    /**
     * 评论列表页ftl
     *
     * @param request
     */
    @RequestMapping(params = "replyList")
    public ModelAndView commentaryList(ReplyEntity replyEntity, HttpServletRequest request,
                                       String createdTimeStart, String createdTimeEnd, String title, String content, String replyState) {
        // 获取评论列表
        int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
        int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));
        String replyTime=request.getParameter("replyTime");  //跟帖时间

        List<ReplyVoBackEntity> replyList = new ArrayList<ReplyVoBackEntity>();
        String siteId = UserUtils.getSiteId();

        String sql = "SELECT reply.id replyId, content.title contentTitle, content.url contentUrl,reply.returnContent returnContent, " +
                "reply.replyTime replyTime,reply.returnPerson returnPerson,reply.ischeck replyIsCheck " +
                "from cms_reply reply,cms_content content where reply.contentId=content.id and reply.siteid=?";

        String sqlForCount = "SELECT COUNT(reply.id) replyCount from cms_reply reply,cms_content content " +
                "where reply.contentId=content.id and reply.siteid=?";

        // 查询条件 组装器
        List<Object> conditions = new ArrayList();
        conditions.add(siteId);
        Map param = request.getParameterMap();
        //评论 内容
        if (StringUtils.isNotEmpty(content)){
            sql+=" AND reply.returnContent LIKE ?";
            sqlForCount+=" AND reply.returnContent LIKE ?";
            conditions.add("%"+content+"%");
        }
        //文章 标题
        if (StringUtils.isNotEmpty(title)){
            sql+=" AND content.title LIKE ?";
            sqlForCount+=" AND content.title LIKE ?";
            conditions.add("%"+title+"%");

        }
        // 工作流状态
        if (StringUtils.isNotEmpty(replyState)) {
            sql+=" AND reply.ischeck=?";
            sqlForCount+=" AND reply.ischeck=?";
            conditions.add(replyState);
        }

        // 创建时间
        if (StringUtils.isNotEmpty(createdTimeStart)){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sql+=" AND reply.replyTime >= ?";
            sqlForCount+=" AND reply.replyTime >= ?";
            try {
                Date string2date = sdf.parse(createdTimeStart + " 00:00:00");
                conditions.add(string2date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (StringUtils.isNotEmpty(createdTimeEnd)) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sql+=" AND reply.replyTime <= ?";
            sqlForCount+=" AND reply.replyTime <= ?";
            try {
                Date string2date = sdf.parse(createdTimeEnd + " 23:59:59");
                conditions.add(string2date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        sql += " ORDER BY reply.replyTime desc";
        replyList = commonService.findObjForJdbc(sql, pageNo,pageSize, ReplyVoBackEntity.class, conditions.toArray());

        Map<String, Object> oneForJdbc = commonService.findOneForJdbc(sqlForCount, conditions.toArray());
        int allCounts = ((Long)oneForJdbc.get("replyCount")).intValue();

        int pageCount = (int) Math.ceil((double) allCounts / (double) pageSize);
        if (pageCount <= 0) {
            pageCount = 1;
        }
        Map<String, Object> m = new HashMap<String, Object>();

        //用于 在 文章标题上加 链接
        SiteEntity site = UserUtils.getSite();

        m.put("domain", site.getDomain());
        m.put("pageCount",pageCount);
        m.put("pageSize", pageSize);
        m.put("pageNo",pageNo);
        m.put("searchMap", param);
        m.put("replyList", replyList);

        //设置搜索 条件的回显
        m.put("createdTimeStart", createdTimeStart);
        m.put("createdTimeEnd", createdTimeEnd);
        m.put("title", title);
        m.put("content", content);
        m.put("replyState",replyState);

        m.put("actionUrl", "replyController.do?replyList");
        return new ModelAndView("cms/reply/replylist", m);
    }

    /**
     * 跟帖审核
     * @return
     */
    @RequestMapping(params = "checkReply")
    @ResponseBody
    public String checkReply(HttpServletRequest request) {
        JSONObject j = new JSONObject();
        String id = request.getParameter("id");
        String pageNo = request.getParameter("pageNo");
        String ischeck = request.getParameter("ischeck");
        ReplyEntity reply = replyFrontService.getEntity(id);
        reply.setIscheck(ischeck);
        try {
            message = "操作成功";
            reply.setAuditorcreatetime(new Date());
            reply.setAuditorid(UserUtils.getUser().getId());
            reply.setAuditorname(UserUtils.getUser().getUserName());
            replyFrontService.saveOrUpdate(reply);
            systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
        } catch (Exception e) {
            e.printStackTrace();
            message = "操作失败";
        }

        j.accumulate("isSuccess", true);
        j.accumulate("msg", message);
        j.accumulate("toUrl", "replyController.do?replyList&pageNo="+pageNo);
        String str = j.toString();
        return str;
    }
    /**
     * 评论删除
     *
     * @return
     */
    @RequestMapping(params = "del")
    @ResponseBody
    public String del(HttpServletRequest request) {
        JSONObject j = new JSONObject();
        String commentId = null;

        try {
            String id = request.getParameter("id");
            //删除 跟帖
            commentId = commonService.get(ReplyEntity.class, id).getCommentId();
            CommentaryFrontEntity commentaryFrontEntity = commonService.get(CommentaryFrontEntity.class, commentId);
            commentaryFrontEntity.setReplycount(commentaryFrontEntity.getReplycount()-1);
            commonService.deleteEntityById(ReplyEntity.class,id);
            message = "跟帖删除成功";
            systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
            j.accumulate("isSuccess", true);
            //删除 评论中的 跟帖
            List<ReplyEntity> replyEntityList = commonService.findByProperty(ReplyEntity.class, "replyId", id);
            if (replyEntityList != null && replyEntityList.size() > 0) {
                commonService.deleteAllEntitie(replyEntityList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            message="跟帖删除失败";
            j.accumulate("isSuccess", false);
            systemService.addLog(message+"，原因："+e.getMessage(), Globals.Log_Type_DEL, Globals.Log_Leavel_ERROR);
        }
        j.accumulate("toUrl", "replyController.do?replyList&commentId="+commentId);
        j.accumulate("msg", message);
        String str = j.toString();
        return str;
    }
}
