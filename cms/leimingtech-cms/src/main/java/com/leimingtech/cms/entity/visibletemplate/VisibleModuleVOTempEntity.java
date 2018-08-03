package com.leimingtech.cms.entity.visibletemplate;

/**模板中组件临时模板
 * Created by liuzhen on 2016/11/14.
 */
public class VisibleModuleVOTempEntity {

    private String id;
    /**组件key*/
    private String moduleKey;

    public String getModuleKey() {
        return moduleKey;
    }

    public void setModuleKey(String moduleKey) {
        this.moduleKey = moduleKey;
    }

    /**临时模板*/
    private String templateTemp;

    public String getTemplateTemp() {
        return templateTemp;
    }

    public void setTemplateTemp(String templateTemp) {
        this.templateTemp = templateTemp;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
