package com.leimingtech.member.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.util.*;
import net.sf.json.JSONObject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import  com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.SystemService;

/**
 * CMS前台用户
 * 
 * @author liuzhen 2014年6月4日 20:07:37
 * 
 */
@Controller
@RequestMapping("/MemberAct")
public class MemberAction extends BaseController {

	@Autowired
	private MemberServiceI memberMng;

	@Autowired
	private SystemService systemMng;
	@Autowired
	private SiteServiceI siteServiceI;

	private String message;

	/**
	 * 个人信息
	 * 
	 * @return
	 */
	@RequestMapping("personal")
	public ModelAndView personal(HttpServletRequest reqeust) {
		MemberEntity member = memberMng.getSessionMember();
		SiteEntity siteEntity = new SiteEntity();
		String siteId = MemberUtils.getSiteId();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("page", member);
		m.put("site",  siteEntity);
		m.put("sitePath", memberMng.getSitePath());
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		return new ModelAndView("personalinfo", m);
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping("passwordModify")
	public ModelAndView passwordModify(HttpServletRequest request) {
		Map<String, Object> m = new HashMap<String, Object>();
		SiteEntity siteEntity = new SiteEntity();
		String siteId = MemberUtils.getSiteId();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}

		m.put("site",  MemberUtils.getSite());
		m.put("sitePath", memberMng.getSitePath());
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		return new ModelAndView("passwordmodify", m);
	}

	/**
	 * 保存
	 * 
	 * @return
	 */
	@RequestMapping("savePassword")
	@ResponseBody
	public String savePassword(HttpServletRequest requset, String keyword, String password, String repassword) {
		MemberEntity m = memberMng.getSessionMember();
		MemberUtils.clearCache();
		JSONObject j = new JSONObject();
		if (StringUtils.isEmpty(keyword)) {
			j.accumulate("isSuccess", false);
			message = "原密码不能为空";
		} else if (StringUtils.isEmpty(password) || StringUtils.isEmpty(repassword) || !password.equals(repassword)) {
			j.accumulate("isSuccess", false);
			message = "两次密码不一致";
		}

		String oldpwd = PasswordUtil.encrypt(m.getUsername(), keyword, PasswordUtil.getStaticSalt());
		if (oldpwd.equals(m.getPassword())) {
			message = "密码修改成功，重新登陆时生效！";
			try {
				m.setPassword(PasswordUtil.encrypt(m.getUsername(), password, PasswordUtil.getStaticSalt()));
				memberMng.saveOrUpdate(m);
				j.accumulate("msg",message);
				j.accumulate("isSuccess", true);
				systemMng.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				j.accumulate("isSuccess", false);
				message = "密码修改失败";
			}
		} else {
			j.accumulate("isSuccess", false);
			message = "原密码不正确！";
		}
		j.accumulate("msg", message);
		j.accumulate("toUrl", "");
		String str = j.toString();
		return str;
	}

	/**
	 * 会员修改个人信息
	 * 
	 * @return
	 */
	@RequestMapping("updateInfo")
	@ResponseBody
	public String updateInfo(MemberEntity user, HttpServletRequest reqeust) {
		MemberEntity member = memberMng.getSessionMember();

		JSONObject j = new JSONObject();
		try {
			user.setUsername(null);
			MyBeanUtils.copyBeanNotNull2Bean(user, member);
			MemberUtils.clearCache();
			memberMng.saveOrUpdate(member);

			j.accumulate("isSuccess", true);
			message = "信息更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			j.accumulate("isSuccess", false);
			message = "信息更新失败";
		}

		j.accumulate("msg", message);
		j.accumulate("toUrl", "MemberAct/personal");
		String str = j.toString();
		return str;
	}
	
	/**
	 * 忘记密码
	 * @return
	 */
	@RequestMapping("findpassword")
	public ModelAndView findPassword(HttpServletRequest request) {
		Map<String, Object> m = new HashMap<String, Object>();
		SiteEntity siteEntity = MemberUtils.getSite();
		String siteId = request.getParameter("siteId");
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}
		m.put("site", siteEntity);
		//m.put("siteId",siteId);
		m.put("sitePath", siteEntity.getSitePath());
		m.put("title", "找回密码");
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		return new ModelAndView("findpassword",m);
		//return new ModelAndView("passwordmodify", m);
	}
	
	/**
	 * 验证用户名与邮箱是否为同一个用户的
	 * @param req
	 * @param response
	 * @return
	 */
	@RequestMapping("checkNameAndEmail")
	@ResponseBody
	public boolean checkNameAndEmail(HttpServletRequest req, HttpServletResponse response) {
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		boolean haveuser = memberMng.checkNameAndEmail(username, email);
		return haveuser;
	}
	
	/**
	 * 发送邮件
	 * @return
	 */
	@RequestMapping("sendemail")
	@ResponseBody
	public String sendEmail(HttpServletRequest request){
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String domain = PlatFormUtil.getDomail();
		SiteEntity siteEntity = MemberUtils.getSite();
		JSONObject j = new JSONObject();
		try {
			String initcode = username + "," + System.currentTimeMillis();
			String url = domain + "/MemberAct/editPassword&s=" + EncryptionUtil.authcode(initcode, "ENCODE", "", 0);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("url", url);
			data.put("username", username);
			// 找回密码模板路径
			//String path = this.getClass().getResource("").getPath();
			String path = "emailtpl/emailtemplate.html";
			
			SendMailUtil.sendMailByTemplate(email, "找回密码", path, data);
			message = "邮件已发送！";
			j.accumulate("isSuccess", true);
			j.accumulate("msg", message);
			//j.accumulate("doamin",s)
			j.accumulate("toUrl", "sendEmailSuccess?siteId=1&email=" + email);
		} catch (Exception e) {
			e.printStackTrace();
			message = "邮件发送失败！";
			j.accumulate("isSuccess", false);
			j.accumulate("msg", message);
			j.accumulate("toUrl", "findpassword");
		}
		String str = j.toString();
		return str;
	}
	
	/**
	 * 邮件发送成功
	 * @param request
	 * @return
	 */
	@RequestMapping("sendEmailSuccess")
	public ModelAndView sendEmailSuccess(HttpServletRequest request){
		Map<String, Object> m = new HashMap<String, Object>();
		String email = request.getParameter("email");
		String siteId = request.getParameter("siteId");
		String[] str = email.split("@");
		String emailexe = str[1];
		SiteEntity siteEntity = new SiteEntity();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}
		m.put("email", email);
		m.put("title", "找回密码");
		m.put("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		//m.put("doamin",siteEntity.getProtocol()+siteEntity.getDomain());
		//m.put("site",siteEntity);
		if(SendMailUtil.emailMap.containsKey(emailexe)){
			m.put("mailurl", SendMailUtil.emailMap.get(emailexe));
		}
		
		return new ModelAndView("sendemailsuccess", m);
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping("editPassword")
	public ModelAndView editPassword(HttpServletRequest request) {
		Map<String, Object> m = new HashMap<String, Object>();
		String s = request.getParameter("s");
		if(StringUtils.isEmpty(s)){  // 参数没有
			m.put("title", "错误提示");
			m.put("errortitle", "找回密码错误");
			m.put("errotcontent", "非法链接地址，请重新找回。<a href='MemberAct/findpassword'>点击重新找回</a>");
			return new ModelAndView("error", m);
		}
		String str = EncryptionUtil.authcode(s, "DECODE", "", 0);
		String[] array = StringUtils.split(str, ",");
		if(array.length != 2){       // 参数不对
			m.put("title", "错误提示");
			m.put("errortitle", "找回密码错误");
			m.put("errotcontent", "验证字符串不正确，请重新找回。<a href='MemberAct/findpassword'>点击重新找回</a>");
			return new ModelAndView("error", m);
		}
		String username = array[0];
		MemberEntity member = memberMng.getMemberByUsername(username);
		if(null == member){          // 用户不存在
			m.put("title", "错误提示");
			m.put("errortitle", "找回密码错误");
			m.put("errotcontent", "验证字符串不正确，请重新找回。<a href='MemberAct/findpassword'>点击重新找回</a>");
			return new ModelAndView("error", m);
		}
		long time = Long.parseLong(array[1]);
		long nowtime = System.currentTimeMillis();
		int h = 1000 * 60 * 60 * 24;
		if(nowtime - time > h){      // 地址过期
			m.put("title", "错误提示");
			m.put("errortitle", "找回密码错误");
			m.put("errotcontent", "地址已过期，请重新找回。<a href='MemberAct/findpassword'>点击重新找回</a>");
			return new ModelAndView("error", m);
		}
		m.put("username", username);
		m.put("sitePath", memberMng.getSitePath());
		m.put("title", "修改密码");
		m.put("site",  MemberUtils.getSite());
		return new ModelAndView("editpassword", m);
	}
	
	/**
	 * 保存修改密码
	 * @return
	 */
	@RequestMapping("saveEditPassword")
	public ModelAndView saveEditPassword(HttpServletRequest requset) {
		Map<String, Object> map = new HashMap<String, Object>();
		String password = requset.getParameter("password");
		String username = requset.getParameter("username");
		MemberEntity m = memberMng.getMemberByUsername(username);
		try {
			m.setPassword(PasswordUtil.encrypt(username, password, PasswordUtil.getStaticSalt()));
			memberMng.saveOrUpdate(m);
			message = "密码修改成功";
			systemMng.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			map.put("title", "提示");
			map.put("errortitle", "密码修改成功");
			map.put("errotcontent", "密码成功找回，请<a href='loginAct/login'>登录</a>");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("title", "提示");
			map.put("errortitle", "密码修改失败");
			map.put("errotcontent", "密码找回失败，请点击<a href='MemberAct/findpassword'>重新找回</a>");
		}
		return new ModelAndView("error", map);
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public static void main(String[] args) {
		System.out.println(PasswordUtil.encrypt("kviuff", "666666", PasswordUtil.getStaticSalt()));
	}

}
