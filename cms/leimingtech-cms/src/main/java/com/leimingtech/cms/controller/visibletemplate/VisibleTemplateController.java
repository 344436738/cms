package com.leimingtech.cms.controller.visibletemplate;

import com.leimingtech.cms.core.util.FreemarkerUtils;
import com.leimingtech.cms.entity.visibletemplate.VisibleModuleVOTempEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateModuleVODemoEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleModuleServiceI;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateModuleServiceI;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateServiceI;
import com.leimingtech.cms.tag.lmtag.TagMap;
import com.leimingtech.core.common.CmsConstants;
import com.leimingtech.common.Globals;
import com.leimingtech.core.common.PlatformConstants;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.*;
import com.leimingtech.core.util.json.JsonConfig;
import freemarker.template.TemplateException;
import net.sf.json.JSONObject;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @version V1.0
 * @Title: Controller
 * @Description: 可视化模板
 * @date 2016-10-09 14:38:11
 */
@Controller
@RequestMapping("/visibleTemplateController")
public class VisibleTemplateController extends BaseController {

    private String message;
    /**
     * 可视化模板接口
     */
    @Autowired
    private VisibleTemplateServiceI visibleTemplateService;
    /**
     * 系统接口
     */
    @Autowired
    private SystemService systemService;

    /**
     * 可视化模板组件配置接口
     */
    @Autowired
    private VisibleTemplateModuleServiceI visibleTemplateModuleService;
    /**
     * 可视化模板组件接口
     */
    @Autowired
    private VisibleModuleServiceI visibleModuleService;

    @RequestMapping("/design")
    public ModelAndView design(String id, Integer templateType) {

        VisibleTemplateEntity visibleTemplate = null;

        if (StringUtils.isNotBlank(id)) {
            visibleTemplate = visibleTemplateService.getEntity(id);
        }

        if (visibleTemplate == null) {
            visibleTemplate = new VisibleTemplateEntity();
            visibleTemplate.setTemplateType(templateType);
        }

        SiteEntity site = UserUtils.getSite();
        String domain = site.getProtocol() + site.getDomain();

        Map<String, Object> tagmap = TagMap.getTagMap();
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("domain", domain);
        m.put("site", site);
        m.putAll(tagmap);

        Map<String, Object> moduleMap = new HashMap<>();

        List<VisibleModuleVOTempEntity> tempList = visibleModuleService.getTempLateTempList(id);//根据模板id获取模板中的所有模板组件，只要临时模板
        if (tempList != null && tempList.size() > 0) {
            for (int i = 0; i < tempList.size(); i++) {
                VisibleModuleVOTempEntity moduleTemp = tempList.get(i);

                Map<String, Object> params = visibleModuleService.getModuleParams(moduleTemp.getId());
                this.visibleModuleService.initUrl(params, domain);
                params.putAll(tagmap);
                params.put("domain", domain);

                String result = "";
                if (StringUtils.isNotBlank(moduleTemp.getTemplateTemp())) {
                    String readyRenderTemplate = moduleTemp.getTemplateTemp();
                    if (MapUtils.isNotEmpty(params)) {
                        //替换模板中的表单参数
                        for (String key : params.keySet()) {
                            String value = oConvertUtils.getString(params.get(key), "");
                            readyRenderTemplate = readyRenderTemplate.replaceAll("_" + key, "\"" + value + "\"");
                        }
                    }
                    try {
                        result = FreemarkerUtils.renderString( readyRenderTemplate, params);
                    } catch (IOException | TemplateException e) {
                        LogUtil.error("模板解析出错", e);
                    }
                }
                moduleMap.put("module_" + moduleTemp.getId(), result);

            }
        }

        m.putAll(moduleMap);
        Map<String, Object> data = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(visibleTemplate.getVisibleTemplate())) {
            try {
                String t = FreemarkerUtils.renderString(
                        visibleTemplate.getVisibleTemplate(), m);
                data.put("visibleTemplate", t);
            } catch (IOException | TemplateException e) {
                e.printStackTrace();
            }
        }

        List<VisibleTemplateModuleVODemoEntity> demoList = visibleTemplateModuleService
                .AllDemo();// 获取所有可视化模板组件，demo模板
        data.put("visibleTemplateModuleList", demoList);
        data.put("domain", domain);
        data.put("site", site);
        data.put("templateId", id);
        String[] cssArray=null;
        if(StringUtils.isNotEmpty(visibleTemplate.getCssPath())){
            cssArray=visibleTemplate.getCssPath().split(";");
        }
        data.put("cssArray",cssArray);
        return new ModelAndView("/cms/visibletemplate/design/index", data);
    }

    /**
     * 预览模板
     *
     * @param template
     * @return
     */
    @RequestMapping("/preview")
    public ModelAndView preview(String template, String id) {

        SiteEntity site = UserUtils.getSite();
        String domain = site.getProtocol() + site.getDomain();

        Map<String, Object> m = new HashMap<String, Object>();
        m.putAll(TagMap.getTagMap());
        m.put("domain", domain);
        m.put("site", site);
        String html = null;
        template = StringEscapeUtils.unescapeHtml(template);
        try {
            html = FreemarkerUtils.renderString(template, m);
        } catch (IOException | TemplateException e) {
            e.printStackTrace();
        }

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("view", html);
        data.put("domain", domain);
        data.put("site", site);

        VisibleTemplateEntity visibleTemplate = visibleTemplateService.getEntity(id);
        String[] cssArray=null;
        if(StringUtils.isNotEmpty(visibleTemplate.getCssPath())){
            cssArray=visibleTemplate.getCssPath().split(";");
        }
        data.put("cssArray",cssArray);
        return new ModelAndView("/cms/visibletemplate/preview", data);
    }

    /**
     * 可视化模板保存
     *
     * @param id              可视化模板id
     * @param template        模板
     * @param visibleTemplate 保留可视化控件的模板
     * @param moduleIds       模板中最终保留的组件
     * @return
     */
    @RequestMapping("/saveTemplate")
    @ResponseBody
    public String saveTemplate(String id, String template, String visibleTemplate, String moduleIds) {

        String[] moduleIdArray = null;
        if (StringUtils.isNotBlank(moduleIds)) {
            moduleIdArray = moduleIds.split(",");
        }

        JSONObject j = new JSONObject();
        boolean isSuccess = true;

        if (StringUtils.isNotEmpty(id)) {
            VisibleTemplateEntity t = visibleTemplateService.getEntity(id);
            message = "可视化模板【" + t.getTitle() + "】更新成功";
            try {
                template=StringEscapeUtils.unescapeHtml(template);
                MyBeanUtils.copyBeanNotNull2Bean(visibleTemplate, t);
                t.setTemplate(template);
                t.setVisibleTemplate(StringEscapeUtils.unescapeHtml(visibleTemplate));
                t.setUpdateBy(UserUtils.getUser().getId());
                t.setUpdateTime(new Date());
                boolean flag = visibleTemplateService.updateTemplate(t, moduleIdArray);
                if (!flag) {
                    return error("可视化模板【" + t.getTitle() + "】更新失败").toString();
                }
                visibleTemplateService.generateHtml(t.getTitle(),t.getCssPath(),template,UserUtils.getSite());//把模板信息导出模板文件

                j.accumulate("id", id);
                systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
                LogUtil.info(message);
            } catch (Exception e) {
                e.printStackTrace();
                message = "可视化模板【" + t.getTitle() + "】更新失败";
                LogUtil.error(message, e);
                isSuccess = false;
            }
        } else {
            isSuccess = false;
            message = "请传入id值！";
        }
        j.accumulate("isSuccess", isSuccess);
        j.accumulate("msg", message);
        String str = j.toString();
        return str;
    }

    /**
     * 可视化模板列表
     *
     * @param request
     */
    @RequestMapping(params = "list")
    public ModelAndView list(VisibleTemplateEntity visibleTemplate, HttpServletRequest request) {
        int pageSize = StringUtils.isEmpty(request.getParameter("pageSize")) ? PlatformConstants.PAGESIZE
                : Integer.valueOf(request.getParameter("pageSize"));
        int pageNo = StringUtils.isEmpty(request.getParameter("pageNo")) ? 1
                : Integer.valueOf(request.getParameter("pageNo"));
        Map param = request.getParameterMap();
        Map<String, Object> m = visibleTemplateService.getPageList(visibleTemplate, param,
                pageSize, pageNo);
        m.put("searchMap", param);
        m.put("pageNo", pageNo);
        m.put("pageSize", pageSize);
        m.put("actionUrl", "visibleTemplateController.do?list");
        return new ModelAndView("cms/visibletemplate/visibleTemplateList", m);
    }

    /**
     * 可视化模板添加
     *
     * @return
     */
    @RequestMapping(params = "add")
    public ModelAndView add(HttpServletRequest reqeust) {
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("visibleTemplate", new VisibleTemplateEntity());
        return new ModelAndView("cms/visibletemplate/visibleTemplate", m);
    }

    /**
     * 可视化模板更新
     *
     * @return
     */
    @RequestMapping(params = "edit")
    public ModelAndView edit(HttpServletRequest reqeust) {
        String id = reqeust.getParameter("id");
        VisibleTemplateEntity visibleTemplate = visibleTemplateService.getEntity(java.lang.String.valueOf(id));
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("visibleTemplate", visibleTemplate);
        return new ModelAndView("cms/visibletemplate/visibleTemplate", m);
    }

    /**
     * 可视化模板保存
     *
     * @return
     */
    @RequestMapping(params = "save")
    @ResponseBody
    public String save(VisibleTemplateEntity visibleTemplate) {
        JSONObject j = new JSONObject();
        boolean isSuccess = true;

        if (StringUtils.isNotEmpty(visibleTemplate.getId())) {
            message = "可视化模板【" + visibleTemplate.getTitle() + "】更新成功";
            VisibleTemplateEntity t = visibleTemplateService.getEntity(visibleTemplate.getId());
            try {
                MyBeanUtils.copyBeanNotNull2Bean(visibleTemplate, t);

                String userId = UserUtils.getUser().getId();
                Date date = new Date();
                t.setUpdateBy(userId);
                t.setUpdateTime(date);
                visibleTemplateService.saveOrUpdate(t);
                systemService.addLog(message, Globals.Log_Leavel_INFO,
                        Globals.Log_Type_UPDATE);
                LogUtil.info(message);
                visibleTemplateService.generateHtml(t.getTitle(),t.getCssPath(),t.getTemplate(),UserUtils.getSite());
            } catch (Exception e) {
                e.printStackTrace();
                message = "可视化模板【" + visibleTemplate.getTitle() + "】更新失败";
                LogUtil.error(message, e);
                isSuccess = false;
            }
        } else {
            message = "可视化模板【" + visibleTemplate.getTitle() + "】添加成功";

            visibleTemplate.setSiteId(UserUtils.getSiteId());
            String userId = UserUtils.getUser().getId();
            Date date = new Date();
            visibleTemplate.setUpdateBy(userId);
            visibleTemplate.setCreateBy(userId);
            visibleTemplate.setCreateTime(date);
            visibleTemplate.setUpdateTime(date);
            visibleTemplateService.save(visibleTemplate);
            LogUtil.info(message);
            systemService.addLog(message, Globals.Log_Leavel_INFO,
                    Globals.Log_Type_INSERT);
        }
        j.accumulate("isSuccess", isSuccess);
        j.accumulate("msg", message);
        j.accumulate("toUrl", "visibleTemplateController.do?list");
        String str = j.toString();
        return str;
    }

    /**
     * 可视化模板删除
     *
     * @return
     */
    @RequestMapping(params = "del")
    @ResponseBody
    public String del(HttpServletRequest request) {
        JSONObject j = new JSONObject();
        String id = request.getParameter("id");

        VisibleTemplateEntity visibleTemplate = visibleTemplateService.getEntity(id);
        message = "可视化模板【" + visibleTemplate.getId() + "】删除成功";
        visibleTemplateService.delete(visibleTemplate);
        LogUtil.info(message);
        systemService.addLog(message, Globals.Log_Leavel_INFO,
                Globals.Log_Type_DEL);
        j.accumulate("isSuccess", true);
        j.accumulate("msg", message);
        j.accumulate("toUrl", "visibleTemplateController.do?list");
        String str = j.toString();
        return str;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
