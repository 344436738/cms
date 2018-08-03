package com.leimingtech.cms.tag.macrotag;

import com.leimingtech.cms.tag.base.BaseDirective;
import com.leimingtech.cms.tag.base.DirectiveHandler;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.StringUtils;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("catalog_Tag")
public class CatalogTag extends BaseDirective {

	private static final String PARAM_NAME_CATID = "id";
	private static final String PARAM_NAME_COUNT = "count";
	private static final String PARAM_NAME_LEVEL = "level";
	private static final String PARAM_NAME_LEVEL_ROOT = "root";
	private static final String PARAM_NAME_LEVEL_SELF = "self";
	private static final String PARAM_NAME_LEVEL_CURRENT = "current";
	private static final String PARAM_NAME_LEVEL_CHILD = "child";

	private static final String PARAM_NAME_SITEID = "siteId";
	private static final String PARAM_NAME_UNIQUECODE = "uniqueCode";

	private static final String BASE_FIELD="id,name,url";//返回的主要字段

	@Autowired
	private CommonService commonService;

	@Override
	public void execute(DirectiveHandler handler) throws TemplateException,
			IOException {

		String catId=handler.getString(PARAM_NAME_CATID, "");
		int count=handler.getInteger(PARAM_NAME_COUNT, 0);
		String level=handler.getString(PARAM_NAME_LEVEL, PARAM_NAME_LEVEL_CHILD);

		String siteId=handler.getString(PARAM_NAME_SITEID, "");
		String uniqueCode=handler.getString(PARAM_NAME_UNIQUECODE, "");

		Map<String,Object> m=new HashMap<String,Object>();

		if(level.equals(PARAM_NAME_LEVEL_ROOT)){

			if(StringUtils.isBlank(siteId)){
				throw new TemplateModelException(
						"通过标签获取一级栏目时，请传入siteId值");
			}
			List<Map<String, Object>> catalogList = findSiteRootCatalogList(siteId, count);

			if(catalogList != null && catalogList.size()>0){
				m.put("catalogList", catalogList);
			}else{
				m.put("catalogList",new ArrayList<Map<String,Object>>());
			}

			handler.putAll(m);
			handler.render();
			return;
		}

		if(StringUtils.isBlank(catId) && StringUtils.isBlank(uniqueCode)){
			throw new TemplateModelException(
					"请传入栏目标识或id参数");
		}

		Map<String,Object> catalog=findCatalogById(catId,uniqueCode,siteId);
		String pId = "";
		if(catalog != null){
			pId = catalog.get("id").toString();
		}
		//获取 栏目的catId作为 子栏目的pId
		
		//boolean flag=catalog.containsKey("opt")  
		if(level.equals(PARAM_NAME_LEVEL_CHILD)){
			//如果 level 为child 则查询其下的所有子栏目

			List<Map<String,Object>> catalogList=findChildCatalogList(pId,count);
			if(catalogList != null && catalogList.size()>0){
				m.put("catalogList", catalogList);
			}else{
				m.put("catalogList",new ArrayList<Map<String,Object>>());
			}
		}

		if(level.equals(PARAM_NAME_LEVEL_SELF)){

			if(catalog!=null && catalog.size()>0){
				m.put("catalog", catalog);
			}else{
				m.put("catalog", new HashMap<>());
			}
		}

//        if(level.equals(PARAM_NAME_LEVEL_ALL)){
//
//			if(catalog!=null && catalog.size()>0){
//				m.put("catalog", catalog);
//			}else{
//				m.put("catalog", new HashMap<>());
//			}
//		}

		handler.putAll(m);
		handler.render();

	}

	/**
	 *  根据uniqueCode,siteid,或catId 获取栏目信息
	 * @param catId
	 * @param uniqueCode
	 * @param siteid
	 * @return
	 */
	private Map<String, Object> findCatalogById(String catId,String uniqueCode,String siteid) {

		StringBuilder sql=new StringBuilder();
		sql.append("select ").append(BASE_FIELD).append(" from cms_content_cat ");

		if (StringUtils.isNotEmpty(uniqueCode)){
			sql.append(" where unique_code = ? and site_id = ?");
			return commonService.findOneForJdbc(sql.toString(), uniqueCode,siteid);
		}
		sql.append(" where id = ?");
		return commonService.findOneForJdbc(sql.toString(), catId);
	}

	/**
	 * 获取子集栏目列表
	 * @param catId
	 * @param count
	 * @return
	 */
	private List<Map<String, Object>> findChildCatalogList(String catId,
														   int count) {

		StringBuilder sql=new StringBuilder();

		sql.append("select ").append(BASE_FIELD).append(" from cms_content_cat ");

		sql.append(" where parentid = ? ");
		sql.append(" and isshow = 1 ");
		sql.append(" and disabled = 0 ");

		sql.append(" order by ");
		sql.append(" sort desc,created asc");

		if(count > 0){
			return commonService.findForJdbcParam(sql.toString(), 1, count, catId);
		}else{
			return commonService.findForJdbc(sql.toString(), catId);
		}

	}

	/**
	 * 获取站点一级栏目列表
	 * @param siteId
	 * @param count 指定最多获取多少条
	 * @return
	 */
	private List<Map<String, Object>> findSiteRootCatalogList(String siteId,
															  int count) {

		StringBuilder sql=new StringBuilder();

		sql.append("select ").append(BASE_FIELD).append(" from cms_content_cat ");

		sql.append(" where site_id = ? ");
		sql.append(" and isshow = 1 ");
		sql.append(" and disabled = 0 ");

		sql.append(" order by ");
		sql.append(" sort desc,created asc");

		if(count > 0){
			return commonService.findForJdbcParam(sql.toString(), 1, count, siteId);
		}else{
			return commonService.findForJdbc(sql.toString(), siteId);
		}
	}
}
