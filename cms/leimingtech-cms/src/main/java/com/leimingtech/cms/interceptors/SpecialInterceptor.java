package com.leimingtech.cms.interceptors;

import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.temp.SpecialEntity;
import com.leimingtech.cms.entity.contents.ContentClassify;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateTypeConstants;
import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateServiceI;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.core.service.ConstantsServiceI;
import com.leimingtech.core.service.ContentCatServiceI;
import com.leimingtech.core.service.ContentsServiceI;
import com.leimingtech.core.service.SpecialServiceI;
import com.leimingtech.core.util.StringUtils;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 专题业务
 * Created by liuzhen on 2016/12/1.
 */
@Aspect
@Component
public class SpecialInterceptor {

    /**内容接口*/
    @Autowired
    private ContentsServiceI contentsService;
    /**栏目接口*/
    @Autowired
    private ContentCatServiceI contentCatService;
    /**内容工作流接口*/
    @Autowired
    private ConstantsServiceI constantsService;
    /**静态页发布接口*/
    @Autowired
    private IStatic staticImpl;
    /**专题接口*/
    @Autowired
    private SpecialServiceI specialService;
    /**可视化模板接口*/
    @Autowired
    private VisibleTemplateServiceI visibleTemplateService;

    @Pointcut("execution(public * com.leimingtech.core.service.ContentsServiceI.saveContent(..))")
    public void myMethod(){}

    /**
     * 正常执行完后
     * 保存内容之后，保存文章
     * @param map
     */
    @After("myMethod()&&args(map,..)")
    public void after(Map<String,Object> map){
        ContentsEntity contents = (ContentsEntity) map.get("contents");
        String classify = contents.getClassify();
        if (ContentClassify.CONTENT_SPECIAL.equals(classify)) {

            HttpServletRequest request = ContextHolderUtils.getRequest();
            //内容id
            String contentsId = request.getParameter("id");
            String visibleTemplateId = request.getParameter("visibleTemplateId");
            if (StringUtils.isNotEmpty(contentsId)) {
                contents = contentsService.getContensById(contentsId);
                SpecialEntity special = specialService.findByContentId(contentsId);
               // special.setVisibleTemplateId(visibleTemplateId);
                specialService.saveOrUpdate(special);
            } else {

                if("0".equals(visibleTemplateId)){
                    //没有选择模板创建一个新模板
                    visibleTemplateId = visibleTemplateService.create(contents.getTitle(),
                            VisibleTemplateTypeConstants.SPECIAL, contents.getCreated(), contents.getCreatedby(),
                            contents.getSiteid());
                }

                SpecialEntity special = new SpecialEntity();
                special.setContentid(contents.getId());
               // special.setVisibleTemplateId(visibleTemplateId);
                special.setCreatedtime(contents.getCreated());
                specialService.save(special);
            }
            ContentCatEntity contentCat = contentCatService.getEntity(contents.getCatid());

            //保存扩展参数名称和value
            contentsService.saveModelExt(contents);
            //生成预览页面
            staticImpl.staticContentActOnPreview(contents);
            //进入判断工作流和状态
            constantsService.isWorkFlow(contents, contentCat);
        }
    }
}
