package com.leimingtech.cms.service.sinotransstats;

import java.text.ParseException;
import java.util.Map;

import com.leimingtech.cms.entity.sinotransstats.SinotransStatsEntity;
import net.sf.json.JSONObject;

/**
 * @Title: interface
 * @Description: 统计pv/uv/ip接口
 * @author
 * @date 2017-04-11 16:54:02
 * @version V1.0
 *
 */
public interface SinotransStatsServiceI {

	/**
	 * 通过ip和ak用百度api接口定位
	 * @param ip
	 * @return
	 */
	JSONObject getJson(String ip);

	/**
	 *  @param url
	 * @param platform
	 * @param language
	 * @param browserName
	 * @param screen
	 * @param javaEnabled
	 * @param refeUrl
	 * @param colorDepth
	 * @param ckeTrue
	 * @param flashTrue
	 * @param flashVersions
	 * @param contentId
	 * @param siteId
	 * @param contentCatId
	 */
	boolean saveStats(String url, String platform, String language, String browserName, String screen, String javaEnabled, String refeUrl, String colorDepth, String ckeTrue, String flashTrue, String flashVersions, String contentId, String siteId, String contentCatId) throws ParseException;
}
