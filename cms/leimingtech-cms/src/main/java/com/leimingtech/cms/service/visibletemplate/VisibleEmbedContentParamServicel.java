package com.leimingtech.cms.service.visibletemplate;

import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleEmbedContentParamEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleModuleEntity;


import java.util.List;
import java.util.Map;

/**
 * 可视化：嵌入单篇文章组件接口
 * Created by wy on 2017/3/13.
 */
public interface VisibleEmbedContentParamServicel {

    /**
     * 保存可视化模板组件
     *
     * @param visibleModule
     * @return
     */
    java.lang.String save(VisibleModuleEntity visibleModule);

    /**
     * 更新单篇文章参数
     * @param contentId
     * @param moduleId
     * @return
     */
    boolean updateEmbedContentParma(String contentId, String moduleId);

    /**
     * 保存单篇文章组件
     * @param templateId
     * @param moduleKey
     * @param demoTemplate
     * @param contentId
     * @return
     */
    String saveEmbedContentParma(String templateId, String moduleKey, String demoTemplate, String contentId);

    /**
     * 获取最新发布的十篇文章
     * @return
     */
    List<ContentsEntity> getContentsModule();


    VisibleEmbedContentParamEntity getEmbedContentparam(String id);

    Map<String,Object> getEmbedCotentById(String moduleId);
}
