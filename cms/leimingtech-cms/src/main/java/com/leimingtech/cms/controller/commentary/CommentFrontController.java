package com.leimingtech.cms.controller.commentary;

import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.CommentaryFrontEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.entity.commentart.CommentartVoEntity;
import com.leimingtech.cms.entity.reply.ReplyEntity;
import com.leimingtech.common.Globals;
import com.leimingtech.core.service.CommentaryFrontServiceI;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.ContentsServiceI;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.util.MemberUtils;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.ResourceUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import net.sf.json.JSONObject;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2017/3/28.
 */

@Controller
@RequestMapping("/front/commentFrontController")
public class CommentFrontController {

    @Autowired
    private CommentaryFrontServiceI commentaryFrontService;

    @Autowired
    private ContentsServiceI contentsServiceI;

    @Autowired
    private MemberServiceI memberMng;

    @Autowired
    private CommonService commonService;
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 评论保存
     *
     * @return
     */
    @RequestMapping(params = "save")
    @ResponseBody
    public String saveOrUpdate(CommentaryFrontEntity commentaryFront, HttpServletRequest request) {
        JSONObject j = new JSONObject();
        String con = request.getParameter("content");
        String contentid = request.getParameter("contentid");
        if (memberMng.getSessionMember() == null || memberMng.getSessionMember().getId()==null) {
            message ="登陆后才可以评论";
        } else if(con == ""){
            message="评论不能为空";
        }else {
            message = "评论成功";
            MemberEntity member = memberMng.getSessionMember();
            commentaryFront.setUsername(member.getUsername());
            commentaryFront.setSiteId(UserUtils.getSiteId());
            commentaryFront.setContent(con);
            commentaryFront.setPersonid(member.getId());  //评论人ID
            commentaryFront.setContentid(contentid);
            commentaryFront.setIscheck("0");  //0代表未审核
            commentaryFront.setCreatedtime(new Date());
            commentaryFrontService.save(commentaryFront);
        }
        Criteria criteria = commonService.getSession().createCriteria(CommentaryFrontEntity.class);
        criteria.add(Restrictions.eq("contentid", contentid));
        criteria.add(Restrictions.ne("ischeck", "2"));
        int commentCount = ((Long) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
            j.accumulate("commentCount",commentCount+"条评论");
            j.accumulate("isSuccess", true);
            j.accumulate("msg", message);
            String str = j.toString();
            return str;
    }

    /**
     * 评论列表展现
     *
     * @return
     */
    @RequestMapping(params = "commentaryList")
    public ModelAndView commentaryList(HttpServletRequest request) {
        String contentid = request.getParameter("contentid");
        ContentsEntity contentsEntity = contentsServiceI.getContensById(contentid);
        SiteEntity site = commonService.get(SiteEntity.class, contentsEntity.getSiteid());
        String sitePath = site.getSitePath();


        String catName = contentsEntity.getCatName();

        Map<String, Object> m = new HashMap<String, Object>();
        m.put("catName",catName);
        m.put("sitePath",sitePath);
        m.put("domain", site.getProtocol()+site.getDomain());
        m.put("site",site);
        m.put("content",contentsEntity);
        m.put("frontpath", ResourceUtil.getCMSFrontPath());
        return new ModelAndView("member/comment/comment", m);
    }

    /**
     * 评论列表分页展现
     *
     * @return
     */
    @RequestMapping(params = "commentPageList")
    public  ModelAndView commentPageList(HttpServletRequest request){
        String contentid = request.getParameter("contentid");
        String commentTime=request.getParameter("commentTime");  //评论时间

        Map<String, Object> m = new HashMap<String, Object>();

        //如果登录 获取 登录用户的id
        MemberEntity member = memberMng.getSessionMember();
        if (member !=null){
            String memberId = member.getId();
            m.put("memberId",memberId);
        }
        int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));
        List<Map<String,Object>> commentaryList=new ArrayList<Map<String,Object>>();
        if(StringUtils.isNotEmpty(commentTime)){
            commentaryList=commonService.findForJdbcParam("SELECT c.id \"commentId\",m.id memberid,c.content content,c.createdtime \"commentTime\",m.USERNAME \"memberName\",c.SUPPORT_COUNT supportcount,c.OPPOSE_COUNT opposecount,c.reply_count replycount," +
                            "m.FACEIMG \"memberPic\" from cms_commentary c,cms_member m where c.person_id=m.id and c.content_id=?  and c.createdtime<? and c.is_check!='2'   ORDER BY c.createdtime desc ",
                    1,10,contentid,commentTime);
        }else{
            commentaryList=commonService.findForJdbcParam("SELECT c.id \"commentId\",m.id memberid,c.content content,c.createdtime \"commentTime\",m.USERNAME \"memberName\",c.SUPPORT_COUNT supportcount,c.OPPOSE_COUNT opposecount,c.reply_count replycount," +
                            "m.FACEIMG \"memberPic\" from cms_commentary c,cms_member m where c.person_id=m.id and c.content_id=? and c.is_check!='2'  ORDER BY c.createdtime desc ",
                    1,10,contentid);
        }
        SiteEntity site = MemberUtils.getSite();
        m.put("domain", site.getProtocol()+site.getDomain());
        m.put("frontpath", ResourceUtil.getCMSFrontPath());
        m.put("commentaryList",commentaryList);
        m.put("commentCount",commentaryList.size());
        m.put("pageNo",pageNo);
        return new ModelAndView("member/comment/commentPageList", m);
    }

    /**
     * 增加赞数
     * @param commentId
     */
    @ResponseBody
    @RequestMapping(params = "addSupport")
    public Integer addSupport(String commentId) {
        return commentaryFrontService.addSupport(commentId);
    }

    /**
     * 增加反对数
     * @param commentId
     */
    @ResponseBody
    @RequestMapping(params = "addOppose")
    public Integer addOppose(String  commentId) {
        return commentaryFrontService.addOppose(commentId);
    }

    /**删除 评论*/
    @RequestMapping(params = "del")
    @ResponseBody
    public String del(HttpServletRequest request) {
        JSONObject j = new JSONObject();

        try {
            String commentId = request.getParameter("commentId");
            CommentaryFrontEntity commentaryFrontEntity = commonService.get(CommentaryFrontEntity.class, commentId);
            String contentId = commentaryFrontEntity.getContentid();
            j.accumulate("contentId",contentId);
            //删除 评论
            commonService.deleteEntityById(CommentaryFrontEntity.class,commentId);
            message = "评论删除成功";
            j.accumulate("isSuccess", true);
            //删除 评论中的 跟帖
            List<ReplyEntity> replyEntityList = commonService.findByProperty(ReplyEntity.class, "commentId", commentId);
            if (replyEntityList != null && replyEntityList.size() > 0) {
                commonService.deleteAllEntitie(replyEntityList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            message="评论删除失败";
            j.accumulate("isSuccess", false);
        }
        j.accumulate("toUrl", "commentaryController.do?commentaryList");
        j.accumulate("msg", message);
        String str = j.toString();
        return str;
    }

}