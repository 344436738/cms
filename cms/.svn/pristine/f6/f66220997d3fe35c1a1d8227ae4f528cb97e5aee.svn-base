package com.leimingtech.cms.service.impl.content;

import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.temp.SurveyEntity;
import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.common.Globals;
import com.leimingtech.base.entity.temp.ContentCatEntity;

import com.leimingtech.core.service.*;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Service("surveyService")
@Transactional
public class SurveyServiceImpl extends CommonServiceImpl implements SurveyServiceI {
	@Autowired
	private SystemService systemService;
	@Autowired
	private ConstantsServiceI constantsService;
	@Autowired
	private ContentsServiceI contentsService;
	@Autowired
	private IStatic staticImpl;
	@Override
	public void saveSurvey(ContentsEntity contents, SurveyEntity survey) {
		HttpServletRequest request = ContextHolderUtils.getRequest();
		//栏目id
		String contentCatId = request.getParameter("contentCatId");
		//获取当前毫秒数
		String temporary = request.getParameter("temporary");
		//顺序值
		String divValue = request.getParameter("divValue");
		ContentCatEntity contentcat=getEntity(ContentCatEntity.class, contentCatId);
		String message = "";
		if (StringUtils.isNotEmpty(survey.getId())){
			//修改调查
			updateSurvey(contents, survey, contentcat, temporary, divValue);
		}else{
			//添加调查
			message = "调查["+contents.getTitle()+"]添加成功";
			survey.setContentid(contents.getId());
			survey.setSiteid(contents.getSiteid());
			survey.setCreatedtime(new Date());//创建时间
			save(survey);
			//在modelExt中保存modelId/attrName
			contentsService.saveModelItem(contents);
			//保存相关内容
			contentsService.saveRelateContent(contents, temporary, divValue);
			//生成预览页面
			staticImpl.staticContentActOnPreview(contents);
			//进入判断工作流和状态
			constantsService.isWorkFlow(contents, contentcat);
			//日志添加
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		
	}
	@Override
	public void updateSurvey(ContentsEntity contents, SurveyEntity survey,
			ContentCatEntity contentcat, String temporary, String divValue) {
		String message = "";
		try {
			message = "调查["+contents.getTitle()+"]更新成功";
			SurveyEntity t = get(SurveyEntity.class, survey.getId());
			MyBeanUtils.copyBeanNotNull2Bean(survey, t);
			saveOrUpdate(t);
			//保存扩展参数名称和value
			contentsService.saveModelExt(contents);
			//保存相关内容
			contentsService.saveRelateContent(contents, temporary, divValue);
			//生成预览页面
			staticImpl.staticContentActOnPreview(contents);
			//进入判断工作流和状态
			constantsService.isWorkFlow(contents, contentcat);
			//日志添加
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		} catch (Exception e) {
			e.printStackTrace();
			message = "调查["+contents.getTitle()+"]更新失败";
		}
		
	}
	
}