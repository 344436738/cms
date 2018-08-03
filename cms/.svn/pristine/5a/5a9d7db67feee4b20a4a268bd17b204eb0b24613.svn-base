package com.leimingtech.member.security;

import com.leimingtech.base.entity.Principal;
import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.util.MemberUtils;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.member.common.config.Global;
import com.leimingtech.member.common.security.shiro.session.SessionDAO;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.PostConstruct;
import java.util.Collection;

public class MyRealm  extends AuthorizingRealm {

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
            Collection<Session> sessions = sessionDAO.getActiveSessions(true, principal, MemberUtils.getSession());
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

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        return  info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        MemberEntity member= MemberUtils.getUserByLoginName(token.getUsername());
        if (member != null) {
            Principal principal = new Principal(member.getId(), member.getUsername(), member.getRealname());
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, member.getPassword(), getName());
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
