package com.leimingtech.member.controller.member;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.cms.service.guestbook.GuestBookServiceI;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.util.MemberUtils;
import com.leimingtech.member.entity.message.MessagesEntity;
import com.leimingtech.member.service.impl.member.GuestBookFrontServiceImpl;
import com.leimingtech.member.service.member.GuestBookFrontServiceI;
import net.sf.json.JSONObject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import  com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.MessagesServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.MyBeanUtils;

import com.leimingtech.core.util.StringUtils;
import com.leimingtech.common.utils.date.DataUtils;

/**
 * @Title: Controller
 * @Description: 留言
 * @author zhangdaihao modify by linjm 20140402
 * @date 2014-04-30 10:32:39
 * @version V1.0
 * 
 */
@Controller
@RequestMapping("member/guestBookFrontController")
public class GuestBookFrontController extends BaseController {

//	@Autowired
//	private GuestBookFrontServiceI guestBookFrontService;
	@Autowired
	private SystemService systemService;

	@Autowired
	private MemberServiceI memberMng;
	
	@Autowired
	private MessagesServiceI messagesService;

	@Autowired
	private GuestBookServiceI guestBookServiceI;
	@Autowired
	private SiteServiceI siteServiceI;

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 留言添加
	 * 
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(HttpServletRequest reqeust) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("page", new MessagesEntity());
		
		return new ModelAndView("guestbookadd", m);
	}

	/**
	 * 留言更新
	 * 
	 * @return
	 */
	@RequestMapping("modify")
	public ModelAndView modify(HttpServletRequest reqeust) {
		String id = reqeust.getParameter("id");
		MessagesEntity guestBookFront = messagesService.getEntity(MessagesEntity.class, String.valueOf(id));
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("page", guestBookFront);
		return new ModelAndView("member/guestbookmodify", m);
	}

	/**
	 * 留言保存
	 * 
	 * @return
	 */
	@RequestMapping("save")
	@ResponseBody
	public String saveOrUpdate(MessagesEntity guestBookFront, HttpServletRequest request) {
		MemberEntity member = memberMng.getSessionMember();
		JSONObject j = new JSONObject();
		if (StringUtils.isNotEmpty(guestBookFront.getId())) {
			message = "留言["+guestBookFront.getContent()+"]更新成功";
			MessagesEntity t = messagesService.get(MessagesEntity.class, guestBookFront.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(guestBookFront, t);
				messagesService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				message = "留言["+guestBookFront.getContent()+"]更新失败";
			}
		} else {
			message = "留言["+guestBookFront.getContent()+"]添加成功";
			guestBookFront.setCreatedtime(new Date());//创建时间
			guestBookFront.setName(member.getName());
			messagesService.save(guestBookFront);
			//systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		Map<String, Object> m = new HashMap<String, Object>();
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "guestBook");
		String str = j.toString();
		return str;
	}
	/**
	 * 主页留言保存
	 * 
	 * @return
	 */
	@RequestMapping("messagesave")
	@ResponseBody
	public String save(MessagesEntity guestBookFront, HttpServletRequest request) {
		MemberEntity member = memberMng.getSessionMember();
		JSONObject j = new JSONObject();
		if (StringUtils.isNotEmpty(guestBookFront.getContent())) {
			message = "留言["+guestBookFront.getContent()+"]添加成功";
			guestBookFront.setCreatedtime(new Date());//创建时间
			guestBookFront.setName(member.getName());
			messagesService.save(guestBookFront);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}else{
			message = "留言----[不能为空]----添加失败";
		}
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "guestBookFrontController.do?newsGuestBook");
		String str = j.toString();
		return str;
	}

	/**
	 * 留言删除
	 * 
	 * @return
	 */
	@RequestMapping("del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();

		try {
			String id = request.getParameter("id");
			CriteriaQuery cq = new CriteriaQuery(MessagesEntity.class);
			cq.eq("memberid", memberMng.getSessionMember().getId());
			cq.eq("id", String.valueOf(id));
			cq.add();
			List<MessagesEntity> guestBookList = messagesService.getListByCriteriaQuery(cq, false);
			if (guestBookList != null && guestBookList.size() > 0) {
				messagesService.deleteAllEntitie(guestBookList);
				message = "留言"+guestBookList.get(0).getTitle()+"删除成功";
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
				j.accumulate("isSuccess", true);
			}else{
				message="留言删除失败";
				systemService.addLog(message, Globals.Log_Leavel_ERROR, Globals.Log_Type_DEL);
				j.accumulate("isSuccess", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			message="留言删除失败";
			j.accumulate("isSuccess", false);
			systemService.addLog(message+"，原因："+e.getMessage(), Globals.Log_Leavel_ERROR, Globals.Log_Type_DEL);
		}

		j.accumulate("msg", message);
		String str = j.toString();
		return str;
	}

	/**
	 * 会员中心留言页面
	 * 
	 * @return
	 */
	@RequestMapping("guestBook")
	public ModelAndView guestBook(HttpServletRequest request, String begintime, String endtime) {
		String pageSizeStr = request.getParameter("pageSize");
		String pageIndexStr = request.getParameter("pageIndex");
		Integer pageSize = 5;
		Integer pageIndex = 1;
		if(pageIndexStr!=null){
			String[] p = pageIndexStr.split("",2);
			pageIndexStr = p[0];
		}
		if (StringUtils.isNotEmpty(pageSizeStr) && StringUtils.isNumeric(pageSizeStr)) {
			pageSize = Integer.valueOf(pageSizeStr);
		}

		if (StringUtils.isNotEmpty(pageIndexStr) && StringUtils.isNumeric(pageIndexStr)) {
			pageIndex = Integer.valueOf(pageIndexStr);
		}

		CriteriaQuery cq = new CriteriaQuery(MessagesEntity.class, pageSize, pageIndex, "", "");
		//cq.eq("memberid", memberMng.getSessionMember().getId() + "");
		cq.addOrder("id", SortDirection.desc);
		try {
			if (StringUtils.isNotEmpty(begintime)) {
				cq.gt("createdtime", DataUtils.parseDate(begintime + " 00:00:00","yyyy-MM-dd HH:mm:ss" ));

			}
			if (StringUtils.isNotEmpty(endtime)) {
				cq.lt("createdtime", DataUtils.parseDate(endtime + " 23:59:59","yyyy-MM-dd HH:mm:ss" ));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cq.add();
		
		PageList pageList = messagesService.getPageList(cq, true);
		List<MessagesEntity> guestBookList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount() / (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		List<MessagesEntity> list = guestBookServiceI.getListByCriteriaQuery(cq,false);
		SiteEntity siteEntity = new SiteEntity();
		String siteId = MemberUtils.getSiteId();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("begintime", begintime);
		m.put("endtime", endtime);
		//m.put("guestBookList", guestBookList);
		m.put("pageNo", pageIndex);
		m.put("pageSize", pageSize);
		m.put("pageCount", pageCount);
		m.put("countNum", pageList.getCount());
		m.put("sitePath", memberMng.getSitePath());
		m.put("searchUrl", "guestBook");
		m.put("site",  MemberUtils.getSite());
		m.put("guestBookList",list);
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		return new ModelAndView("guestbook", m);
	}
	/**
	 * 主页留言页面
	 * 
	 * @return
	 */
	@RequestMapping("newsGuestBook")
	public ModelAndView newsguestBook(HttpServletRequest request, String begintime, String endtime) {
		String pageSizeStr = request.getParameter("pageSize");
		String pageIndexStr = request.getParameter("pageIndex");
		Integer pageSize = 5;
		Integer pageIndex = 1;
		if (StringUtils.isNotEmpty(pageSizeStr) && StringUtils.isNumeric(pageSizeStr)) {
			pageSize = Integer.valueOf(pageSizeStr);
		}

		if (StringUtils.isNotEmpty(pageIndexStr) && StringUtils.isNumeric(pageIndexStr)) {
			pageIndex = Integer.valueOf(pageIndexStr);
		}

		CriteriaQuery cq = new CriteriaQuery(MessagesEntity.class, pageSize, pageIndex, "", "");
		//cq.eq("memberid", memberMng.getSessionMember().getId() + "");
		//cq.addOrder("id", SortDirection.desc);
		try {
			if (StringUtils.isNotEmpty(begintime)) {
				cq.gt("createdtime", DataUtils.parseDate(begintime + "yyyy-MM-dd HH:mm:ss"," 00:00:00"));

			}
			if (StringUtils.isNotEmpty(endtime)) {
				cq.lt("createdtime", DataUtils.parseDate(endtime + "yyyy-MM-dd HH:mm:ss"," 23:59:59" ));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cq.add();
		
		PageList pageList = messagesService.getPageList(cq, true);
		List<MessagesEntity> guestBookList = pageList.getResultList();
		int pageCount = (int) Math.ceil((double) pageList.getCount() / (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("begintime", begintime);
		m.put("endtime", endtime);
		m.put("guestBookList", guestBookList);
		m.put("pageNo", pageList.getCurPageNO());
		m.put("pageSize", pageSize);
		m.put("pageCount", pageCount);
		m.put("countNum", pageList.getCount());
		m.put("sitePath", memberMng.getSitePath());
		m.put("searchUrl", "guestBookFrontController.do?newsGuestBook");
		m.put("site",  MemberUtils.getSite());
		return new ModelAndView("newsguestbook", m);
	}
	
}
