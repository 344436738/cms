package com.leimingtech.core;

import com.leimingtech.common.utils.spring.SpringContextHolder;
import com.leimingtech.core.util.StringUtils;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;
import org.springframework.context.ConfigurableApplicationContext;

import java.util.List;

public class TagCreator implements TemplateMethodModel {

	@Override
	public Object exec(List args) throws TemplateModelException {
		String beanid = (String) args.get(0);
		if (StringUtils.isEmpty(beanid)) {
			throw new TemplateModelException("标签beanid参数不能为空");
		}
		Object obj = SpringContextHolder.getBean(beanid);
		return obj;
	}

}
