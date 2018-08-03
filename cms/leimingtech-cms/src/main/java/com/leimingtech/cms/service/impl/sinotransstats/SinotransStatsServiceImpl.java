package com.leimingtech.cms.service.impl.sinotransstats;

import com.leimingtech.cms.entity.sinotransstats.SinotransStatsEntity;
import com.leimingtech.cms.service.sinotransstats.SinotransStatsServiceI;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.member.MemberEntity;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.MemberServiceI;
import com.leimingtech.core.util.IpUtil;
import com.leimingtech.core.util.LogUtil;
import com.leimingtech.core.util.http.httpUtils;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Title: interface
 * @Description: 统计pv/uv/ip接口实现
 * @author
 * @date 2017-04-11 16:54:02
 * @version V1.0
 *
 */
@Service("sinotransStatsService")
@Transactional
public class SinotransStatsServiceImpl implements SinotransStatsServiceI {

	private static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	@Autowired
	private MemberServiceI memberServiceI;

	/**
	 * 通过ip和ak用百度api接口定位
	 * @param ip
	 * @return
	 */
	@Override
	public JSONObject getJson(String ip) {
		String ak= "nykDgtwG0chB8rMmRcOtMQEvmO7eRw3X";
		ip = "222.128.107.239";
		//返回的json对象
		JSONObject responseBody = null;
		String jsonStr = httpUtils.sendGet("http://api.map.baidu.com/location/ip","ak="+ak+"&ip="+ip+"");
		responseBody = JSONObject.fromObject(jsonStr);
		if(responseBody.getString("status").equals("200")){
			String message = "百度地图接口调用失败---ak校验失败";
			LogUtil.info(message);
			return null;
		}else if(responseBody.getString("status").equals("0")){
			JSONObject content = (JSONObject) responseBody.get("content");
			if(content!=null){
				String message = "百度地图接口调用正常";
				LogUtil.info(message);
				JSONObject address = content.getJSONObject("address_detail");
				return address;
			}
		}else if(responseBody.getString("status").equals("210")){
			String message = "百度地图接口调用失败---ip校验失败,需要填写IP白名单";
			LogUtil.info(message);
			return null;
		}else{
			String message = "百度地图接口调用失败---服务器内部错误";
			LogUtil.info(message);
			return null;
		}
		return null;
	}

	/**
	 * 网站统计
	 * @param url
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
	 * @return
	 * @throws ParseException
	 */
	@Override
	public boolean saveStats(String url, String platform, String language, String browserName,
							 String screen, String javaEnabled, String refeUrl, String colorDepth,
							 String ckeTrue, String flashTrue, String flashVersions, String contentId,
							 String siteId, String contentCatId) throws ParseException {
		HttpServletRequest request = ContextHolderUtils.getRequest();
		Calendar now = Calendar.getInstance();
		String ip = IpUtil.getIpAddr(request);
		JSONObject jsonObject = getJson(ip);
		Date date = new Date();
		String dataTime = null;
		if(StringUtils.isNotEmpty(ip) && StringUtils.isNotEmpty(siteId)){
			SinotransStatsEntity stats = new SinotransStatsEntity();
			if(StringUtils.isNotEmpty(ip)){stats.setIp(ip);}
			if(StringUtils.isNotEmpty(siteId)){
				stats.setSiteId(siteId);
				SiteEntity siteEntity = commonService.getEntity(SiteEntity.class,siteId);
				stats.setSitename(siteEntity.getSiteName());
			}
			if(StringUtils.isNotEmpty(url)){stats.setUrl(url);}
			if(StringUtils.isNotEmpty(contentId)){stats.setContentId(contentId);}
			if(StringUtils.isNotEmpty(browserName)){stats.setBrowser(browserName);}
			if(StringUtils.isNotEmpty(contentCatId)){
				stats.setCatId(contentCatId);
				ContentCatEntity catEntity = commonService.getEntity(ContentCatEntity.class,contentCatId);
				stats.setCatName(catEntity.getName());
				stats.setPathids(catEntity.getParentids());
			}
			if(StringUtils.isNotEmpty(colorDepth)){stats.setColorDepth(colorDepth);}
			if(StringUtils.isNotEmpty(screen)){stats.setScreen(screen);}
			if(StringUtils.isNotEmpty(platform)){stats.setOs(platform);}
			if(StringUtils.isNotEmpty(flashVersions)){stats.setFlashVersion(Integer.valueOf(flashVersions));}
			if(StringUtils.isNotEmpty(jsonObject.getString("district"))){stats.setCounty(jsonObject.getString("district"));}
			if(StringUtils.isNotEmpty(language)){stats.setLanguage(language);}
			stats.setCityCode(Integer.valueOf(jsonObject.getString("city_code")));
			stats.setCity(jsonObject.getString("city"));
			stats.setProvince(jsonObject.getString("province"));
			dataTime = SIMPLE_DATE_FORMAT.format(date);
			stats.setCreateTime(SIMPLE_DATE_FORMAT.parse(dataTime));
			stats.setDateYyyy(now.get(Calendar.YEAR));
			stats.setDateMinute(now.get(Calendar.MINUTE));
			stats.setDateDd(now.get(Calendar.DAY_OF_MONTH));
			stats.setDateMm(Integer.valueOf((now.get(Calendar.MONTH) + 1)+""));
			stats.setDateHh(now.get(Calendar.HOUR_OF_DAY));
			stats.setDateSs( now.get(Calendar.SECOND));
			if(StringUtils.isNotEmpty(ckeTrue)){
				if(!"flase".equals(ckeTrue)){stats.setCookieEnabled(1);}
			}
			if("1".equals(flashTrue)){stats.setFlashEnabled(1);}
			if("true".equals(javaEnabled)){stats.setJavaEnabled(1);}
			MemberEntity member = memberServiceI.getSessionMember();
			if(member!=null){
				stats.setUserId(member.getId());
			}
			commonService.save(stats);
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		//获取调用百度地图密钥
//			PropertiesUtil p = new PropertiesUtil("sysConfig.properties");
//			String ak = p.readProperty("lmcms.baidu.ak");
//			System.out.println(ak);
	}
}