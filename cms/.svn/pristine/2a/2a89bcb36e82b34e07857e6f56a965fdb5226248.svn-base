package com.leimingtech.platform.core.interceptors;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.common.utils.*;
import com.leimingtech.common.utils.ResourceUtil;
import com.leimingtech.core.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


import com.leimingtech.common.Globals;

import com.leimingtech.base.entity.temp.TSFunction;
import  com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.platform.service.function.FunctionServiceI;

/**
 * 权限拦截器
 *
 * @author
 */
public class AuthInterceptor implements HandlerInterceptor {

	/**
	 * 站点管理接口I
	 */
	@Autowired
	private SiteServiceI siteService;


	/**
	 * 菜单管理接口
	 */
	@Autowired
	private FunctionServiceI functionService;

	private List<String> excludeUrls;
	private static List<TSFunction> functionList;

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 在controller后拦截
	 */
	public void afterCompletion(HttpServletRequest request,
								HttpServletResponse response, Object object, Exception exception)
			throws Exception {
	}

	public void postHandle(HttpServletRequest request,
						   HttpServletResponse response, Object object,
						   ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在controller前拦截
	 */
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response, Object object) throws Exception {

		String toSite = request.getParameter("toSite");// 获取url中站点id，通过传递此参数可以切换站点

		if (com.leimingtech.common.utils.StringUtils.isNotBlank(toSite)) {
			UserUtils.setSite(toSite);
		}


		String requestPath = ResourceUtil.getRequestPath(request);// 用户访问的资源地址
		HttpSession session = ContextHolderUtils.getSession();
		session.setAttribute("contextpath", Globals.CONTEXTPATH);
		if (true) {
			return true;
		}
//		ThreadContextHolder.setHttpRequest(request);
//		ThreadContextHolder.setHttpResponse(response);
//		ThreadContextHolder.getSessionContext().setSession(session);

		if (requestPath.indexOf("member/") != -1) {
			String name = HttpUtil.getCookieValue(request, "loginname");
			if (com.leimingtech.common.utils.StringUtils.isEmpty(name)) {
				name = request.getParameter("username");
			}
			request.setAttribute("frontusername", name);
			if (excludeUrls.contains(requestPath)) {
				return true;
			}
			MemberEntity member = null;

			String toFrontSite = request.getParameter("toFrontSite");// 获取url中站点id，通过传递此参数可以切换站点

			if (com.leimingtech.common.utils.StringUtils.isNotEmpty(toFrontSite)) {
				MemberUtils.setSite(toFrontSite);
			}
			if (member == null) {
				String basePath = request.getScheme() + "://"
						+ request.getServerName() + ":"
						+ request.getServerPort() + request.getRequestURI()
						+ "?" + request.getQueryString();
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder builder = new StringBuilder();
				builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
				// builder.append("alert(\"本系统需要您登录后才能使用\");");
				builder.append("window.top.location.href=\"");
				builder.append("loginAct/login");
				builder.append("&addr=");
				builder.append(basePath);
				builder.append("\";</script>");
				out.print(builder.toString());
				out.close();
				return false;
			}
			return true;
		} else if (requestPath.indexOf("front/") != -1) {

			String toFrontSite = request.getParameter("toFrontSite");// 获取url中站点id，通过传递此参数可以切换站点

			if (com.leimingtech.common.utils.StringUtils.isNotEmpty(toFrontSite)) {
				MemberUtils.setSite(toFrontSite);
			}
			return true;
		} else if (requestPath.indexOf("docs/") != -1

				|| excludeUrls.contains(requestPath)) {
			return true;
		} else if (UserUtils.getPrincipal() != null) {

			if (!functionService.checkUrlExist(requestPath)) {
				return true;
			}

			Boolean isalert = Boolean
					.valueOf(request.getParameter("alert"));
			Boolean ajax = Boolean
					.valueOf(request.getParameter("ajax"));
			response.sendRedirect("loginAction.do?noAuth&alert=" + isalert + "&ajax=" + ajax);
			return false;

		} else {
			if (!functionService.checkUrlExist(requestPath)) {
				return true;
			}

			forward(request, response);
			return false;
		}

	}

	/**
	 * 转发
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "forword")
	public ModelAndView forword(HttpServletRequest request) {
		// return new ModelAndView(new
		// RedirectView("loginController.do?login"));
		return new ModelAndView(new RedirectView("loginAction.do?login"));
	}

	private void forward(HttpServletRequest request,
						 HttpServletResponse response) throws ServletException, IOException {
		String path = "/lmPage/main/login.html";
		request.getRequestDispatcher(path).forward(request, response);
	}

}