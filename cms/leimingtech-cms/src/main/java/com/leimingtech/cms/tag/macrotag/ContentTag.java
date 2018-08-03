package com.leimingtech.cms.tag.macrotag;

import com.leimingtech.cms.tag.base.BaseDirective;
import com.leimingtech.cms.tag.base.DirectiveHandler;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.utils.DBConfig;
import com.leimingtech.core.common.ContentStatus;
import com.leimingtech.core.common.TagConstants;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.StringUtils;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class ContentTag extends BaseDirective {

	private static final String PARAM_NAME_COUNT = "count";
	private static final String PARAM_NAME_CATID = "catId";
	private static final String PARAM_NAME_LEVEL = "level";
	private static final String PARAM_NAME_ORDER = "order";
	private static final String PARAM_NAME_PAGE = "page";
	private static final String PARAM_NAME_PAGEINDEX = "pageindex";
	private static final String PARAM_NAME_TYPE = "type";//非必填项；内容类型，可选值（）
	private static final String PARAM_NAME_IMAGE = "image";//非必填项；内容是否必须包含列表图片，可选值（true/false）,默认false
	private static final String PARAM_NAME_WEIGHT = "weight";
	private static final String PARAM_NAME_SITEID = "siteId";
	private static final String PARAM_NAME_UNIQUECODE = "uniqueCode";

	//id、标题、短标题、引题、颜色、
	private static final String BASE_FIELD="c.id id,c.title,c.subtitle,c.citetitle,c.digest,c.color,c.thumb,c.tags,c.author,c.editor,c.url,c.created,c.createdby,c.published,c.publishedby";//返回的主要字段

	@Autowired
	private CommonService commonService;

	/**
	 * 这里定义的变量不会每次都定义，会持有上次标签所使用的参数值，所以每个变量都需要重新赋值覆盖
	 */
	private String catId;
	private int count;
	private boolean imageFlag;
	private Boolean page;
	private String pageindex;
	private String order;
	private String level;
	private String weight;

	private String siteId;
	private String uniqueCode;
	@Override
	public void execute(DirectiveHandler handler) throws TemplateException,
			IOException {

		CriteriaQuery cq = null;//分页时用到

		initParams(handler);//初始化标签参数

		Map<String,Object> catalog=findCatalogById(catId,uniqueCode,siteId);

		if(catalog!=null){
			catId=catalog.get("id").toString();//栏目自身的 栏目id
			List<String> sqlParams=new ArrayList<String>();
			StringBuilder sql=new StringBuilder();
			StringBuilder field=new StringBuilder(BASE_FIELD);
			StringBuilder where=new StringBuilder();
			sql.append("select ");
			sql.append(field.toString());
			sql.append(" from cms_content c ");

			where.append(" where ");

			where.append(" constants = ? ");
			sqlParams.add(ContentStatus.CONTENT_PUBLISHED);

			if(StringUtils.isEmpty(catId) && StringUtils.isNotEmpty(weight)){    //查询当前站点下的根据权重区间的列表数据
			}else{
				ArrayList<String> ids = new ArrayList<>();
				List<Map<String, Object>> childCatalogList = findChildCatalogList(catId, count);//所有子栏目
				if(level.equals(TagConstants.LEVEL_All)){  //获取当前栏目下所有子栏目的新闻，含本栏目，默认值
					ids.add("'"+catId+"'");//本栏目
					for (Map childCatalog:childCatalogList) {//遍历子栏目 获取catId
						String id = childCatalog.get("id").toString();
						ids.add("'"+id+"'");
					}
					//截取掉 list转Sting 时的方括号
					where.append(" and c.catid in ("+ids.toString().substring(1,ids.toString().length()-1)+") ");
				}else if(level.equals(TagConstants.LEVEL_CHILD)){  //获取当前栏目下所有子栏目的新闻
					for (Map childCatalog:childCatalogList) {//遍历子栏目
						String id = childCatalog.get("id").toString();
						ids.add("'"+id+"'");
					}
					//截取掉 list转Sting 时的方括号
					where.append(" and c.catid in ("+ids.toString().substring(1,ids.toString().length()-1)+") ");
				}else{                                     //获取自身
					where.append(" and c.catid = ? ");
					sqlParams.add(catId);
				}
			}

			//查询权重区间
			if(StringUtils.isNotEmpty(weight)){
				String weightList[]=weight.split("-");
				where.append(" and c.weight >=? ");
				where.append(" and c.weight <=? ");
				sqlParams.add(weightList[0]);
				sqlParams.add(weightList[1]);
			}

			if(imageFlag){
				//查询必须包含缩略图
				if(DBConfig.ORACLE.equals(DBConfig.DBTYPE)){
					//oracle  语句
					where.append(" and c.thumb is not null ");
				}else{
					//其他语句
					where.append(" and c.thumb !='' ");
				}
			}

			sql.append(where.toString());

			//排序
			if(StringUtils.isNotEmpty(order)){
				sql.append(setOrder(order));
				sql.append(" ,published desc ");
			}else {
				sql.append(" order by published desc ");
			}

			List<Map<String,Object>> data=null;

			if(page){
				count=Integer.parseInt(catalog.get("pagesize").toString());
			}
			if(count>0&& StringUtils.isNotEmpty(pageindex)
					&& StringUtils.isNumeric(pageindex)){
				//分页
				data=commonService.findForJdbcParam(sql.toString(), Integer.valueOf(pageindex), count, sqlParams.toArray());

			} else{
				data=commonService.findForJdbc(sql.toString(), sqlParams.toArray());
			}

			if(data!=null && data.size()>0){
				handler.put("contentList", data);
			}else{
				handler.put("contentList", new ArrayList<Map<String,Object>>());
			}
			handler.render();
		}
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

		sql.append("select id,name,url").append(" from cms_content_cat ");

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


	//排序
	private  String setOrder(String order){
		String orderSql="";
		if (order.equalsIgnoreCase(TagConstants.ORDER_TOP)) {
			orderSql=" order by is_headline desc ";// 头条
		} else if (order.equalsIgnoreCase(TagConstants.ORDER_PV)) {
			orderSql=" order by pv desc ";// 浏览量
		} else if (order.equalsIgnoreCase(TagConstants.ORDER_ISTOP)) {
			orderSql=" order by is_top desc ";// 置顶
		}
		return orderSql;
	}

	/**
	 * 初始化标签参数
	 * @param handler
	 */
	private void initParams(DirectiveHandler handler) throws TemplateException {
		catId = handler.getString(PARAM_NAME_CATID, "");
		count = handler.getInteger(PARAM_NAME_COUNT, 0);
		page = Boolean.valueOf(handler.getString(PARAM_NAME_PAGE));
		pageindex = handler.getString(PARAM_NAME_PAGEINDEX,"1");
		imageFlag = handler.getBoolean(PARAM_NAME_IMAGE, Boolean.FALSE);
		order=handler.getString(PARAM_NAME_ORDER, "");
		level=handler.getString(PARAM_NAME_LEVEL, TagConstants.LEVEL_SELF);
		weight=handler.getString(PARAM_NAME_WEIGHT, "");
		siteId=handler.getString(PARAM_NAME_SITEID, "");
		uniqueCode=handler.getString(PARAM_NAME_UNIQUECODE, "");
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
		sql.append("select id,pagesize from cms_content_cat ");

		if (StringUtils.isNotEmpty(uniqueCode)){
			sql.append(" where unique_code = ? and site_id = ?");
			return commonService.findOneForJdbc(sql.toString(), uniqueCode,siteid);
		}
		sql.append(" where id = ?");
		return commonService.findOneForJdbc(sql.toString(), catId);
	}
}
