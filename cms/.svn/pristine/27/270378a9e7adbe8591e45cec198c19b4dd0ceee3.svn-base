package com.leimingtech.cms.controller.commentary;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.CommentaryFrontEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.entity.commentart.CommentaryVoBackEntity;
import com.leimingtech.cms.entity.reply.ReplyEntity;
import com.leimingtech.cms.service.comments.CommentsServiceI;
import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.core.service.CommentaryFrontServiceI;
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
 * 评论后台管理
 * @author lkang
 * 2014-08-08 16:00
 */
@Controller
@RequestMapping("/commentaryController")
public class CommentaryController extends BaseController {
	@Autowired
	private CommentaryFrontServiceI commentaryFrontService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private CommentsServiceI commentsServiceI;

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 评论列表页ftl
	 *
	 * @param request
	 */
	@RequestMapping(params = "commentaryList")
	public ModelAndView commentaryList(CommentaryFrontEntity commentaryFront, HttpServletRequest request,
									   String createdTimeStart, String createdTimeEnd, String title, String content,
									   String commentaryState) {

		// 获取评论列表
		int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? 10 : Integer.valueOf(request.getParameter("pageSize"));
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));
		String commentTime=request.getParameter("commentTime");  //评论时间

		List<CommentaryVoBackEntity> commentaryList = new ArrayList<CommentaryVoBackEntity>();
		String siteId = UserUtils.getSiteId();

		String sql = "SELECT commentary.id 'commentaryId',content.title 'contentTitle', content.url 'contentUrl',commentary.content 'commentaryContent', " +
				"commentary.createdtime 'commentaryCreatedtime',commentary.commentary_person 'userName',commentary.is_check 'commentaryIsCheck' " +
				"from cms_commentary commentary,cms_content content where commentary.content_id=content.id  and commentary.site_id=?";

		String sqlForCount = "SELECT COUNT(commentary.id) commentCount from cms_commentary commentary,cms_content content " +
				"where commentary.content_id=content.id and commentary.site_id=? ";

		// 查询条件 组装器
		List<Object> conditions = new ArrayList();
		conditions.add(siteId);
		;		Map param = request.getParameterMap();
		//评论 内容
		if (StringUtils.isNotEmpty(content)){
			sql+=" AND commentary.content LIKE ?";
			sqlForCount+=" AND commentary.content LIKE ?";
			conditions.add("%"+content+"%");
		}
		//文章 标题
		if (StringUtils.isNotEmpty(title)){
			sql+=" AND content.title LIKE ?";
			sqlForCount+=" AND content.title LIKE ?";
			conditions.add("%"+title+"%");
		}


		// 创建时间
		if (StringUtils.isNotEmpty(createdTimeStart)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sql+=" AND commentary.createdtime >= ?";
			sqlForCount+=" AND commentary.createdtime >= ?";
			try {
				Date string2date = sdf.parse(createdTimeStart + " 00:00:00");
				conditions.add(string2date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (StringUtils.isNotEmpty(createdTimeEnd)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sql+=" AND commentary.createdtime <= ?";
			sqlForCount+=" AND commentary.createdtime <= ?";
			try {
				Date string2date = sdf.parse(createdTimeEnd + " 23:59:59");
				conditions.add(string2date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// 工作流状态
		if (StringUtils.isNotEmpty(commentaryState)) {
			sql+=" AND commentary.ischeck=?";
			sqlForCount+=" AND commentary.is_check=?";
			conditions.add(commentaryState);
		}

		sql += " ORDER BY commentary.createdtime desc";
		commentaryList = commentsServiceI.findObjForJdbc(sql, pageNo,pageSize, CommentaryVoBackEntity.class, conditions.toArray());

		Map<String, Object> oneForJdbc = commentsServiceI.findOneForJdbc(sqlForCount, conditions.toArray());
		int allCounts = ((Long)oneForJdbc.get("commentCount")).intValue();

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
		m.put("commentaryList", commentaryList);

		//设置搜索 条件的回显
		m.put("createdTimeStart", createdTimeStart);
		m.put("createdTimeEnd", createdTimeEnd);
		m.put("title", title);
		m.put("content", content);
		m.put("commentaryState",commentaryState);

		m.put("actionUrl", "commentaryController.do?commentaryList");
		return new ModelAndView("cms/commentary/commentarylist", m);
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

		try {
			String id = request.getParameter("id");
			CommentaryFrontEntity commentaryFrontEntity = commentsServiceI.get(CommentaryFrontEntity.class, id);
			String contentid = commentaryFrontEntity.getContentid();
			ContentsEntity contentsEntity = commentsServiceI.get(ContentsEntity.class, contentid);
			//删除 评论
			commentsServiceI.deleteEntityById(CommentaryFrontEntity.class,id);
			message = "评论删除成功";
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
			j.accumulate("isSuccess", true);
			//删除 评论中的 跟帖
			List<ReplyEntity> replyEntityList = commentsServiceI.findByProperty(ReplyEntity.class, "commentId", id);
			if (replyEntityList != null && replyEntityList.size() > 0) {
				commentsServiceI.deleteAllEntitie(replyEntityList);
			}
		} catch (Exception e) {
			e.printStackTrace();
			message="评论删除失败";
			j.accumulate("isSuccess", false);
			systemService.addLog(message+"，原因："+e.getMessage(), Globals.Log_Type_DEL, Globals.Log_Leavel_ERROR);
		}
		j.accumulate("toUrl", "commentaryController.do?commentaryList");
		j.accumulate("msg", message);
		String str = j.toString();
		return str;
	}

	/**
	 * 评论审核
	 * @return
	 */
	@RequestMapping(params = "checkcommentary")
	@ResponseBody
	public String checkCommentary(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));

		String ischeck = request.getParameter("ischeck");
		CommentaryFrontEntity commentary = commentaryFrontService.get(CommentaryFrontEntity.class, String.valueOf(id));
		commentary.setIscheck(ischeck);
		try {
			message = "操作成功";
			commentary.setAuditorCreateTime(new Date());
			commentary.setAuditorId(UserUtils.getUserId());
			commentary.setAuditorName(UserUtils.getUser().getUserName());
			commentaryFrontService.saveOrUpdate(commentary);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		} catch (Exception e) {
			e.printStackTrace();
			message = "操作失败";
		}

		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "commentaryController.do?commentaryList&pageNo="+pageNo);
		String str = j.toString();
		return str;
	}
}