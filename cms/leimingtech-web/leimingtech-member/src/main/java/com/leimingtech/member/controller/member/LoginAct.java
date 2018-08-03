package com.leimingtech.member.controller.member;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.ContentCatDefault;
import com.leimingtech.base.entity.temp.MemberDepart;
import com.leimingtech.common.utils.LogUtil;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.service.WebSessionContext;
import com.leimingtech.core.util.*;
import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;


import com.leimingtech.base.entity.temp.TSDepartChannel;
import  com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.thirdlogin.ThirdloginServiceI;
import com.leimingtech.core.weibo4j.Oauth;
import com.leimingtech.core.weibo4j.Users;
import com.leimingtech.core.weibo4j.http.AccessToken;
import com.leimingtech.core.weibo4j.model.User;
import com.leimingtech.core.weibo4j.model.WeiboException;
import com.leimingtech.core.weibo4j.util.WeiboConfig;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.utils.QQConnectConfig;
import com.qq.connect.utils.RandomStatusGenerator;

/**
 * 会员登录
 * 
 * @author liuzhen 2014年5月27日 16:32:43
 * 
 */
@Controller
@RequestMapping("/loginAct")
public class LoginAct extends BaseController {

	private String message;

	@Autowired
	private MemberServiceI memberMng;// 会员管理

	@Autowired
	private SystemService systemService;

	@Autowired
	private MemberServiceI memberService;
	@Autowired
	private ThirdloginServiceI thirdloginService;

	@Autowired
	private SiteServiceI siteServiceI;

	/**
	 * 登录页面
	 *
	 * @return
	 */
	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest reqeust) {

		// 跳转登录页面前地址
		String addr = reqeust.getParameter("addr");
		MemberUtils.clearCache();
		MemberUtils.removeCache("siteId");
		MemberEntity member = MemberUtils.getMember();

//		addr = "";
		/*if (MemberUtils.getPrincipal() != null && StringUtils.isNotBlank(member.getName())){
			return new ModelAndView(new RedirectView("login"));
		}*/

		Map<String, Object> m = new HashMap<String, Object>();
		String sinapath = sinaLogin();
		String qqpath = qqLogin();
		String username = reqeust.getParameter("username");
		String siteId = reqeust.getParameter("siteId");
		/*SiteEntity siteEntity = new SiteEntity();
		siteEntity.getDomain();
		siteEntity.getProtocol();*/
		if (StringUtils.isNotEmpty(username)) {
			m.put("username", username);
		}
		SiteEntity siteEntity = new SiteEntity();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}
		m.put("siteId",siteId);
		m.put("addr", addr);
		m.put("title", "登录");
		m.put("sinapath", sinapath);
		m.put("domain", siteEntity.getProtocol()+siteEntity.getDomain());
		//m.put("frontpath", ResourceUtil.getCMSFrontPath());
		m.put("qqpath", qqpath);
		return new ModelAndView("login", m);
	}

	@RequestMapping("checkName")
	@ResponseBody
	public boolean checkName(MemberEntity user, HttpServletRequest req, HttpServletResponse response) {
		String username = req.getParameter("username");
		boolean haveuser = memberMng.checkUserExits(username); // 验证用户名是否存在
		return haveuser;
	}

	/**
	 * 检查用户名称
	 *
	 * @return
	 */
	@RequestMapping("checkLogin")
	@ResponseBody
	public String checkLogin(HttpServletRequest req,HttpServletResponse response) {
		// 跳转前地址
		String addr = "";
		String rememberpassword = req.getParameter("rememberpassword");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		//获取到site,存入session
		String siteId = req.getParameter("siteId");
		JSONObject j = new JSONObject();

		SiteEntity siteEntity = new SiteEntity();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}
		Subject subject = SecurityUtils.getSubject();

		try {
			UsernamePasswordToken token = new UsernamePasswordToken(username,password);
			subject.login(token);
		} catch (UnknownAccountException e) {
			//帐号不存在
			j.accumulate("msg", "用户名/密码错误");
			j.accumulate("isSuccess", false);
			j.accumulate("errortype", "username");
			return j.toString();
		} catch (IncorrectCredentialsException e) {
			//密码不正确
			j.accumulate("msg", "用户名/密码错误");
			j.accumulate("isSuccess", false);
			j.accumulate("errortype", "username");
			return j.toString();
		} catch (AuthenticationException e) {
			LogUtil.error("用户登录异常", e);
			//系统异常
			j.accumulate("msg", "用户名/密码错误");
			j.accumulate("isSuccess", false);
			j.accumulate("errortype", "username");
			return j.toString();
		}

		MemberEntity member=memberService.getMember(MemberUtils.getMemberId());

		//为用户添加栏目权限
		List<String> defaultList = new ArrayList<String>();
		//默认权限
		List<ContentCatDefault> list = memberService.getList(ContentCatDefault.class);
		if(list.size()!=0){
			for(ContentCatDefault cat :list){
				defaultList.add(cat.getChannelId());
			}
		}
		//会员本身权限
		List<MemberDepart> memberDepartList =  memberService.findByProperty(MemberDepart.class,"member.id",member.getId());
		if(memberDepartList.size()!=0){
			for(MemberDepart mDepart:memberDepartList){
				List<TSDepartChannel> dclist = memberService.findByProperty(TSDepartChannel.class, "depart.id", mDepart.getDepart().getId());
				for(TSDepartChannel dChannel:dclist){
					defaultList.add(dChannel.getChannel().getId());
				}
			}
		}
		req.getSession().setAttribute("channel",defaultList);

		message = "用户: " + member.getUsername() + "登录成功";
		MemberUtils.setSite(siteId);
		MemberEntity sessionMember = new MemberEntity();
		sessionMember.setId(member.getId());
		sessionMember.setUsername(member.getUsername());

		member.setLastlogin(new Date());
		int count = member.getLogincount();
		member.setLogincount(count + 1);
		memberMng.saveOrUpdate(member);
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		if (StringUtils.isNotEmpty(addr)) {
			j.accumulate("toUrl", addr);
		} else {
			j.accumulate("toUrl", "MemberAct/personal");
		}
		HttpUtil.addCookie(response, username + "loginerror", "", 0);
		if (com.leimingtech.common.utils.StringUtils.isNotEmpty(rememberpassword)) {
			HttpUtil.addCookie(response, "loginname", member.getUsername(), 365 * 24 * 60 * 60);
		} else {
			HttpUtil.addCookie(response, "loginname", "", 0);
		}

		String str = j.toString();
		return str;
	}

	/**
	 * 会员退出
	 *
	 * @param req
	 * @return
	 */
	@RequestMapping("exitLogin")
	@ResponseBody
	public String exitLogin(HttpServletRequest req) {
		JSONObject j = new JSONObject();
		MemberUtils.clearCache();
		//MemberUtils.getSubject().logout();
		String siteId = MemberUtils.getSiteId();
		SiteEntity siteEntity = new SiteEntity();
		if(StringUtils.isNotEmpty(siteId)){
			siteEntity = siteServiceI.getSite(siteId);
		}
		message = "退出成功！";
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "/");
		j.accumulate("domain",siteEntity.getProtocol()+siteEntity.getDomain());
		String str = j.toString();
		MemberUtils.getSubject().logout();
		return str;
	}

	/**
	 * 会员授权登录
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "thirdLogin")
	@ResponseBody
	public String thirdLogin(HttpServletRequest request) {
		String reqpath = "";
		String type = request.getParameter("type");
		if ("sina".equals(type)) {
			reqpath = sinaLogin();
		} else if ("qq".equals(type)) {
			reqpath = qqLogin();
		}
		JSONObject j = new JSONObject();
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", reqpath);
		return j.toString();
	}

	/**
	 * 1.当点击qq授权登录 2.拼好路径传到前台 3.window.location.href请求qq平台 4.qq平台返回一个授权的窗口
	 *
	 * @return
	 */
	private String qqLogin() {
		String state = RandomStatusGenerator.getUniqueState();
		String reqPath = new StringBuilder().append(QQConnectConfig.getValue("authorizeURL").trim()).append("?response_type=")
				.append("code").append("&client_id=").append(QQConnectConfig.getValue("app_ID").trim()).append("&redirect_uri=")
				.append(QQConnectConfig.getValue("redirect_URI").trim()).append("&state=").append(state).toString();
		return reqPath;
	}

	/**
	 * 1.当点击sina授权登录 2.拼好路径传到前台 3.window.location.href请求sina平台 4.sina平台返回一个授权的窗口
	 */
	private String sinaLogin() {
		String reqpath = "";
		reqpath = WeiboConfig.getValue("baseURL").trim() + "/authorize?client_id=" + WeiboConfig.getValue("client_ID").trim()
				+ "&redirect_uri=" + WeiboConfig.getValue("redirect_URI").trim();
		return reqpath;
	}

	/**
	 * 这个方法是授权成功后，返回的路径，请求的这个方法 获取qq用户的信息
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping("/qqUserInfo")
	public ModelAndView qqUserInfo(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html,charset-utf-8");
		Map<String, Object> m = new HashMap<String, Object>();
		try {
			// 授权成功后获取token
			// 在getAccessTokenByRequest()方法中有client.post()先拿到了返回来的code然后去获取token的

			com.qq.connect.javabeans.AccessToken accessTokenObj = (new com.qq.connect.oauth.Oauth()).getAccessTokenByRequest(request);
			// 对AccessToken进行判断，如果用户取消了 AccessToken就为空
			if (!accessTokenObj.getAccessToken().equals("")) {
				String accessToken = null;
				String openID = null;

				accessToken = accessTokenObj.getAccessToken();

				// 利用获取到的accessToken去获取当前用的openid
				OpenID openIDObj = new OpenID(accessToken);
				openID = openIDObj.getUserOpenID(); // 同一个qq号的openid是相同的
				// 利用获取到的accessToken,openid 去获取用户在Qzone的昵称等信息
				UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
				UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();

				// 本站会员对象，获取SINA用户信息后存入本地用户表
				MemberEntity member = new MemberEntity();
				if (userInfoBean.getRet() == 0) {
					member.setUsername(userInfoBean.getNickname()); // 昵称
					Integer sex = userInfoBean.getGender().equals("男") ? 1 : 0;
					member.setSex(sex); // 性别
					member.setLastlogin(new Date()); // 最后登录时间
					member.setThirdLogin_uid(openID); // qq用户的的唯一标示
					member.setThirdType("qq"); // 用户类型
					MemberEntity t = thirdloginService.singleResult("from MemberEntity where prop1='" + openID + "'");
					if (null != t) {
						com.leimingtech.common.utils.MyBeanUtils.copyBeanNotNull2Bean(member, t);
						memberService.saveOrUpdate(t);
					} else {
						member.setCreatetime(new Date());//创建时间
						memberService.save(member);
					}

					MemberEntity sessionMember = new MemberEntity();
					sessionMember.setId(member.getId());
					sessionMember.setUsername(member.getUsername());

					message = "用户: " + member.getUsername() + "登录成功";
					systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_LOGIN);
				}
			}
		} catch (Exception e) {
			message = "LoginAct/getQQUser()-239";
			e.printStackTrace();
			return new ModelAndView(new RedirectView("loginAct/login") , m);
		}
		return new ModelAndView(new RedirectView("MemberAct/personal") , m);
	}

	/**
	 * 获取新浪用户的信息
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping("/sinaUserInfo")
	public ModelAndView sinaUserInfo(HttpServletRequest request) {
		Map<String, Object> m = new HashMap<String, Object>();
		try {
			// 获取授权以后的CODE值
			String code = request.getParameter("code");
			// 根据CODE获取ACCESSTOKEN
			Oauth oauth = new Oauth();
			AccessToken accesstoken = oauth.getAccessTokenByCode(code);
			// 根据ACCESSTOKEN获取UID
			String uid = accesstoken.getUid();
			// 根据UID获取用户信息
			String token = accesstoken.getAccessToken();
			Users users = new Users();
			users.setToken(token);
			User user = users.showUserById(uid);
			// 本站会员对象，获取SINA用户信息后存入本地用户表
			MemberEntity member = new MemberEntity();
			member.setUsername(user.getName());
			member.setRealname(user.getScreenName());
			member.setName(user.getScreenName());
			//member.setSex(Integer.parseInt(user.getGender()));
			member.setAddress(user.getLocation());
			member.setRemark(user.getDescription());
			member.setLastlogin(new Date());
			member.setThirdLogin_uid(user.getId()); // SINA用户的UID
			member.setThirdType("sina"); // 用户类型
			member.setLogincount(0);

			MemberEntity t = thirdloginService.singleResult("from MemberEntity where thirdLogin_uid='" + uid + "'");
			if(null != t){
				com.leimingtech.common.utils.MyBeanUtils.copyBeanNotNull2Bean(member, t);
				memberService.saveOrUpdate(t);
				member.setId(t.getId());
			}else{
				member.setCreatetime(new Date());//创建时间
				memberService.save(member);
			}
			HttpSession session = ContextHolderUtils.getSession();

			MemberEntity sessionMember = new MemberEntity();
			sessionMember.setId(member.getId());
			sessionMember.setUsername(member.getUsername());
			sessionMember.setThirdToken(token);

			message = "用户: " + member.getUsername() + "登录成功";
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_LOGIN);
		} catch (WeiboException e) {
			e.printStackTrace();
			return new ModelAndView(new RedirectView("loginAct/login") , m);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView(new RedirectView("loginAct/login") , m);
		}
		return new ModelAndView(new RedirectView("MemberAct/personal") , m);
	}
}
