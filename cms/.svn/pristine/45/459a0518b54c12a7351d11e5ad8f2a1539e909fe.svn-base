package com.leimingtech.cms.controller.sinotransstats;

import com.leimingtech.cms.service.accessstatistics.AccessStatistiscsServiceI;
import com.leimingtech.core.common.PlatformConstants;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 站点总体统计控制层
 * @date 2017-04-11 14:54:01
 */
@Controller
@RequestMapping("/accessStatisticsController")
public class AccessStatisticsController {
    /** 系统接口 */
    @Autowired
    private AccessStatistiscsServiceI accessStatistiscsServiceI;

    @RequestMapping(params = "accessStatistics")
    public ModelAndView accessStatistics(HttpServletRequest request) {
        String siteId = request.getParameter("siteId");
        String catId = request.getParameter("catId");
        Map<String, Object> m = accessStatistiscsServiceI.getPageList(siteId,catId);
        m.put("siteId",siteId);
        return new ModelAndView("cms/accessstatistics/accessStatistics", m);
    }
}
