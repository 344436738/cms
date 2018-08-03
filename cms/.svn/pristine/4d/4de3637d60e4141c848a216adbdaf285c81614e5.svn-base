package com.leimingtech.cms.tag.lmtag;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.leimingtech.base.entity.temp.ClassifyEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.leimingtech.core.common.BaseFreeMarkerTag;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.ClassifyServiceI;

import freemarker.template.TemplateModelException;

/**
 * 分类列表标签
 * @author kingapex
 *2013-7-31下午6:31:08
 */
@Component
@Scope("prototype")
public class ClassifyListTag extends BaseFreeMarkerTag {
	
	@Autowired
	private ClassifyServiceI classifyService;
	
	/**
	 * 分类列表标签
	 * @param 
	 * @return 
	 * 
	 */
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		CriteriaQuery cq = new CriteriaQuery(ClassifyEntity.class);
		cq.eq("levels", 0);
		cq.add();
		List<ClassifyEntity> list = classifyService.getListByCriteriaQuery(cq, false);
		if(list==null || list.size()<0){
			list = new ArrayList<>();
		}
		return list;
		 
	}
	
	
}
