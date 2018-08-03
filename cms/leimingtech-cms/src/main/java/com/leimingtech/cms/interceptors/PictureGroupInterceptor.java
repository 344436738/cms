package com.leimingtech.cms.interceptors;

import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.temp.PictureGroupEntity;
import com.leimingtech.cms.entity.contents.ContentClassify;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.core.service.PictureGroupServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.StringUtils;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 组图切面类
 * @author zhangxiaoqiang
 *
 */
@Aspect
@Component
public class PictureGroupInterceptor{
	@Autowired
	private SystemService systemService;
	@Autowired
	private PictureGroupServiceI pictureGroupService;
	
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
	 * 保存内容之后，保存组图
	 * @param map
	 */
	@After("myMethod()&&args(map,..)")
	public void after(Map<String,Object> map){
		ContentsEntity contents = (ContentsEntity) map.get("contents");
		PictureGroupEntity pictureGroup = (PictureGroupEntity) map.get("pictureGroup");
		HttpServletRequest request = ContextHolderUtils.getRequest();
		//内容id
		String contentsId = request.getParameter("contentsId");
		if(StringUtils.isNotEmpty(contentsId)){
			contents= pictureGroupService.get(ContentsEntity.class, String.valueOf(contentsId));
		}
		String classify = contents.getClassify();
		if(ContentClassify.CONTENT_PICTUREGROUP.equals(classify)){
			pictureGroupService.savePictureGroup(contents, pictureGroup);
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