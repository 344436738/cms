package com.leimingtech.platform.controller.siteauthority;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.TSUser;
import com.leimingtech.common.Globals;
import com.leimingtech.core.common.PlatformConstants;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.platform.service.siteauthority.SiteAuthorityServiceI;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wy on 2017/5/2.
 * 站点权限管理
 */
@Controller
@RequestMapping("/SiteAuthorityController")
public class SiteAuthorityController {
    private static final Logger logger = Logger.getLogger(SiteAuthorityController.class);
    @Autowired
    private SystemService systemService;
    @Autowired
    private SiteServiceI siteServiceI;
    @Autowired
    private SiteAuthorityServiceI siteAuthorityServiceI;
    private String message;

    /**
     * 获取站点列表
     * @param request
     * @return
     */
    @RequestMapping(params = "siteList")
    public ModelAndView list(HttpServletRequest request) {
        List<SiteEntity> siteEntityList = siteServiceI.siteList();
        Map<String,Object> m = new HashMap<>();
        m.put("siteEList",siteEntityList);
        return new ModelAndView("cms/siteauthority/siteauthoritylist",m);
    }

    /**
     * 获取userList
     * @param request
     * @return
     */
    @RequestMapping(params = "userList")
    public  ModelAndView userList(HttpServletRequest request){
        // 获取站点管理列表
        int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE : Integer.valueOf(request.getParameter("pageSize"));
        int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1 : Integer.valueOf(request.getParameter("pageNo"));

        String siteId = request.getParameter("siteId");
        List<Map<String, Object>> userList = siteAuthorityServiceI.getSinotransStats(siteId,pageSize,pageNo);
        TSUser user = UserUtils.getUser();
        Map<String,Object> m = new HashMap<>();
        m.put("userList",userList);
        m.put("identifyLabel",user.getAuthentication());
        m.put("pageNo",pageNo);
        m.put("pageSize",pageSize);
        m.put("siteId",siteId);
        return new ModelAndView("cms/siteauthority/authorityUserList",m);
    }

    @RequestMapping(params = "removeauthority")
    @ResponseBody
    public String removeauthority(HttpServletRequest request){
        JSONObject j = new JSONObject();
        String siteId = request.getParameter("siteId");
        String userId = request.getParameter("userId");

        if(StringUtils.isNotEmpty(userId)){
            TSUser user = siteAuthorityServiceI.removeAuthority(siteId,userId);
            if(user!=null){
                message = "用户[" + user.getUserName() + "]权限移除成功";
            }else{
                message = "操作失败，请联系管理员";
            }
        }else{
            message = "操作失败，请联系管理员";
        }
        systemService.addLog(message, Globals.Log_Leavel_INFO,
                Globals.Log_Type_UPDATE);
        j.accumulate("isSuccess", true);
        j.accumulate("msg", message);
        j.accumulate("toUrl", "SiteAuthorityController.do?userList");
        String str = j.toString();
        return str;
    }
}
