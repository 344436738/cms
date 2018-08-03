package com.leimingtech.cms.service.impl.visibletemplate;

import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleEmbedContentParamEntity;
import com.leimingtech.cms.entity.visibletemplate.VisibleModuleEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleEmbedContentParamServicel;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.PlatFormUtil;
import com.leimingtech.core.util.UserUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by wy on 2017/3/13.
 * 可视化：嵌入单篇文章组件实现类
 */
@Service
@Transactional
public class VisibleEmbedContentParamServiceImpl implements VisibleEmbedContentParamServicel{

    /** 公共Dao接口 */
    @Autowired
    private CommonService commonService;

    /**
     * 保存可视化模板组件
     *
     * @param visibleModule
     * @return
     */
    public java.lang.String save(VisibleModuleEntity visibleModule) {
        return (java.lang.String) commonService.save(visibleModule);
    }

    /**
     * 更新单篇文章参数
     * @param contentId
     * @param paramsId
     * @return
     */
    @Override
    public boolean updateEmbedContentParma( String contentId,String paramsId) {
        String userId= UserUtils.getUser().getId();
        String sql = "update visible_embedcontent_param set content_id = ?,update_by = ? where id = ?";
        commonService.executeSql(sql,contentId,userId,paramsId);
        return true;
    }

    /**
     * 保存单篇文章组件参数
     * @param templateId
     * @param moduleKey
     * @param demoTemplate
     * @param contentId
     * @return
     */
    @Override
    public String saveEmbedContentParma(String templateId, String moduleKey, String demoTemplate, String contentId) {
        VisibleModuleEntity module=new VisibleModuleEntity();
        module.setModuleKey(moduleKey);
        module.setTemplate(demoTemplate);
        module.setTemplateTemp(demoTemplate);
        module.setTemplateId(templateId);
        String userId= UserUtils.getUser().getId();
        Date date=new Date();
        module.setCreateBy(userId);
        module.setCreateTime(date);
        module.setUpdateBy(userId);
        module.setUpdateTime(date);
        module.setSiteId(UserUtils.getSiteId());
        String moduleId= this.save(module);
        VisibleEmbedContentParamEntity visibleEmbedContentParamEntity = new VisibleEmbedContentParamEntity();
        visibleEmbedContentParamEntity.setContentId(contentId);
        visibleEmbedContentParamEntity.setModuleKey(moduleKey);
        visibleEmbedContentParamEntity.setCreateTime(date);
        visibleEmbedContentParamEntity.setUpdateBy(userId);
        visibleEmbedContentParamEntity.setModuleId(moduleId);
        visibleEmbedContentParamEntity.setSiteId(UserUtils.getSiteId());
        visibleEmbedContentParamEntity.setTemplateId(templateId);
        commonService.save(visibleEmbedContentParamEntity);
        return moduleId;
    }

    /**
     * 获取最新发布的十条内容
     * @return
     */
    @Override
    public List<ContentsEntity> getContentsModule() {
        CriteriaQuery cq = new CriteriaQuery(ContentsEntity.class, 10, 1,
                "", "");
        SiteEntity site = UserUtils.getSite();
        DetachedCriteria dc = cq.getDetachedCriteria();
        ProjectionList pList = Projections.projectionList();
        pList.add(Projections.property("id").as("id"));
        pList.add(Projections.property("digest").as("digest"));
        pList.add(Projections.property("published").as("published"));
        pList.add(Projections.property("sourceid").as("sourceid"));
        pList.add(Projections.property("title").as("title"));
        pList.add(Projections.property("tags").as("tags"));
        dc.setProjection(pList);
        dc.setResultTransformer(Transformers.aliasToBean(ContentsEntity.class));
        cq.eq("siteid",site.getId());
        cq.eq("classify","1");
        cq.add();
        List<ContentsEntity> contentEList = commonService.getListByCriteriaQuery(cq,true);
        return contentEList;
    }

    @Override
    public VisibleEmbedContentParamEntity getEmbedContentparam(String id) {
        return commonService.findUniqueByProperty(VisibleEmbedContentParamEntity.class,"moduleId",id);
    }

    @Override
    public Map<String, Object> getEmbedCotentById(String moduleId) {
        String sql = "select content_id \"contentId\" from visible_embedcontent_param where module_id = ? ";
        return this.commonService.findOneForJdbc(sql,moduleId);
    }
}
