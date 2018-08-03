package com.leimingtech.platform.security;

import com.leimingtech.base.entity.Principal;
import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.base.entity.temp.TSRole;
import com.leimingtech.base.entity.temp.TSUser;
import com.leimingtech.base.entity.vo.FunctionVOShow;
import com.leimingtech.common.utils.LogUtil;
import com.leimingtech.common.utils.StringUtils;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.service.UserService;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.util.constant.PersonnelStatusConstant;
import com.leimingtech.platform.common.config.Global;
import com.leimingtech.platform.common.security.shiro.session.SessionDAO;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import java.util.Collection;
import java.util.List;

/**
 * Created by gehanyang on 2016/1/18.
 */
public class MyRealm  extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    private String name = MyRealm.class.getSimpleName();

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Principal principal = (Principal) getAvailablePrincipal(principalCollection);

        // 获取当前已登录的用户
        if (!Global.TRUE.equals(Global.getConfig("user.multiAccountLogin"))) {
            SessionDAO sessionDAO = SpringContextHolder.getBean(SessionDAO.class);
            Collection<Session> sessions = sessionDAO.getActiveSessions(true, principal, UserUtils.getSession());
            if (sessions.size() > 0) {
                // 如果是登录进来的，则踢出已在线用户
                if (UserUtils.getSubject().isAuthenticated()) {
                    for (Session session : sessions) {
                        sessionDAO.delete(session);
                    }
                }
                // 记住我进来的，并且当前用户已登录，则退出当前用户提示信息。
                else {
                    UserUtils.getSubject().logout();
                    throw new AuthenticationException("msg:账号已在其它地方登录，请重新登录。");
                }
            }
        }

        List<TSRole> roleList=userService.getUserRole(principal.getId());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if (roleList != null && roleList.size() > 0) {
            for (int i = 0, length = roleList.size(); i < length; i++) {
                info.addRole(roleList.get(i).getRoleCode());
            }
        }

        int flag=UserUtils.getUser().getAuthentication();

        if(flag==PersonnelStatusConstant.ADMINISTRATOR_SUPER){
            info.addRole("ADMINISTRATOR_SUPER");//超级管理员
        }else if(flag==PersonnelStatusConstant.ADMINISTRATOR_SITE){
            info.addRole("ADMINISTRATOR_SITE");//站点管理员
        }else if(flag==PersonnelStatusConstant.ADMINISTRATOR_PLATFORM){
            info.addRole("ADMINISTRATOR_PLATFORM");//平台管理员
        }


        //当前用户拥有的按钮权限
        List<FunctionVOShow> functionList=UserUtils.getMenuList();
        if(functionList!=null && functionList.size() > 0){
            for (int i = 0, len = functionList.size(); i < len; i++) {
                FunctionVOShow function=functionList.get(i);
                if(StringUtils.isNotBlank(function.getPermission())){
                    info.addStringPermission(function.getPermission());
                }
            }
        }
        return  info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        TSUser user = UserUtils.getUserByLoginName(token.getUsername());
        if (user != null) {
            Principal principal = new Principal(user.getId(), user.getUserName(), user.getRealName());
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, user.getPassword(), getName());
            return info;
        } else {
            return null;
        }
    }

    @PostConstruct
    public void initCredentialsMatcher() {
        //该句作用是重写shiro的密码验证，让shiro用自己的验证
        setCredentialsMatcher(new CustomCredentialsMatcher());
    }
}
