package com.leimingtech.common.utils;

/**
 * 数据库配置
 * Created by liuzhen on 2017/3/10.
 */
public class DBConfig {

    /**
     * 使用的数据库类型
     */
    public final static String DBTYPE;

    public final static String ORACLE = "oracle";
    public final static String MYSQL = "mysql";
    public final static String DB2 = "db2";
    public final static String POSTGRES = "postgres";
    public final static String SQLSERVER = "sqlserver";

    static {
        PropertiesUtil p = new PropertiesUtil("dbconfig.properties");

        DBTYPE = p.readProperty("jdbc.dbType");
    }
}
