package com.leimingtech.cms.controller.visibletemplate;

import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.core.util.FreemarkerUtils;
import com.leimingtech.cms.entity.visibletemplate.*;
import com.leimingtech.cms.service.visibletemplate.*;
import com.leimingtech.cms.tag.lmtag.TagMap;
import com.leimingtech.base.entity.temp.ContentCatEntity;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.core.service.ContentCatServiceI;
import com.leimingtech.core.util.*;
import com.leimingtech.core.util.json.JsonConfig;
import freemarker.template.TemplateException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

/**
 * 模板组件
 * Created by liuzhen on 2016/11/19.
 */
@Controller
@RequestMapping("/visibleModuleController")
public class VisibleModuleController extends BaseController {

    /**
     * 模板组件操作接口
     */
    @Autowired
    private VisibleModuleServiceI visibleModuleService;
    /**
     * 可视化模板标准组件操作接口
     */
    @Autowired
    private VisibleTemplateModuleServiceI visibleTemplateModuleService;
    /**
     * 内容参数管理接口
     */
    @Autowired
    private VisibleContentParamServiceI visibleContentParamService;
    /**
     * 栏目管理接口
     */
    @Autowired
    private ContentCatServiceI contentCatService;
    /**
     * 图片参数接口
     */
    @Autowired
    private VisibleImageParamServiceI visibleImageParamService;
    /**
     * 导航参数接口
     */
    @Autowired
    private VisibleNavParamServiceI visibleNavParamService;

    /**
     *单篇文章参数接口
     */
    @Autowired
    private VisibleEmbedContentParamServicel visibleEmbedContentParamServicel;

    /**
     * 创建一个组件，包含参数
     *
     * @return
     */
    @RequestMapping("/saveModuleAndParam")
    @ResponseBody
    public String saveModuleAndParam(String templateId, String moduleId, String moduleKey, String paramsId, String catId, int count, int image) {

        if (StringUtils.isBlank(catId)) {
            return error("请选择栏目").toString();
        }

        if (count == 0) {
            return error("请指定要获取的条数").toString();
        }

        JSONObject j = new JSONObject();

        VisibleTemplateModuleVOTemplateEntity template;
        if (StringUtils.isNotBlank(moduleId)) {
            VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);
            template = new VisibleTemplateModuleVOTemplateEntity();
            template.setTemplate(module.getTemplateTemp());
        } else {
            template = visibleTemplateModuleService
                    .findByModuleKey(moduleKey);// 根据组件键获取配置模板
        }

        if (template != null) {
            String demoTemplate = template.getTemplate();
            try {
                Map<String, Object> m = new HashMap<String, Object>();
                m.putAll(TagMap.getTagMap());
                SiteEntity site = UserUtils.getSite();
                m.put("domain", site.getProtocol() + site.getDomain());
                m.put("_catId", catId);
                m.put("_count", count);
                m.put("_image", image);
                String t = FreemarkerUtils.renderString(demoTemplate, m);
                template.setTemplate(t);
            } catch (IOException | TemplateException e) {
                e.printStackTrace();
                return j.accumulate("isSuccess", false).accumulate("msg",
                        "组件模板解析错误，请检查组件模板！").toString();
            }
            String id = moduleId;
            if (StringUtils.isNotBlank(paramsId)) {
                int rows = visibleContentParamService.updateModuleParam(paramsId, catId, count, image);
                if (rows == 0) {
                    return error("更新失败，没有找到具体参数").toString();
                }
            } else {
                id = visibleModuleService.saveModuleAndParam(templateId, moduleKey, demoTemplate, catId, count, image);
            }

            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        } else {
            j.accumulate("isSuccess", false).accumulate("msg",
                    "找不到匹配的组件，即将自动移除刚才拖入的组件");
        }

        return j.toString();
    }

    /**
     * 创建一个分页组件，包含参数
     *
     * @return
     */
    @RequestMapping("/savePaginationParam")
    @ResponseBody
    public String savePaginationParam(String templateId, String moduleId, String moduleKey, String paramsId, String catId) {

        if (StringUtils.isBlank(catId)) {
            return error("请选择栏目").toString();
        }

        JSONObject j = new JSONObject();

        VisibleTemplateModuleVOTemplateEntity template;
        if(StringUtils.isNotBlank(moduleId)){
            VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);
            template = new VisibleTemplateModuleVOTemplateEntity();
            template.setTemplate(module.getTemplateTemp());
        }else{
            template = visibleTemplateModuleService
                    .findByModuleKey(moduleKey);
        }
        if(template!=null){
            String demoTemplate = template.getTemplate();
            try {
                Map<String,Object> m = new HashedMap();
                m.putAll(TagMap.getTagMap());
                SiteEntity site = UserUtils.getSite();
                m.put("domain", site.getProtocol() + site.getDomain());
                m.put("_catId",catId);
                String t = FreemarkerUtils.renderString(demoTemplate, m);
                template.setTemplate(t);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (TemplateException e) {
                e.printStackTrace();
            }
           String id = moduleId;
            if(StringUtils.isNotBlank(paramsId)){
                int rows = visibleModuleService.updateVisinlePageParma(paramsId, catId);
                if (rows == 0) {
                    return error("更新失败，没有找到具体参数").toString();
                }
            }else{
                id = visibleModuleService.saveVisinlePageParma(templateId, moduleKey, demoTemplate, catId);
            }
            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        }

        return j.toString();
    }
    /**
     * 导航模板初始拖动
     * @param moduleKey
     * @param request
     * @return
     */
    @RequestMapping("/saveModule")
    @ResponseBody
    public String saveModule(String moduleKey, HttpServletRequest request) {

        JSONObject j = new JSONObject();

        VisibleTemplateModuleVOTemplateEntity template = visibleTemplateModuleService
                .findByModuleKey(moduleKey);// 根据组件键获取配置模板

        if (template != null) {
            String demoTemplate = template.getTemplate();
            //try {

                Map<String, Object> m = new HashMap<String, Object>();
                m.putAll(TagMap.getTagMap());
                SiteEntity site = UserUtils.getSite();
                m.put("domain", site.getProtocol() + site.getDomain());

                //String t = FreemarkerUtils.renderString(demoTemplate, m);
                //template.setTemplate(t);
            //} catch (IOException | TemplateException e) {
                //e.printStackTrace();
                //return j.accumulate("isSuccess", false).accumulate("msg",
                        //"组件模板解析错误，请检查组件模板！").toString();
            //}
            String templateId = request.getParameter("templateId");
            String id = visibleModuleService.save(demoTemplate,
                    moduleKey, templateId);// 保存一份组件，方便个性化编辑

            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        } else {
            j.accumulate("isSuccess", false).accumulate("msg",
                    "找不到匹配的组件，即将自动移除刚才拖入的组件");
        }

        return j.toString();
    }

    @RequestMapping("/moduleInfo")
    @ResponseBody
    public String moduleInfo(String id) {

        JSONObject j = new JSONObject();

        VisibleModuleEntity module = visibleModuleService.getEntity(id);
        if (module != null) {
            j = j.fromObject(module, JsonConfig.getInstance());
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        } else {
            j.accumulate("isSuccess", false).accumulate("msg",
                    "找不到匹配的组件，无法编辑源码");
        }

        return j.toString();
    }

    /**
     * 修改组件模板
     *
     * @param id
     * @param template
     * @return
     */
    @RequestMapping("/editDIYTemplateModule")
    @ResponseBody
    public String editDIYTemplateModule(String id, String template, String moduleKey, String templateId) {

        VisibleModuleEntity module;
        Date date = new Date();
        String userId = UserUtils.getUser().getId();
        if (StringUtils.isBlank(id)&&VisibleModuleConstants.LMCMS_MODULE_DIY_CODE.equals(moduleKey)) {
            module = new VisibleModuleEntity();
            module.setModuleKey(moduleKey);
            module.setTemplateId(templateId);
            module.setSiteId(UserUtils.getSiteId());
            module.setUpdateTime(date);
            module.setUpdateBy(userId);
            module.setCreateBy(userId);
            module.setCreateTime(date);
        } else if (StringUtils.isBlank(id)) {
            return error("找不到匹配的组件，无法修改组件源码！").toString();
        } else {
            module = visibleModuleService.getEntity(id);
        }

        if (module == null) {
            return error("找不到匹配的组件，无法修改组件源码！").toString();
        }

        Map<String, Object> params = visibleModuleService.getModuleParams(module);
        params.putAll(TagMap.getTagMap());
        SiteEntity site = UserUtils.getSite();
        params.put("site",site);
        params.put("domain", site.getProtocol() + site.getDomain());

        JSONObject j = new JSONObject();

        String t = template;
        if (StringUtils.isNotBlank(template)) {
            template = StringEscapeUtils.unescapeHtml(template);

            String readyRenderTemplate = template;
            if (MapUtils.isNotEmpty(params)) {
                //替换模板中的表单参数
                for (String key : params.keySet()) {
                    String value = oConvertUtils.getString(params.get(key), "");
                    readyRenderTemplate = readyRenderTemplate.replaceAll("_" + key, "\"" + value + "\"");
                }
            }

            try {
                if(!VisibleModuleConstants.LMCMS_MODULE_IMAGE.equals(module.getModuleKey())){
                    t = FreemarkerUtils.renderString(readyRenderTemplate, params);

                }
            } catch (IOException | TemplateException e) {
                LogUtil.error("模板解析错误",e);
                return j.accumulate("isSuccess", false).accumulate("msg",
                        "模板解析错误，保存失败！<br/>" +
                                "详细错误信息（" + e.getMessage() + "）").toString();
            }

           if(VisibleModuleConstants.LMCMS_MODULE_IMAGE.equals(module.getModuleKey())){
               try {
                   t = FreemarkerUtils.renderString(
                           readyRenderTemplate, params);
               } catch (IOException | TemplateException e) {
                   LogUtil.error("模板解析出错", e);

               }
           }
            if(VisibleModuleConstants.LMCMS_MODULE_NAV.equals(module.getModuleKey())){
                    try {
                        t = FreemarkerUtils.renderString(
                                readyRenderTemplate, params);
                    } catch (IOException | TemplateException e) {
                        LogUtil.error("模板解析出错", e);

                    }
                }
        }
        module.setTemplateTemp(template);
        if (StringUtils.isEmpty(module.getId())) {
            module.setTemplate(template);
            visibleModuleService.save(module);
            id = module.getId();
        } else {
            module.setUpdateTime(date);
            module.setUpdateBy(userId);
            visibleModuleService.saveOrUpdate(module);
        }

        VisibleTemplateModuleVOTemplateEntity templateModule = visibleTemplateModuleService.findByModuleKey(VisibleModuleConstants.LMCMS_MODULE_DIY_CODE);

        j.accumulate("id", id);
        j.accumulate("html", t);
        j.accumulate("controllerCode", templateModule.getControllerCode());
        j.accumulate("isSuccess", true).accumulate("msg", "更新成功！");

        return j.toString();
    }

    /**
     * 获取组件参数
     *
     * @param moduleId
     * @return
     */
    @RequestMapping("/moduleParams")
    @ResponseBody
    public String moduleParams(String moduleId) {

        VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);

        Map<String, Object> params = visibleModuleService.getModuleParams(module);
        String moduleKey = module.getModuleKey();
        String templateId = module.getTemplateId();
        JSONObject j = success("参数获取成功").accumulate("moduleId", moduleId).accumulate("moduleKey", moduleKey).accumulate("templateId", templateId);
        String catId = oConvertUtils.getString(params.get("catId"), "");
        Set<String> set = new HashSet<String>();
        set.add(catId);
        JSONArray jsonArray = contentCatService.getzTreeData(UserUtils.getSiteId(), set);
        j.putAll(params);
        j.accumulate("ztreeData", jsonArray);
        return j.toString();
    }

    /**
     * 保存html组件内容
     *
     * @param html
     * @return
     */
    @RequestMapping("/saveHtmlModule")
    @ResponseBody
    public String saveHtmlModule(String html) {
        if (StringUtils.isNotBlank(html)) {
            html = StringEscapeUtils.unescapeHtml(html);
        }

        VisibleTemplateModuleVOTemplateEntity template = visibleTemplateModuleService.findByModuleKey(VisibleModuleConstants.LMCMS_MODULE_HTML);
        JSONObject j = success("保存成功");
        j.accumulate("template", html);
        j.accumulate("controllerCode", template.getControllerCode());

        return j.toString();
    }

    /**
     * @param templateId       模板
     * @param imageModuleId    组件
     * @param imageUrl         图片地址
     * @param imageWidth       图片宽度
     * @param imageHeight      图片高度
     * @param imageDescription 图片描述
     * @param linkUrl          链接地址
     * @param blank            是否在新窗口打开
     * @return
     */
    @RequestMapping("/saveImageModuleAndParam")
    @ResponseBody
    public String saveImageModuleAndParam(String templateId, String imageModuleId, String imageParamsId, String imageUrl,
                                          Integer imageWidth, Integer imageHeight, String imageDescription, String linkUrl, Integer blank) {

        if (StringUtils.isBlank(imageUrl)) {
            return error("图片地址不能为空，请完善！").toString();
        }

        JSONObject j = new JSONObject();

        VisibleTemplateModuleVOTemplateEntity template;
        if (StringUtils.isNotBlank(imageModuleId)) {
            VisibleModuleEntity module = visibleModuleService.getEntity(imageModuleId);
            template = new VisibleTemplateModuleVOTemplateEntity();
            template.setTemplate(module.getTemplateTemp());
        } else {
            template = visibleTemplateModuleService
                    .findByModuleKey(VisibleModuleConstants.LMCMS_MODULE_IMAGE);// 根据组件键获取配置模板
        }

        if (template != null) {
            String demoTemplate = template.getTemplate();
            try {

                Map<String, Object> m = new HashMap<String, Object>();
                m.putAll(TagMap.getTagMap());
                SiteEntity site = UserUtils.getSite();
                String domain = site.getProtocol() + site.getDomain();
                m.put("domain", domain);
                m.put("imageUrl", imageUrl);
                m.put("width", imageWidth == null ? "" : imageWidth);
                m.put("height", imageHeight == null ? "" : imageHeight);
                m.put("title", imageDescription);
                m.put("linkUrl", linkUrl);
                m.put("blank", blank == null ? 0 : blank);
                this.visibleModuleService.initUrl(m, domain);

                String t = FreemarkerUtils.renderString(demoTemplate, m);
                template.setTemplate(t);
            } catch (IOException | TemplateException e) {
                e.printStackTrace();
                return j.accumulate("isSuccess", false).accumulate("msg",
                        "组件模板解析错误，请检查组件模板！").toString();
            }
            String id = imageModuleId;
            if (StringUtils.isNotBlank(imageParamsId)) {
                boolean updateFlag = this.visibleImageParamService.updateImageModuleParam(imageParamsId, imageUrl, imageWidth, imageHeight, imageDescription, linkUrl, blank);
                if (!updateFlag) {
                    return error("更新失败，没有找到具体参数").toString();
                }
            } else {
                id = visibleModuleService.saveImageModuleAndParam(templateId, VisibleModuleConstants.LMCMS_MODULE_IMAGE, demoTemplate, imageUrl, imageWidth, imageHeight, imageDescription, linkUrl, blank);
            }

            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        } else {
            j.accumulate("isSuccess", false).accumulate("msg",
                    "找不到匹配的组件，即将自动移除刚才拖入的组件");
        }


        return j.toString();
    }

    /**
     * 保存分页列表参数
     * @param templateId
     * @param count
     * @param moduleId
     * @param paramId
     * @param catId
     * @return
     */
    @RequestMapping("/saveContentListparam")
    @ResponseBody
    public String saveContentListparam(String templateId,String count,String moduleId,String paramId,String catId,String moduleKey){
        VisibleTemplateModuleVOTemplateEntity template;
        JSONObject j = new JSONObject();
        if (StringUtils.isNotBlank(moduleId)) {
            VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);
            template = new VisibleTemplateModuleVOTemplateEntity();
            template.setTemplate(module.getTemplateTemp());
        } else {
            template = visibleTemplateModuleService
                    .findByModuleKey(VisibleModuleConstants.LMCMS_MODULE_CONTENT_LIST);// 根据组件键获取配置模板
        }

        if(StringUtils.isNotEmpty(catId)){
            count = visibleModuleService.getContentListCount(catId);
        }

        if(template !=null){
            String demoTemplate = template.getTemplate();
            try {
                Map<String,Object> m = new HashedMap();
                m.putAll(TagMap.getTagMap());
                SiteEntity site = UserUtils.getSite();
                m.put("domain", site.getProtocol() + site.getDomain());
                m.put("_catId",catId);
                m.put("_count",count);
                m.put("_flag","true");
                String t = FreemarkerUtils.renderString(demoTemplate, m);
                template.setTemplate(t);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (TemplateException e) {
                e.printStackTrace();
            }
            String id = moduleId;
            if(StringUtils.isNotBlank(paramId)){
                int rows = visibleModuleService.updateVisinleContentListParma(paramId,catId,Integer.valueOf(count));
                if (rows == 0) {
                    return error("更新失败，没有找到具体参数").toString();
                }
            }else{
                id = visibleModuleService.saveVisinleConentListParma(templateId, moduleKey, demoTemplate, catId,Integer.valueOf(count));
            }
            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        }else{
            j.accumulate("isSuccess", false).accumulate("msg", "模板保存失败");
        }
        return j.toString();
    }
    /**
     * 获取图片组件参数
     *
     * @param moduleId
     * @return
     */
    @RequestMapping("/imageModuleParams")
    @ResponseBody
    public String imageModuleParams(String moduleId) {

        VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);

        SiteEntity site = UserUtils.getSite();
        String domain = site.getProtocol() + site.getDomain();
        Map<String, Object> params = visibleModuleService.getModuleParams(module);
//        initUrl(params, domain);//初始化链接地址，将所有地址都加上域名
        String moduleKey = module.getModuleKey();
        String templateId = module.getTemplateId();
        JSONObject j = success("参数获取成功").accumulate("moduleId", moduleId).accumulate("moduleKey", moduleKey).accumulate("templateId", templateId);
        j.putAll(params);
        return j.toString();
    }

    /**
     * 获取导航组件参数
     *
     * @param moduleId
     * @return
     */
    @RequestMapping("/navModuleParams")
    @ResponseBody
    public String navModuleParams(String moduleId) {

        VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);

        Map<String, Object> params = visibleModuleService.getModuleParams(module);
        String moduleKey = module.getModuleKey();
        String templateId = module.getTemplateId();
        JSONObject j = success("参数获取成功").accumulate("moduleId", moduleId).accumulate("moduleKey", moduleKey).accumulate("templateId", templateId);
        j.putAll(params);
        return j.toString();
    }


    /**
     * 保存导航组件参数
     *
     * @param request
     * @param templateId
     * @param navModuleId
     * @return
     */
    @RequestMapping("/saveNavModuleParams")
    @ResponseBody
    public String saveNavModuleParams(HttpServletRequest request, String templateId, String navModuleId) {

        String[] navTitle = request.getParameterValues("navTitle");

        if (checkNavTitle(navTitle)) {
            return error("标题不能为空，请完善！").toString();
        }

        String[] navParamsId = request.getParameterValues("navParamsId");
        String[] linkUrl = request.getParameterValues("linkUrl");
        Integer[] getBlank = new Integer[0];
       for(int i = 0; i<navTitle.length;i++){
           String a = request.getParameter("blank_"+i+"");
           if(StringUtils.isNotBlank(a)){
               getBlank = (Integer[]) ArrayUtils.add(getBlank,1);
           }else{
               getBlank = (Integer[]) ArrayUtils.add(getBlank,0);
           }
           if(StringUtils.isBlank(navParamsId[i]) && StringUtils.isNotEmpty(navModuleId)){
               navParamsId[i] = visibleNavParamService.saveNavParam(navModuleId,templateId, VisibleModuleConstants.LMCMS_MODULE_NAV,
                        navTitle[i], linkUrl[i], getBlank[i]);
           }
       }
        JSONObject j = new JSONObject();
        VisibleTemplateModuleVOTemplateEntity template;
        if (StringUtils.isNotBlank(navModuleId)) {
            VisibleModuleEntity module = visibleModuleService.getEntity(navModuleId);
            template = new VisibleTemplateModuleVOTemplateEntity();
            template.setTemplate(module.getTemplateTemp());
        } else {
            template = visibleTemplateModuleService
                    .findByModuleKey(VisibleModuleConstants.LMCMS_MODULE_NAV);// 根据组件键获取配置模板
        }
        if (template != null) {
            String demoTemplate = template.getTemplate();
            try {

                Map<String, Object> m = new HashMap<>();
                m.putAll(TagMap.getTagMap());
                List<Map<String, Object>> navList = new ArrayList<>();
                for (int i = 0; i < navTitle.length; i++) {
                    Map<String, Object> navParam = new HashMap<>();
                    navParam.put("title", navTitle[i]);
                    navParam.put("linkUrl", linkUrl[i]);
                    navParam.put("blank",getBlank[i]);
                    navList.add(navParam);
                }
                m.put("navList", navList);
                String t = FreemarkerUtils.renderString(demoTemplate, m);
                template.setTemplate(t);
            } catch (IOException | TemplateException e) {
                e.printStackTrace();
                return j.accumulate("isSuccess", false).accumulate("msg",
                        "组件模板解析错误，请检查组件模板！").toString();
            }
            String id = navModuleId;
            if (StringUtils.isNotBlank(navModuleId)) {
                this.visibleNavParamService.updateNavModuleParam(templateId, navModuleId, navParamsId,
                        VisibleModuleConstants.LMCMS_MODULE_NAV, demoTemplate, navTitle, linkUrl, getBlank);
            } else {
                id = visibleModuleService.saveNavModuleAndParam(templateId, VisibleModuleConstants.LMCMS_MODULE_NAV,
                        demoTemplate, navTitle, linkUrl, getBlank);
            }
            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        } else {
            j.accumulate("isSuccess", false).accumulate("msg",
                    "找不到匹配的组件，即将自动移除刚才拖入的组件");
        }

        return j.toString();
    }

    /**
     * 验证导航标题是否有为空数据
     *
     * @param titles
     * @return 有空数据返回true，没有空数据返回false
     */
    private boolean checkNavTitle(String[] titles) {
        if (titles == null) {
            return true;
        }

        for (int i = 0; i < titles.length; i++) {
            if (StringUtils.isBlank(titles[i])) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取导航所选栏目的url
     * @param catId
     * @return
     */
    @RequestMapping("/getNavCatParam")
    @ResponseBody
    public String getNavCatParam(String catId){
        JSONObject j = new JSONObject();
        if(StringUtils.isNotEmpty(catId)){
            SiteEntity site = UserUtils.getSite();
              String domain = site.getProtocol() + site.getDomain();
            j.accumulate("domain", domain);
            String catUrl = visibleModuleService.getNavCatparam(catId);
                if(StringUtils.isEmpty(catUrl)){
                    j.accumulate("isSuccess", false).accumulate("msg", "获取栏目路径失败，请联系管理员");
                }
            j.accumulate("catUrl",catUrl);
            j.accumulate("isSuccess", true).accumulate("msg", "添加成功");
        }else{
            j.accumulate("isSuccess", false).accumulate("msg", "系统异常，请联系管理员");
        }
        return j.toString();
    }
    /**
     * 获取模板下所有组件以及替换参数的模板，
     *
     * @param templateId 模板id
     * @return
     */
    @RequestMapping("/getAllModuleFinallyTempalte")
    @ResponseBody
    public String getAllModuleFinallyTempalte(String templateId,String token) {

        SiteEntity site = UserUtils.getSite();
        String domain = site.getProtocol() + site.getDomain();

        Map<String, Object> moduleMap = new HashMap<>();
        List<VisibleModuleVOTempEntity> tempList = visibleModuleService.getTempLateTempList(templateId);//根据模板id获取模板中的所有模板组件，只要临时模板
        if (tempList != null && tempList.size() > 0) {
            for (int i = 0; i < tempList.size(); i++) {
                VisibleModuleVOTempEntity moduleTemp = tempList.get(i);

                Map<String, Object> params =  visibleModuleService.getModuleParams(moduleTemp.getId());
                this.visibleModuleService.initUrl(params, domain);

                String readyRenderTemplate = moduleTemp.getTemplateTemp();

                if( StringUtils.isNotEmpty(token) && token.equals("1") && VisibleModuleConstants.LMCMS_MODULE_PAINATION.equals(moduleTemp.getModuleKey())){
                    readyRenderTemplate = readyRenderTemplate.replaceAll("_catId","catalogidF");
                }
                if( StringUtils.isNotEmpty(token) && token.equals("1") && VisibleModuleConstants.LMCMS_MODULE_SINGLECONTENT.equals(moduleTemp.getModuleKey())){
                    readyRenderTemplate = readyRenderTemplate.replaceAll("_contentId","contentidF");
                }
                if( StringUtils.isNotEmpty(token) && token.equals("1") && VisibleModuleConstants.LMCMS_MODULE_CONTENT_LIST.equals(moduleTemp.getModuleKey())){
                    readyRenderTemplate = readyRenderTemplate.replaceAll("_pageindex","pageindexF");
                    readyRenderTemplate = readyRenderTemplate.replaceAll("_catId","catalogidF");
                    readyRenderTemplate = readyRenderTemplate.replaceAll("_flag","true");
                }
                if (MapUtils.isNotEmpty(params)) {
                    //替换模板中的表单参数
                    for (String key : params.keySet()) {
                        String value = oConvertUtils.getString(params.get(key), "");
                        readyRenderTemplate = readyRenderTemplate.replaceAll("_" + key, "\"" + value + "\"");
                    }
                }
                if(VisibleModuleConstants.LMCMS_MODULE_NAV.equals(moduleTemp.getModuleKey())){
                    if(StringUtils.isNotBlank(readyRenderTemplate)){
                        try{
                            readyRenderTemplate = FreemarkerUtils.renderString(
                                    readyRenderTemplate, params);
                        }catch (IOException | TemplateException e){
                            LogUtil.error("模板解析错误",e);
                        }
                    }
                }
                if (VisibleModuleConstants.LMCMS_MODULE_IMAGE.equals(moduleTemp.getModuleKey())) {
                    if (StringUtils.isNotBlank(readyRenderTemplate)) {
                        try {
                            readyRenderTemplate = FreemarkerUtils.renderString(
                                    readyRenderTemplate, params);
                        } catch (IOException | TemplateException e) {
                            LogUtil.error("模板解析出错", e);
                        }
                    }
                }

                moduleMap.put("module_" + moduleTemp.getId(), readyRenderTemplate);

            }
        }
        JSONObject j = new JSONObject();
        j.accumulateAll(moduleMap);
        return j.toString();
    }

    @RequestMapping("/getEmbedContentParam")
    @ResponseBody
    public String getEmbedContentParam(HttpServletRequest reqeust){
        String moduleId = reqeust.getParameter("moduleId");
        VisibleModuleEntity visibleModule = visibleModuleService.getEntity(moduleId);
        VisibleEmbedContentParamEntity visibleEmbedContentParamEntity = visibleEmbedContentParamServicel.getEmbedContentparam(moduleId);
        JSONObject j = new JSONObject();
        if(visibleModule!=null){
            j = success("参数获取成功")
                    .accumulate("moduleKey",visibleModule.getModuleKey())
                    .accumulate("contentId",visibleEmbedContentParamEntity.getContentId())
                    .accumulate("moduleId",moduleId)
                    .accumulate("paramId",visibleEmbedContentParamEntity.getId());

        }
        return j.toString();
    }
    /**
     * 单篇文章组件显示
     * @param reqeust
     * @return
     */
    @RequestMapping("/getEmbedContent")
    public ModelAndView getEmbedContent(HttpServletRequest reqeust) {
        String moduleId = reqeust.getParameter("moduleId");

        Map<String, Object> m = new HashMap<>();
        if(StringUtils.isEmpty(moduleId)){
            List<ContentsEntity> contentsEntityList = visibleEmbedContentParamServicel.getContentsModule();
            m.put("contentList",contentsEntityList);
        }else{
            List<ContentsEntity> contentsEntityList = visibleEmbedContentParamServicel.getContentsModule();
            m.put("contentList",contentsEntityList);
            VisibleEmbedContentParamEntity visibleEmbedContentParamEntity = visibleEmbedContentParamServicel.getEmbedContentparam(moduleId);
            if(visibleEmbedContentParamEntity != null) {
                m.put("contentId",visibleEmbedContentParamEntity.getContentId());
            }
        }
        return new ModelAndView("cms/visibletemplate/contentListModule", m);
    }

    @RequestMapping("saveEmbedContentTemplate")
    @ResponseBody
    public  String saveEmbedContentTemplate(String moduleId, String templateId, String contentId,String paramId){

        VisibleTemplateModuleVOTemplateEntity template;

        if (StringUtils.isNotBlank(moduleId)) {
            VisibleModuleEntity module = visibleModuleService.getEntity(moduleId);
            template = new VisibleTemplateModuleVOTemplateEntity();
            template.setTemplate(module.getTemplateTemp());
        } else {
            template = visibleTemplateModuleService
                    .findByModuleKey(VisibleModuleConstants.LMCMS_MODULE_SINGLECONTENT);// 根据组件键获取配置模板
        }

        JSONObject j = new JSONObject();
        if(template != null){
            String demoTemplate = template.getTemplate();
            try {
                Map<String,Object> map = new HashedMap();
                map.putAll(TagMap.getTagMap());
                map.put("_contentId",contentId);
                String t = FreemarkerUtils.renderString(demoTemplate, map);
                template.setTemplate(t);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (TemplateException e) {
                e.printStackTrace();
                return j.accumulate("isSuccess", false).accumulate("msg",
                        "组件模板解析错误，请检查组件模板！").toString();
            }
            String id = paramId;
            if(StringUtils.isNotEmpty(paramId)){
                boolean updateFlag = visibleEmbedContentParamServicel.updateEmbedContentParma(contentId,paramId);
                if(!updateFlag){
                    return error("更新错误，参数错误").toString();
                }
            }else{
                id = visibleEmbedContentParamServicel.saveEmbedContentParma(templateId,VisibleModuleConstants.LMCMS_MODULE_SINGLECONTENT,demoTemplate,contentId);
            }
            j = j.fromObject(template, JsonConfig.getInstance());
            j.accumulate("id", id);
            j.accumulate("isSuccess", true).accumulate("msg", "成功");
        }else{
            j.accumulate("isSuccess", false).accumulate("msg",
                    "找不到匹配的组件，即将自动移除刚才拖入的组件");
        }

        return j.toString();
    }
}
