package com.leimingtech.cms.service.impl.content;

import com.leimingtech.base.entity.temp.ContentLinkEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.common.Globals;
import com.leimingtech.base.entity.temp.ContentCatEntity;

import com.leimingtech.core.service.ConstantsServiceI;
import com.leimingtech.core.service.ContentLinkServiceI;
import com.leimingtech.core.service.ContentsServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


@Service("contentLinkService")
@Transactional
public class ContentLinkServiceImpl extends CommonServiceImpl implements ContentLinkServiceI {

	@Autowired
	private SystemService systemService;
	@Autowired
	private ContentsServiceI contentsService;
	@Autowired
	private ConstantsServiceI constantsService;
	@Autowired
	private IStatic staticImpl;
	
	@Override
	public void saveLink(ContentsEntity contents,ContentLinkEntity contentLink) {
		HttpServletRequest request = ContextHolderUtils.getRequest();
		//栏目id
		String contentCatId = request.getParameter("contentCatId");
		ContentCatEntity contentcat = get(ContentCatEntity.class, contentCatId);
		String message = "";
		if(StringUtils.isNotEmpty(contentLink.getId())){
			//修改链接
			updateLink(contents, contentLink, contentcat);
		}else{
			message = "链接["+contents.getTitle()+"]更新成功";
			//新增链接
			contentLink.setContentid(contents.getId());
			contentLink.setSiteid(contents.getSiteid());
			contentLink.setCreatedtime(new Date());//创建时间
			save(contentLink);
			contents.setUrl(contentLink.getLinkurl());
			save(contents);
			//在modelExt中保存modelId/attrName
			contentsService.saveModelItem(contents);
			//生成预览页面
//			staticImpl.staticContentActOnPreview(contents);
			//进入判断工作流和状态
			constantsService.isWorkFlow(contents, contentcat);
			//日志添加
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		}
	}
	
	@Override
	public void updateLink(ContentsEntity contents, ContentLinkEntity contentLink, ContentCatEntity contentcat) {
		ContentLinkEntity t = get(ContentLinkEntity.class, contentLink.getId());
		String message = "";
		try {
			message = "链接["+contents.getTitle()+"]更新成功";
			MyBeanUtils.copyBeanNotNull2Bean(contentLink, t);
			saveOrUpdate(t);
			if(!contentLink.getLinkurl().equals(contents.getUrl())){
				contents.setUrl(contentLink.getLinkurl());
				save(contents);
			}
			
			////保存扩展参数名称和value
			contentsService.saveModelExt(contents);
			//生成预览页面
//			staticImpl.staticContentActOnPreview(contents);
			//进入判断工作流和状态
			constantsService.isWorkFlow(contents, contentcat);
			//日志添加
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}