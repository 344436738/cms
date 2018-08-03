package com.leimingtech.cms.controller.sinotransstats;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.common.Globals;
import com.leimingtech.core.util.LogUtil;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.cms.service.sinotransstats.SinotransStatsServiceI;

/**
 * @Title: Controller
 * @Description: 统计pv/uv/ip
 * @author
 * @date 2017-04-11 16:54:01
 * @version V1.0
 *
 */
@Controller
@RequestMapping("/front/sinotransStatsController")
public class SinotransStatsController extends BaseController {

	private String message;
	/** 统计pv/uv/ip接口 */
	@Autowired
	private SinotransStatsServiceI sinotransStatsService;
	/** 系统接口 */
	@Autowired
	private SystemService systemService;

	@RequestMapping(params = "addstats")
	public String addstats(HttpServletRequest request){
		try {
			String url = request.getParameter("url");//当前页面
			String platform = request.getParameter("platform");//操作系统
			String language = request.getParameter("language");//浏览器语言
			String browserName = request.getParameter("browserName");////浏览器名称
			String screen = request.getParameter("screen");//分辨率
			String javaEnabled = request.getParameter("javaEnabled");//Java小程序
			String refeUrl = request.getParameter("refeUrl");//引用页
			String colorDepth = request.getParameter("colorDepth");//颜色深度
			String ckeTrue = request.getParameter("ckeTrue");//cookie是否启动
			String flashTrue = request.getParameter("flashTrue");//flash插件
			String flashVersions = request.getParameter("flashVersions");//flash版本
			String contentId = request.getParameter("contentId");
			String siteId = request.getParameter("siteId");
			String contentCatId = request.getParameter("catId");

			boolean flag = sinotransStatsService.saveStats(url,platform,language,browserName,screen,javaEnabled,refeUrl,colorDepth
					,ckeTrue,flashTrue,flashVersions,contentId,siteId,contentCatId);

			if(flag){
				message = url+"系统信息统计成功";
//				LogUtil.info(message);
//				systemService.addLog(message, Globals.Log_Leavel_INFO,
//						Globals.Log_Type_INSERT);
			}else{
				message = url+"系统信息统计失败";
//				LogUtil.info(message);
//				systemService.addLog(message, Globals.Log_Leavel_INFO,
//						Globals.Log_Type_INSERT);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
