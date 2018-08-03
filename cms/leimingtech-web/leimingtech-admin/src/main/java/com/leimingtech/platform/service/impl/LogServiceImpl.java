package com.leimingtech.platform.service.impl;

import java.util.List;
import java.util.Map;

import com.leimingtech.core.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.base.entity.temp.TSLog;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.platform.service.LogService;

/**
 * 
 * @author
 * 
 */
@Service("logService")
@Transactional
public class LogServiceImpl implements LogService {


	@Autowired
	private CommonService commonService;

	/**
	 * 根据id获取log
	 *
	 * @param id
	 * @return
	 */
	@Override
	public TSLog getEntity(String id) {
		return commonService.getEntity(TSLog.class, id);
	}

	/**
	 * 删除一条日志
	 *
	 * @param tslog
	 */
	@Override
	public void delete(TSLog tslog) {
		commonService.delete(tslog);
	}

	/**
	 * 获取日志总数
	 *
	 * @return
	 */
	@Override
	public Long getLogCount() {
		String sql = " SELECT COUNT(1) count FROM T_S_Log WHERE 1=1 ";
		Map<String,Object> result=commonService.findOneForJdbc(sql);
		return StringUtils.toLong(result.get("count").toString());
	}

	@Override
	public List findByQueryString() {
		String sql="SELECT broswer ,count(broswer) FROM TSLog group by broswer";
		return commonService.findByQueryString(sql);
	}

	@Override
	public PageList getPageList(int pageSize,int pageNo,TSLog logs,Map param) {

		CriteriaQuery cq = new CriteriaQuery(TSLog.class, pageSize, pageNo, "", "");

		HqlGenerateUtil.installHql(cq, logs, param);

		cq.addOrder("operatetime", SortDirection.desc);
		cq.add();

		return commonService.getPageList(cq, true);
	}

}
