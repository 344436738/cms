package com.leimingtech.core.dao;


import com.leimingtech.base.entity.temp.*;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
public interface ICommonDao extends IGenericBaseCommonDao{



	/**
	 * admin账户密码初始化
	 * @param user
	 */
	public void pwdInit(TSUser user, String newPwd);

	/**
	 * 获取用户的角色列表
	 * @param userId 用户id
	 * @return
	 */
	List<TSRole> getUserRole(String userId);

	/**
	 * 文件上传或预览
	 * @param uploadFile
	 * @return
	 */
	public HttpServletResponse viewOrDownloadFile(UploadFile uploadFile);

	public Map<Object,Object> getDataSourceMap(Template template);
	/**
	 * 生成XML文件
	 * @param fileName XML全路径
	 */
	public HttpServletResponse createXml(ImportFile importFile);
	/**
	 * 解析XML文件
	 * @param fileName XML全路径
	 */
	public void parserXml(String fileName);
}

