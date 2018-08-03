package com.leimingtech.member.security;

import com.leimingtech.common.utils.PasswordUtil;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;


/**
 * 自定义shiro验证时使用的加密算法
 */
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {

    public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {

        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        Object tokenCredentials = encrypt(token);
        Object accountCredentials = getCredentials(info);//数据库密码
        //将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false
        return equals(tokenCredentials, accountCredentials);
    }

    private String encrypt(UsernamePasswordToken token) {
        String password = PasswordUtil.encrypt(token.getUsername().toLowerCase(), String.valueOf(token.getPassword()),
                PasswordUtil.getStaticSalt());
        return password;

    }
}
