package com.leimingtech.platform.service.siteauthority;


import com.leimingtech.base.entity.temp.TSUser;

import java.util.List;
import java.util.Map;

/**
 * Created by wy on 2017/5/2.
 */
public interface SiteAuthorityServiceI {

     List<Map<String, Object>> getSinotransStats(String siteId, int pageSize, int pageNo);

     TSUser removeAuthority(String siteId, String userId);
}
