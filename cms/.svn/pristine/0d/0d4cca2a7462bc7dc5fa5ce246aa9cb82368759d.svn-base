package com.leimingtech.cms.service.impl.accessstatistics;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.cms.entity.sinotransstats.StatsParments;
import com.leimingtech.cms.service.accessstatistics.AccessStatistiscsServiceI;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.ContentCatServiceI;
import com.leimingtech.core.util.DBTypeUtil;
import com.leimingtech.core.util.UserUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 统计pv/uv/ip接口实现
 * @author
 * @date 2017-04-11 16:54:02
 * @version V1.0
 *
 */
@Service("accessStatistiscsService")
@Transactional
public class AccessAtatisticsServiceImpl implements AccessStatistiscsServiceI {

	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	@Autowired
	private ContentCatServiceI contentCatService;


	/**
	 * 获取分页后的统计pv/uv/ip数据集
	 *
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 *            每页获取数量
	 *            当前页码
	 * @param siteId
	 * @param catId
	 */
	@Override
	public Map<String, Object> getPageList(String siteId,String catId) {

		if(StringUtils.isEmpty(siteId)){
			siteId = UserUtils.getSiteId();
		}

//		String sql="select site_name sitename,cat_name catname,create_time createtime from cms_sinotrans_stats ";
//		sql = getSqlParment(sql,siteId,catId,mark);
//		List<Map<String, Object>> sinotransStatsEntityList = commonService.findForJdbc(sql,pageNo,pageSize);
//		m.put("sinotransStatsList",sinotransStatsEntityList);


		String mapNumSql = "select COUNT(*) pv,COUNT(DISTINCT(ip)) uv,COUNT(ip) ip from cms_sinotrans_stats where site_id='"+siteId+"'";
		String addSql = "";
		if(StringUtils.isNotEmpty(catId)){
			addSql+="  and pathids like '%,"+catId+",%'";
			mapNumSql = mapNumSql+addSql;
		}

		List<SiteEntity>siteEntityList = commonService.getList(SiteEntity.class);
		List<ContentCatEntity> catEntityList = contentCatService.getOpenRootContentCat(siteId);
		Map<String, Object> m = new HashMap<String, Object>();
		StatsParments statsParments = getShowParment(mapNumSql,siteId,catId);
		m.put("statsParments",statsParments);
		m.put("catId",catId);
		m.put("siteEntityList",siteEntityList);
		m.put("catEntityList",catEntityList);
		return m;
	}

	private StatsParments getShowParment(String mapNumSql, String siteId, String catId) {
		String dbType = DBTypeUtil.getDBType();
		StatsParments stats = new StatsParments();
		List<Map<String, Object>> dayMapList = getDay(mapNumSql,dbType);
		List<Map<String, Object>> monthMapList = getmonth(mapNumSql,dbType);
		List<Map<String, Object>> halfYearMapList = getHalfYear(mapNumSql,dbType);
		List<Map<String, Object>> weekMapList = getweek(mapNumSql,dbType);
		List<Map<String, Object>> yearMapList = getyear(mapNumSql,dbType);
		List<Map<String, Object>> quarterMapList = getQuarter(mapNumSql,dbType);
		List<Map<String, Object>> allMapList = getall(mapNumSql,dbType);
		stats.setDayIp(dayMapList.get(0).get("ip").toString());
		stats.setDayPv(dayMapList.get(0).get("pv").toString());
		stats.setDayUv(dayMapList.get(0).get("uv").toString());
		stats.setMonthIp(monthMapList.get(0).get("ip").toString());
		stats.setMonthPv(monthMapList.get(0).get("pv").toString());
		stats.setMonthUv(monthMapList.get(0).get("uv").toString());
		stats.setHalfYearIp(halfYearMapList.get(0).get("ip").toString());
		stats.setHalfYearPv(halfYearMapList.get(0).get("pv").toString());
		stats.setHalfYearUv(halfYearMapList.get(0).get("uv").toString());
		stats.setQuarterIp(quarterMapList.get(0).get("ip").toString());
		stats.setQuarterPv(quarterMapList.get(0).get("pv").toString());
		stats.setQuarterUv(quarterMapList.get(0).get("uv").toString());
		stats.setYrarPv(yearMapList.get(0).get("pv").toString());
		stats.setYrarIp(yearMapList.get(0).get("ip").toString());
		stats.setYrarUv(yearMapList.get(0).get("uv").toString());
		stats.setHalfYearPv(yearMapList.get(0).get("pv").toString());
		stats.setWeekIp(weekMapList.get(0).get("ip").toString());
		stats.setWeekPv(weekMapList.get(0).get("pv").toString());
		stats.setWeekUv(weekMapList.get(0).get("uv").toString());
		stats.setIp(allMapList.get(0).get("ip").toString());
		stats.setPv(allMapList.get(0).get("pv").toString());
		stats.setUv(allMapList.get(0).get("uv").toString());
		return stats;
	}

	private List<Map<String,Object>> getall(String mapNumSql,String dbType) {

		return  commonService.findForJdbc(mapNumSql);
	}

	/**
	 * 本季度
	 * @param mapNumSql
	 * @param dbType
	 * @return
	 */
	private List<Map<String,Object>> getQuarter(String mapNumSql,String dbType) {
		String addSql = "";
		if(dbType.equals("mysql")){
			addSql = " and QUARTER(create_time)=QUARTER(now()) ";
		}else if(dbType.equals("oracle")){
			addSql = " and to_char(create_time,'q')=to_char(sysdate,'q') ";
		}
		mapNumSql = mapNumSql+addSql;
		return  commonService.findForJdbc(mapNumSql);
	}
	/**
	 * 本年
	 * @param mapNumSql
	 * @param dbType
	 * @return
	 */
	private List<Map<String,Object>> getyear(String mapNumSql,String dbType) {
		String addSql = "";
		if(dbType.equals("mysql")){
			addSql = " and YEAR(create_time)=YEAR(NOW())";
		}else if(dbType.equals("oracle")){
			addSql = " and to_char(create_time,'yyyy')=to_char(sysdate,'yyyy') ";
		}
		mapNumSql = mapNumSql+addSql;
		return  commonService.findForJdbc(mapNumSql);
	}
	/**
	 * 本周
	 * @param mapNumSql
	 * @param dbType
	 * @return
	 */
	private List<Map<String,Object>> getweek(String mapNumSql,String dbType) {
		String addSql = "";
		if(dbType.equals("mysql")){
			addSql = " and YEARWEEK(date_format(create_time,'%Y-%m-%d')) = YEARWEEK(now()) ";
		}else if(dbType.equals("oracle")){
			addSql = " and to_char(create_time,'iw')=to_char(sysdate,'iw') ";
		}
		mapNumSql = mapNumSql+addSql;
		return  commonService.findForJdbc(mapNumSql);
	}
	/**
	 * 半年
	 * @param mapNumSql
	 * @param dbType
	 * @return
	 */
	private List<Map<String,Object>> getHalfYear(String mapNumSql,String dbType) {
		String addSql = "";
		if(dbType.equals("mysql")){
			addSql = " and create_time between date_sub(now(),interval 6 month) and now() ";
		}else if(dbType.equals("oracle")){
			addSql = " and to_char(create_time,'yyyymm') >=to_char(sysdate-189,'yyyymm') and  to_char(create_time,'yyyymm') <=to_char(sysdate,'yyyymm') ";
		}
		mapNumSql = mapNumSql+addSql;
		return  commonService.findForJdbc(mapNumSql);
	}
	/**
	 * 本月
	 * @param mapNumSql
	 * @param dbType
	 * @return
	 */
	private List<Map<String,Object>> getmonth(String mapNumSql,String dbType) {
		String addSql = "";
		if(dbType.equals("mysql")){
			addSql = " and DATE_FORMAT( create_time, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' ) ";
		}else if(dbType.equals("oracle")){
			addSql = " and to_char(create_time,'mm')=to_char(sysdate,'mm') ";
		}
		mapNumSql = mapNumSql+addSql;
		return  commonService.findForJdbc(mapNumSql);
	}

	/**
	 * 今日
	 * @param mapNumSql
	 * @param dbType
     * @return
     */
	private List<Map<String,Object>> getDay(String mapNumSql,String dbType) {
		String addsql = "";
		if(dbType.equals("mysql")){
			addsql+=" and to_days(create_time) = to_days(now()) ";
		}else if(dbType.equals("oracle")){
			addsql+=" and to_char(create_time,'dd')=to_char(sysdate,'dd') ";
		}
		mapNumSql= mapNumSql+addsql;
		return commonService.findForJdbc(mapNumSql);
	}


	/**
	 *
	 * @param sql
	 * @param siteId
	 * @param catId
	 * @param mark
     * @return
     */
	private String getSqlParment(String sql,String siteId, String catId, String mark) {
		String dbType = DBTypeUtil.getDBType();//数据库类型
		String addsql="";
		if(dbType.equals("mysql")){
			addsql+="where site_id = '"+siteId+"'";
			if("1".equals(mark)){//今日
				addsql+=" and to_days(create_time) = to_days(now()) ";
			}
			if("2".equals(mark)){//本周
				addsql+=" and YEARWEEK(date_format(create_time,'%Y-%m-%d')) = YEARWEEK(now()) ";
			}
			if("3".equals(mark)){//本月
				addsql+=" and DATE_FORMAT( create_time, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' ) ";
			}
			if("4".equals(mark)){//本季度
				addsql+=" and QUARTER(create_time)=QUARTER(now()) ";
			}
			if("5".equals(mark)){//半年（矩当前时间前六月的数据）
				addsql+=" and create_time between date_sub(now(),interval 6 month) and now() ";
			}
			if("6".equals(mark)){//本年
				addsql+=" and YEAR(create_time)=YEAR(NOW()) ";
			}
			if(StringUtils.isNotEmpty(catId)){
				addsql+="  and FIND_IN_SET('"+catId+"',pathids)";
			}
			addsql+=" ORDER BY create_time DESC";
		}else if (dbType.equals("oracle")){
			addsql+="where site_id = '"+siteId+"'";
			if("1".equals(mark)){//今日
				addsql+=" and to_char(create_time,'dd')=to_char(sysdate,'dd') ";
			}
			if("2".equals(mark)){//本周
				addsql+=" and to_char(create_time,'iw')=to_char(sysdate,'iw') ";
			}
			if("3".equals(mark)){//本月
				addsql+=" and to_char(create_time,'mm')=to_char(sysdate,'mm') ";
			}
			if("4".equals(mark)){//本季度
				addsql+=" and to_char(create_time,'q')=to_char(sysdate,'q') ";
			}
			if("5".equals(mark)){//半年
				addsql+=" and to_char(create_time,'yyyymm') >=to_char(sysdate-189,'yyyymm') and  to_char(create_time,'yyyymm') <=to_char(sysdate,'yyyymm') " ;
			}
			if("6".equals(mark)){//本年
				addsql+=" and to_char(create_time,'yyyy')=to_char(sysdate,'yyyy') ";
			}
			if(StringUtils.isNotEmpty(catId)){
				addsql+="  and pathids like '%,"+catId+",%'";
			}
			addsql+=" ORDER BY create_time DESC";
		}
		return sql+addsql;
	}


}