package com.leimingtech.cms.tag.macrotag;

import com.leimingtech.cms.tag.base.BaseDirective;
import com.leimingtech.cms.tag.base.DirectiveHandler;
import com.leimingtech.core.common.ContentStatus;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.oConvertUtils;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModelException;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.*;

/**
 * 分页条标签
 * @author liuzhen
 *
 */
@Component
public class PagebarTag  extends BaseDirective{

	private static final String PARAM_NAME_PAGEINDEX = "pageIndex";
	private static final String PARAM_NAME_CATID = "catId";
	private static final String PARAM_NAME_STYLE = "simple";

	private static final String PARAM_NAME_SITEID = "siteId";
	private static final String PARAM_NAME_UNIQUECODE = "uniqueCode";

	@Autowired
	private CommonService commonService;

	@Override
	public void execute(DirectiveHandler handler) throws TemplateException,
			IOException {
		int pageIndex=handler.getInteger(PARAM_NAME_PAGEINDEX, 1);
		String catId=handler.getString(PARAM_NAME_CATID, "");
		String uniqueCode=handler.getString(PARAM_NAME_UNIQUECODE, "");
		String siteId=handler.getString(PARAM_NAME_SITEID, "");

		if(StringUtils.isBlank(catId) && StringUtils.isBlank(uniqueCode)){
			throw new TemplateModelException(
					"请传入栏目标识或id参数");
		}
		Map<String,Object> result;
		if(StringUtils.isNotEmpty(uniqueCode)){
			result=commonService.findOneForJdbc(" select pagesize,path,id from cms_content_cat " +
					"where  uniqueCode= ? and site_id=? ", uniqueCode,siteId);
			catId = result.get("id").toString();

		}else {
			result=commonService.findOneForJdbc(" select pagesize,path from cms_content_cat where id = ? ", catId);
		}
		int pagesize = oConvertUtils.getInt(result.get("pagesize"), 0);
		String path = oConvertUtils.getString(result.get("path"), "");

		List<Object> params=new ArrayList<Object>();

		StringBuilder sql=new StringBuilder();
		sql.append(" select count(*) count from cms_content ");
		sql.append(" where catid = ? ");
		params.add(catId);
		sql.append(" and published <= ? ");
		params.add(new Date());
		sql.append(" and constants = ? ");
		params.add(ContentStatus.CONTENT_PUBLISHED);

		Map<String,Object> m=commonService.findOneForJdbc(sql.toString(), params.toArray());

		int count = 0;
		if(MapUtils.isNotEmpty(m)){
			count = oConvertUtils.getInt(m.get("count"), 0);
		}

		Map<String,Object> param=new HashMap<String,Object>();
		param.put("count",count);

		int pageCount = count / pagesize;
		if (count % pagesize != 0) {
			pageCount++;
		}
		param.put("pageCount",pageCount);
		param.put("pageSize",pagesize);
		param.put("catalogPath",path);

		handler.putAll(param);
		handler.render();
	}

}
