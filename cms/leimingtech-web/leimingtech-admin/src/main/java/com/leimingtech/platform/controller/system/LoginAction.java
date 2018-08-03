package com.leimingtech.platform.controller.system;

import com.leimingtech.base.entity.site.vo.SiteVOSimple;
import com.leimingtech.base.entity.temp.TSUser;
import com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.common.Globals;
import com.leimingtech.common.datasource.DataSourceContextHolder;
import com.leimingtech.common.datasource.DataSourceType;
import com.leimingtech.common.utils.LogUtil;
import com.leimingtech.common.utils.StringUtils;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.UserService;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.util.constant.PersonnelStatusConstant;
import com.leimingtech.platform.service.function.FunctionServiceI;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * 登陆初始化控制器
 * 
 * 
 */
@Controller
@RequestMapping("/loginAction")
public class LoginAction extends BaseController {

	@Autowired
	private SystemService systemService;
	@Autowired
	private UserService userService;
	@Autowired
	private FunctionServiceI functionService;

	/**
	 * 检查用户名称
	 * 
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "checkuser")
	@ResponseBody
	public String checkuser(TSUser user, HttpServletRequest req) {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");

		Session session = UserUtils.getSession();
		DataSourceContextHolder
				.setDataSourceType(DataSourceType.dataSource_lmcms);
		JSONObject j = new JSONObject();
		// 添加验证码
		String randCode = req.getParameter("randCode");
		if(StringUtils.isEmpty(randCode)){
			j.accumulate("msg", "请输入验证码");
			j.accumulate("isSuccess", false);
			return j.toString();
		}else if(!randCode.equalsIgnoreCase(String.valueOf(session.getAttribute("randCode")))){
			j.accumulate("msg", "验证码错误");
			j.accumulate("isSuccess", false);
			return j.toString();
		}

		LogUtil.info("shiro第二步 登录");
		Subject subject = SecurityUtils.getSubject();
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(userName,password);
			subject.login(token);
		} catch (UnknownAccountException e) {
			//帐号不存在
			j.accumulate("msg", "用户名/密码错误");
			j.accumulate("isSuccess", false);
			return j.toString();
		} catch (IncorrectCredentialsException e) {
			//密码不正确
			j.accumulate("msg", "用户名/密码错误");
			j.accumulate("isSuccess", false);
			return j.toString();
		} catch (AuthenticationException e) {
			LogUtil.error("用户登录异常", e);
			//系统异常
			j.accumulate("msg", "用户名/密码错误");
			j.accumulate("isSuccess", false);
			return j.toString();
		}

		List<SiteVOSimple> siteList = UserUtils.getSiteList();
		if(siteList==null || siteList.size()==0){
			UserUtils.clearCache();
			return super.error("您还没有站点权限，请联系管理员分配站点权限！").toString();
		}

		UserUtils.setSite(siteList.get(0).getId());

		String logInfo = "["+user.getUserName()+"]登录成功";
		j.accumulate("msg", logInfo);
		j.accumulate("isSuccess", true);

		// 添加登陆日志
		systemService.addLog(logInfo, Globals.Log_Leavel_INFO, Globals.Log_Type_LOGIN);

		String str = j.toString();
		return str;
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@RequestMapping(params = "login")
	public ModelAndView login(HttpServletRequest request) {

		if (UserUtils.getPrincipal() != null) {

			List<FunctionVOShow> functionList = new ArrayList<>();

			TSUser user = UserUtils.getUser();

			if(StringUtils.isEmpty(user.getId())){
				return new ModelAndView("lmPage/main/login");
			}

			String siteId = UserUtils.getSiteId();

			int flag = user.getAuthentication();

			if(flag == PersonnelStatusConstant.ADMINISTRATOR_SUPER || flag == PersonnelStatusConstant.ADMINISTRATOR_PLATFORM){
				functionList = functionService.getAllFunList();
			}else if(flag == PersonnelStatusConstant.ADMINISTRATOR_SITE){
				functionList = functionService.getNonstandardFunList();
			}else {
				functionList = UserUtils.getMenuList();
			}
			//if(functionList.size()==0){return new ModelAndView("lmPage/main/login");}
			request.setAttribute("userName", user.getUserName());
			request.setAttribute("realName", user.getRealName());
			request.setAttribute("headPortrait", user.getHeadPortrait());

			Map<String,Object> m=new HashMap<>();
			m.put("functionList",functionList);
			m.put("siteid",siteId);
			ModelAndView mav = new ModelAndView("lmPage/main/main",m);
			return mav;
		} else {
			return new ModelAndView("lmPage/main/login");
		}

	}

	/**
	 * 点击头部菜单 获取左边子菜单freemarke
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "LeftMenu")
	public ModelAndView LeftMenu(HttpServletRequest request) {
		String funid = request.getParameter("topid");
		List<FunctionVOShow> functionList = null;
		if (StringUtils.isNotEmpty(funid)) {

			TSUser user = UserUtils.getUser();

			int flag = user.getAuthentication();

			if(flag == PersonnelStatusConstant.EDITORIAL_STAFF || flag == PersonnelStatusConstant.ORDINARY_PERSON){
				functionList = userService.getUserFunctionListByFunctionPId(UserUtils.getUser().getId(), funid);
			}else{
				functionList=functionService.getFunVOListById(funid,user.getAuthentication());
			}
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("list", functionList);
		return new ModelAndView("lmPage/main/leftchild", m);
	}

	/**
	 * 退出系统
	 *
	 * @return
	 */
	@RequestMapping(params = "logout")
	public ModelAndView logout(HttpServletRequest request) {
		String logInfo = "已退出登陆";
		systemService.addLog(logInfo, Globals.Log_Leavel_INFO, Globals.Log_Type_EXIT);
		HttpSession session = ContextHolderUtils.getSession();
		//shiro退出
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()){
			subject.logout();
		}
		UserUtils.clearCache();
		ModelAndView modelAndView = new ModelAndView(new RedirectView(
				"loginAction.do?login"));

		return modelAndView;
	}

	/**
	 * 首页跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "home")
	public ModelAndView home(HttpServletRequest request) {
		return new ModelAndView("login");
	}

	/**
	 * 无权限页面提示跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "noAuth")
	public ModelAndView noAuth(HttpServletRequest request,HttpServletResponse response) {
		Boolean isalert = Boolean.valueOf(request.getParameter("alert"));
		Boolean ajax = Boolean.valueOf(request.getParameter("ajax"));
		if (isalert) {
			return new ModelAndView("lmPage/main/noAuthAlert");
		}else if(ajax){
			JSONObject j=new JSONObject();
			j.accumulate("isSuccess", false);
			j.accumulate("msg", "对不起，你无此权限");
			response.setContentType("text/html;charset=utf-8");
			try {
				response.getWriter().println("\"{\\\"isSuccess\\\":false,\\\"msg\\\":\\\"对不起，你无此权限\\\"}\"");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else {
			return new ModelAndView("lmPage/main/noAuth");
		}
		
	}

}
