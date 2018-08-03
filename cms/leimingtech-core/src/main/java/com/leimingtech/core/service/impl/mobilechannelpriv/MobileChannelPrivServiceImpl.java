package com.leimingtech.core.service.impl.mobilechannelpriv;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.MobileChannelEntity;
import com.leimingtech.base.entity.temp.MobileChannelPrivEntity;
import com.leimingtech.base.entity.temp.TSRole;
import com.leimingtech.core.service.mobilechannelpriv.MobileChannelPrivServiceI;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.core.service.CommonService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leimingtech.core.service.MobileChannelServiceI;
import com.leimingtech.core.service.SiteServiceI;
import com.leimingtech.core.service.impl.CommonServiceImpl;

@Service("mobileChannelPrivService")
@Transactional
public class MobileChannelPrivServiceImpl extends CommonServiceImpl implements MobileChannelPrivServiceI {


	/**站点管理接口*/
	@Autowired
	private SiteServiceI siteService;
	/**移动频道管理接口*/
	@Autowired
	private MobileChannelServiceI mobileChannelService;
	@Autowired
	private CommonService commonService;

	@Override
	public JSONArray loadMobileChannelTree(String roleId) {

		List<MobileChannelPrivEntity> mobileChannelPrivList = findByProperty(MobileChannelPrivEntity.class, "TSRole.id", roleId);
		Set<String> set = new HashSet<String>();
		for(MobileChannelPrivEntity mobileChannelPriv:mobileChannelPrivList){
			if(null!=mobileChannelPriv){
				set.add(String.valueOf(mobileChannelPriv.getMobileChannelEntity().getId()));
			}
		}

		/*List<SiteEntity> sites = siteService.siteList();
		JSONArray sitesJsonArray=new JSONArray();
		for (SiteEntity site : sites) {
			JSONObject sitejsonObject = new JSONObject();
			sitejsonObject.put("id","");
			sitejsonObject.put("name", site.getSiteName());
			sitejsonObject.put("open", true);
			sitejsonObject.put("children",
					this.mobileChannelTree(set, site.getId(), roleId));
			sitejsonObject.put("checked", true);
			sitesJsonArray.add(sitejsonObject);
		}
*/
		JSONArray sitesJsonArray=new JSONArray();
		SiteEntity site = UserUtils.getSite();
		JSONObject sitejsonObject = new JSONObject();
		sitejsonObject.put("id","");
		sitejsonObject.put("name", site.getSiteName());
		sitejsonObject.put("open", true);
		sitejsonObject.put("children",
				this.mobileChannelTree(set, site.getId(), roleId));
		sitejsonObject.put("checked", true);
		sitesJsonArray.add(sitejsonObject);
		return sitesJsonArray;
	}

	/**
	 * 获取指定站点中的栏目
	 *
	 * @param set
	 * @param siteid
	 * @param roleId
	 * @return
	 */
	private JSONArray mobileChannelTree(Set<String> set, String siteid,
										String roleId) {
		List<MobileChannelEntity> mobileChannelList = mobileChannelService
				.getRootMobileChannelBySite(siteid);// 根据站点获取一级频道列表
		JSONArray jsonArray = new JSONArray();
		for(MobileChannelEntity mobileChannel:mobileChannelList){
			JSONObject json = new JSONObject();
			//父节点
			if(mobileChannel.getLevels()==0){
				json.put("id",mobileChannel.getId());
				json.put("name", mobileChannel.getName());
				json.put("open", true);
				json.put("children",this.getChildren(set,mobileChannel,roleId));
				if(set.contains(String.valueOf(mobileChannel.getId()))){
					json.put("checked", true);
				}else{
					json.put("checked", false);
				}
				jsonArray.add(json);
			}
		}

		return jsonArray;
	}

	/**
	 * 子节点
	 * @param set
	 * @param contentCat
	 * @param roleId
	 * @return
	 */
	public JSONArray getChildren(Set<String> set,MobileChannelEntity mobileChannel,String roleId){
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		if(mobileChannel.getMobileChannels()==null||mobileChannel.getMobileChannels().size()==0){
			return jsonArray;
		}else{
			for(MobileChannelEntity mobileChannel1:mobileChannel.getMobileChannels()){
				json.put("id",mobileChannel1.getId());
				json.put("name", mobileChannel1.getName());
				json.put("open", true);
				json.put("children",this.getChildren(set,mobileChannel1,roleId));
				if(set.contains(String.valueOf(mobileChannel1.getId()))){
					json.put("checked", true);
				}else{
					json.put("checked", false);
				}
				jsonArray.add(json);
			}
		}
		return jsonArray;
	}
	@Override
	public void saveMobileChannelPriv(String roleId, String funVal) {
		MobileChannelPrivEntity mobileChannelPriv = new MobileChannelPrivEntity();
		String[] funValArray = funVal.split(",");

		TSRole role = getEntity(TSRole.class, roleId);
		List<MobileChannelPrivEntity> mobileChannelPrivList = findByProperty(MobileChannelPrivEntity.class, "TSRole.id", roleId);
		String flag = "";
		//当前角色没有栏目权限
		if(mobileChannelPrivList.size()==0){
			for(int i=0;i<funValArray.length;i++){
				String funValId = funValArray[i];
				if(com.leimingtech.common.utils.StringUtils.isEmpty(funValId)){
					continue;
				}
				mobileChannelPriv = new MobileChannelPrivEntity();
				mobileChannelPriv.setTSRole(role);//添加角色Id
				MobileChannelEntity mobileChannel = null;
				if(com.leimingtech.common.utils.StringUtils.isNotEmpty(funValId)){
					mobileChannel = getEntity(MobileChannelEntity.class, String.valueOf(funValId));
				}
				mobileChannelPriv.setMobileChannelEntity(mobileChannel);//添加栏目Id
				saveOrUpdate(mobileChannelPriv);
			}
		}else{
			for(int k=0;k<mobileChannelPrivList.size();k++){
				mobileChannelPriv = mobileChannelPrivList.get(k);
				String mobileChannelId = String.valueOf(mobileChannelPriv.getMobileChannelEntity().getId());
				flag += mobileChannelId+",";
				//去掉已勾选的项
				if(!funVal.contains(mobileChannelId)){
					delete(mobileChannelPriv);
				}
			}
			for(int i=0;i<funValArray.length;i++){
				String funValId = funValArray[i];
				if(com.leimingtech.common.utils.StringUtils.isEmpty(funValId)){
					continue;
				}
				if(!flag.contains(funValId)){
					mobileChannelPriv = new MobileChannelPrivEntity();
					mobileChannelPriv.setTSRole(role);//添加角色Id
					MobileChannelEntity mobileChannel = null;
					if(com.leimingtech.common.utils.StringUtils.isNotEmpty(funValId)){
						mobileChannel = getEntity(MobileChannelEntity.class, String.valueOf(funValId));
					}
					mobileChannelPriv.setMobileChannelEntity(mobileChannel);//添加栏目Id
					saveOrUpdate(mobileChannelPriv);
				}
			}
		}
	}

	/**
	 * 删除角色下的全部移动栏目权限
	 *
	 * @param roleId 角色id
	 * @return
	 */
	@Override
	public int deleteByRoleId(String roleId) {
		return this.commonService.executeSql(" delete from cm_mobile_channel_priv where roleid = ?  ", roleId);
	}

	/**
	 * 获取用户下拥有的移动频道数据
	 *
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public List<String> getMobileChannelIdListByUserId(String userId) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select channelid from cm_mobile_channel_priv ");
		sql.append(" where roleid in (select ru.roleid from  cms_role_user ru where ru.userid = ? ) ");
		sql.append(" group by channelid ");
		List<String> mobileChannelIdList = this.commonService.findForList(sql.toString(), String.class, userId);
		return mobileChannelIdList;
	}
}