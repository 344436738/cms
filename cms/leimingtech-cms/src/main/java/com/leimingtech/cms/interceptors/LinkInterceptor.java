package com.leimingtech.cms.interceptors;

import com.leimingtech.base.entity.temp.ContentLinkEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.entity.contents.ContentClassify;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.core.service.ContentLinkServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.StringUtils;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 链接切面类
 * @author zhangxiaoqiang
 *
 */
@Aspect
@Component
public class LinkInterceptor{
	@Autowired
	private SystemService systemService;
	@Autowired
	private ContentLinkServiceI linkService;
	
	@Pointcut("execution(public * com.leimingtech.core.service.ContentsServiceI.saveContent(..))")
	public void myMethod(){};
	
	/**
	 * 下面用到的是织入点语法, 看文档里面有. 就是指定在该方法前执行
	 * 记住下面这种通用的, *表示所有
	 * @param map
	 */
	@Before("myMethod()&&args(map,..)")
	public void beforeMethod(Map<String,Object> map){
		
	}
	/**
	 * 正常执行完后
	 * 保存内容之后，保存链接
	 * @param map
	 */
	@After("myMethod()&&args(map,..)")
	public void after(Map<String,Object> map){
		ContentsEntity contents = (ContentsEntity) map.get("contents");
		ContentLinkEntity contentLink = (ContentLinkEntity) map.get("contentLink");
		HttpServletRequest request = ContextHolderUtils.getRequest();
		//内容id
		String contentsId = request.getParameter("contentsId");
		if(StringUtils.isNotEmpty(contentsId)){
			contents= linkService.get(ContentsEntity.class, String.valueOf(contentsId));
		}
		String classify = contents.getClassify();
		if(ContentClassify.CONTENT_LINK.equals(classify)){
			linkService.saveLink(contents,contentLink);
		}
	}
	/**
	 * 正常执行完后
	 */
	@AfterReturning("myMethod()")
	public void afterReturnning(){
		
	}
	
	/**
	 * 抛出异常时才调用
	 */
	@AfterThrowing("myMethod()")
	public void afterThrowing(){
		
	}
	
}