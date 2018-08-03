package com.leimingtech.common;

import com.leimingtech.common.exception.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * spring mvc异常捕获类
 * 
 */
@Component
public class MyExceptionHandler implements HandlerExceptionResolver {
	private static final Logger logger = Logger
			.getLogger(MyExceptionHandler.class);

	public ModelAndView resolveException(HttpServletRequest request,
										 HttpServletResponse response, Object handler, Exception ex) {
		String exceptionMessage = ExceptionUtils.getExceptionMessage(ex);
		logger.error(exceptionMessage);

//		boolean ajax = BooleanUtils.toBoolean(request.getParameter("ajax"));
//		if(ajax){
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = null;
//			try {
//				out = response.getWriter();
//				out.println("\"{\\\"isSuccess\\\":false,\\\"msg\\\":\\\"" + ex.getMessage() + "\\\"}\"");
//			} catch (IOException e) {
//				e.printStackTrace();
//			} finally {
//				if (out != null) {
//					out.flush();
//					out.close();
//				}
//			}
//			return null;
//		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("exceptionMessage", exceptionMessage);
		model.put("ex", ex);
		return new ModelAndView("common/error", model);
	}
}
