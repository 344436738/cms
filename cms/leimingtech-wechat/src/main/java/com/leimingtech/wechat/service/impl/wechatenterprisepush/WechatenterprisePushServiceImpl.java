package com.leimingtech.wechat.service.impl.wechatenterprisepush;

import java.util.*;

import com.leimingtech.common.hibernate.SortDirection;
import com.leimingtech.base.entity.site.SiteEntity;

import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.wechat.entity.wechatenterpriseconfig.WechatEnterpriseConfigEntity;
import com.leimingtech.wechat.entity.wechatenterprisecontent.WechatEnterpriseContentEntity;
import com.leimingtech.wechat.service.wechatenterpriseconfig.WechatEnterpriseConfigServiceI;
import com.leimingtech.wechat.service.wechatenterprisecontent.WechatEnterpriseContentServiceI;
import com.leimingtech.wechat.util.WechatEnterpriseRequestUtil;
import me.chanjar.weixin.mp.bean.result.wechatpushnews.WechatPushNews;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.wechat.entity.wechatenterprisepush.WechatenterprisePushEntity;
import com.leimingtech.wechat.service.wechatenterprisepush.WechatenterprisePushServiceI;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;

/**
 * @Title: interface
 * @Description: 企业号推送接口实现
 * @author
 * @date 2017-03-28 16:16:57
 * @version V1.0
 * 
 */
@Service("wechatenterprisePushService")
@Transactional
public class WechatenterprisePushServiceImpl implements WechatenterprisePushServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	@Autowired
	WechatEnterpriseConfigServiceI wechatEnterpriseConfigServiceI;
	@Autowired
	WechatEnterpriseContentServiceI wechatEnterpriseContentServiceI;
	@Autowired
	WechatEnterpriseConfigServiceI wechatEnterpriseConfigService;
	/**
	 * 保存企业号推送
	 * 
	 * @param wechatenterprisePush
	 * @return
	 */
	public java.lang.String save(WechatenterprisePushEntity wechatenterprisePush) {



		return (java.lang.String) commonService.save(wechatenterprisePush);
	}

	/**
	 * 更新企业号推送
	 * 
	 * @param wechatenterprisePush
	 */
	@Override
	public void saveOrUpdate(WechatenterprisePushEntity wechatenterprisePush) {
		commonService.saveOrUpdate(wechatenterprisePush);
	}

	/**
	 * 通过id获取企业号推送
	 * 
	 * @param id
	 *            企业号推送id
	 * @return
	 */
	@Override
	public WechatenterprisePushEntity getEntity(java.lang.String id) {
		return commonService.getEntity(WechatenterprisePushEntity.class, id);
	}

	/**
	 * 获取分页后的企业号推送数据集
	 * 
	 * @param wechatenterprisePush
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return wechatenterprisePushList企业号推送数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(WechatenterprisePushEntity wechatenterprisePush, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(WechatenterprisePushEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, wechatenterprisePush, param);
		cq.addOrder("createTime", SortDirection.desc);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<WechatenterprisePushEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("wechatenterprisePushList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除企业号推送
	 * 
	 * @param wechatenterprisePush
	 */
	@Override
	public void delete(WechatenterprisePushEntity wechatenterprisePush) {
		List<WechatEnterpriseContentEntity> wechatEnterpriseContentEntityList = commonService.findByProperty(WechatEnterpriseContentEntity.class,"pushId",wechatenterprisePush.getId());
		commonService.deleteAllEntitie(wechatEnterpriseContentEntityList);
		commonService.delete(wechatenterprisePush);
	}

	/**
	 * 推送消息
	 * @param pushId
	 * @return
     */
	@Override
	public boolean pushContents(String pushId) {
		String url = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=ACCESS_TOKEN";
		WechatenterprisePushEntity wechatenterprisePush = commonService.get(WechatenterprisePushEntity.class,pushId);
		WechatEnterpriseConfigEntity wechatEnterpriseConfig = commonService.get(WechatEnterpriseConfigEntity.class,wechatenterprisePush.getEnterpriseConfigId());
		List<WechatEnterpriseContentEntity> wechatEnterpriseContentList = commonService.findByProperty(WechatEnterpriseContentEntity.class,"pushId",pushId);
		if(wechatEnterpriseContentList!=null && wechatEnterpriseContentList.size()>0){
			String replceTag = "@all";
			if(StringUtils.isNotEmpty(wechatenterprisePush.getToTagList()) && !wechatenterprisePush.getToTagList().equals("@ll")){
				replceTag = wechatenterprisePush.getToTagList().replaceAll(",","/");
				replceTag = replceTag.substring(0,replceTag.length()-1);
			}
			List<WechatPushNews> list = new ArrayList<>();
			for(WechatEnterpriseContentEntity wechatEnterpriseContentEntity : wechatEnterpriseContentList){
				WechatPushNews wechatPushNews = new WechatPushNews();
				wechatPushNews.setTitle(wechatEnterpriseContentEntity.getTitle());
				wechatPushNews.setDescription(wechatEnterpriseContentEntity.getDescription());
				wechatPushNews.setUrl(wechatEnterpriseContentEntity.getUrl());
				wechatPushNews.setPicurl(wechatEnterpriseContentEntity.getPicurl());
				list.add(wechatPushNews);
			}

			 String touser = "@all";  String toparty ="@all";  String totag = replceTag;
			 String agentid = wechatEnterpriseConfig.getAgentid();

			String articlesList = JSONArray.fromObject(list).toString();

			//此格式化方法为发送news类型数据
			String postData = WechatEnterpriseRequestUtil.SNewsMsg(touser,toparty,totag,agentid,articlesList);
			String accessToken = wechatEnterpriseConfigServiceI.accessToke(wechatEnterpriseConfig.getId());
			if(StringUtils.isNotEmpty(accessToken)){
				int flag = WechatEnterpriseRequestUtil.PostMessage(wechatEnterpriseConfig.getAccessToken(),"POST",url,postData);
				if(flag==0){
					wechatenterprisePush.setIsSuccess("1");
					wechatenterprisePush.setCreateTime(new Date());
					commonService.save(wechatenterprisePush);
					return true;
				}else{
					return false;
				}
			}
		}else{
			return false;
		}

		return false;
	}

	/**
	 * 获取全部企业号
	 * @return
     */
	@Override
	public List<WechatEnterpriseConfigEntity> getConfigList() {
		List<WechatEnterpriseConfigEntity> wechatEnterpriseConfigEntityList = commonService.getList(WechatEnterpriseConfigEntity.class);
		return wechatEnterpriseConfigEntityList;
	}

	/**
	 * 保存推送消息
	 * @param contentId
	 * @param tagList
	 * @param contentIds
	 * @param title
	 * @param enterpriseCorpId
	 * @param enterprisePushId
	 * @param author
	 * @param description
     * @param url
     * @param picurl
     * @param catId
     */
	@Override
	public String save(String[] contentId, String tagList, String[] contentIds, String[] title, String enterpriseCorpId, String enterprisePushId, String[] author, String[] description, String[] url, String[] picurl, String[] catId) {
				SiteEntity site = UserUtils.getSite();
				String domain = site.getProtocol() + site.getDomain();
				String userName = UserUtils.getUser().getUserName();
				String siteId = UserUtils.getSiteId();
				WechatenterprisePushEntity wechatenterprisePush=null;
				String pushContentTitle = null;
				if (StringUtils.isNotEmpty(enterprisePushId)) {
						for (int i = 0; i < title.length; i++) {
							WechatEnterpriseContentEntity wechatEnterpriseContent = null;
							if (StringUtils.isNotEmpty(contentId[i])) {
								wechatEnterpriseContent = wechatEnterpriseContentServiceI.getEntity(contentId[i]);
							}
							wechatenterprisePush = this.getEntity(enterprisePushId);
							wechatenterprisePush.setEnterpriseConfigId(enterpriseCorpId);
							WechatEnterpriseConfigEntity wechatEnterpriseConfig = wechatEnterpriseConfigService.getEntity(enterpriseCorpId);
							wechatenterprisePush.setEnterpriseConfigName(wechatEnterpriseConfig.getCorpName());
							wechatenterprisePush.setToTagList(tagList);
							this.saveOrUpdate(wechatenterprisePush);
							if (wechatEnterpriseContent == null) {
								wechatEnterpriseContent = new WechatEnterpriseContentEntity();
								wechatEnterpriseContent.setSiteId(siteId);
								wechatEnterpriseContent.setCreatetime(new Date());
								wechatEnterpriseContent.setAuthor(userName);
							}
							wechatEnterpriseContent.setCatId(catId[i]);
							wechatEnterpriseContent.setContentId(contentIds[i]);
							wechatEnterpriseContent.setTitle(title[i]);
							wechatEnterpriseContent.setConfigId(enterpriseCorpId);
							if(url[i].startsWith("http")){
								wechatEnterpriseContent.setUrl(url[i]);
							}else{
								wechatEnterpriseContent.setUrl(domain+url[i]);
							}
							if(picurl[i].startsWith("http")){
								wechatEnterpriseContent.setPicurl(picurl[i]);
							}else{
								wechatEnterpriseContent.setPicurl(domain+picurl[i]);
							}
							wechatEnterpriseContent.setDescription(description[i]);
							wechatEnterpriseContent.setPushId(enterprisePushId);
							wechatEnterpriseContent.setAuthor(author[i]);
							wechatEnterpriseContentServiceI.saveOrUpdate(wechatEnterpriseContent);
							return wechatenterprisePush.getId();
						}

				}else{

						WechatEnterpriseConfigEntity wechatEnterpriseConfigEntity = wechatEnterpriseConfigService.getEntity(enterpriseCorpId);
						wechatenterprisePush = new WechatenterprisePushEntity();
						wechatenterprisePush.setSiteId(siteId);
						wechatenterprisePush.setCreateBy(userName);
						wechatenterprisePush.setEnterpriseConfigId(enterpriseCorpId);
						WechatEnterpriseConfigEntity wechatEnterpriseConfig = wechatEnterpriseConfigService.getEntity(enterpriseCorpId);
						wechatenterprisePush.setEnterpriseConfigName(wechatEnterpriseConfig.getCorpName());
						wechatenterprisePush.setMsgType("news");
						wechatenterprisePush.setToTagList(tagList);
						wechatenterprisePush.setAgentId(wechatEnterpriseConfigEntity.getCorpId());
						wechatenterprisePush.setEnterpriseConfigName(wechatEnterpriseConfigEntity.getCorpName());

						this.save(wechatenterprisePush);
						for (int i = 0; i < title.length; i++) {

							pushContentTitle = title[i];

							WechatEnterpriseContentEntity wechatEnterpriseContent = null;
							if (StringUtils.isNotEmpty(contentId[i])) {

								wechatEnterpriseContent = wechatEnterpriseContentServiceI.getEntity(contentId[i]);
							}
							if (wechatEnterpriseContent == null) {
								wechatEnterpriseContent = new WechatEnterpriseContentEntity();
								wechatEnterpriseContent.setSiteId(siteId);
								wechatEnterpriseContent.setCreatetime(new Date());
								wechatEnterpriseContent.setAuthor(userName);
							}
							wechatEnterpriseContent.setCatId(catId[i]);
							wechatEnterpriseContent.setTitle(title[i]);
							wechatEnterpriseContent.setConfigId(enterpriseCorpId);
							if(url[i].startsWith("http")){
								wechatEnterpriseContent.setUrl(url[i]);
							}else{
								wechatEnterpriseContent.setUrl(domain+url[i]);
							}
							if(picurl[i].startsWith("http")){
								wechatEnterpriseContent.setPicurl(picurl[i]);
							}else{
								wechatEnterpriseContent.setPicurl(domain+picurl[i]);
							}
							wechatEnterpriseContent.setContentId(contentIds[i]);
							wechatEnterpriseContent.setDescription(description[i]);
							wechatEnterpriseContent.setPushId(wechatenterprisePush.getId());
							wechatEnterpriseContent.setAuthor(author[i]);
							wechatEnterpriseContentServiceI.save(wechatEnterpriseContent);

							//目前推送只能推送一片文章
							wechatenterprisePush.setPushContentTitle(pushContentTitle);
							this.save(wechatenterprisePush);
						}
					return wechatenterprisePush.getId();
				}
			return null;
	}


}