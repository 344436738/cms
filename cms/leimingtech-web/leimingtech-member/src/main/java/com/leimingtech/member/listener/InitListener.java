package com.leimingtech.member.listener;

import com.leimingtech.common.Globals;

import javax.servlet.ServletContextEvent;

/**
 * Created by liuzhen on 2017/5/6.
 */
public class InitListener implements javax.servlet.ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        Globals.CONTEXTPATH = servletContextEvent.getServletContext().getContextPath();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
