package com.leimingtech.platform.service.impl.siteauthority;

import com.leimingtech.base.entity.sitepermissions.SitePermissionsEntity;
import com.leimingtech.base.entity.temp.TSUser;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.platform.service.siteauthority.SiteAuthorityServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by wy on 2017/5/2.
 */
@Service("siteAuthorityServiceI")
@Transactional
public class SiteAuthorityServiceimpl implements SiteAuthorityServiceI {
    /** 公共dao接口 */
    @Autowired
    private CommonService commonService;

    /**
     * 获取站点下用户列表
     * @param siteId
     * @param pageSize
     * @param pageNo
     * @return
     */
    @Override
    public List<Map<String, Object>> getSinotransStats(String siteId, int pageSize, int pageNo) {
        String sql = "SELECT bu.id id,bu.username username,bu.authentication authentication FROM cms_base_user bu"
                    +" inner join cms_site_user su on su.user_id=bu.id "
                    +" where su.site_id='"+siteId+"' ";
                //+ " id = (SELECT user_id userid FROM cms_site_user WHERE site_id='"+siteId+"')";
        List<Map<String, Object>> userList = commonService.findForJdbc(sql,pageNo,pageSize);
        return userList;
    }

    /**
     * 移除站点下用户权限
     * @param siteId
     * @param userId
     * @return
     */
    @Override
    public TSUser removeAuthority(String siteId, String userId) {
        if(StringUtils.isNotEmpty(siteId) && StringUtils.isNotEmpty(userId)){
            CriteriaQuery cq = new CriteriaQuery(SitePermissionsEntity.class);
            cq.eq("siteId",siteId);
            cq.eq("userId",userId);
            cq.add();
            List<SitePermissionsEntity> sitePermissionsList = commonService.getListByCriteriaQuery(cq,
                    false);
            if(sitePermissionsList!=null && sitePermissionsList.size()>0){
               commonService.delete(sitePermissionsList.get(0));
                TSUser user = commonService.getEntity(TSUser.class,userId);
                if(user!=null){
                    user.setAuthentication(null);
                    commonService.save(user);
                    return user;
                }
            }
        }
        return null;
    }
}
