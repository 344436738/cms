package com.leimingtech.cms.tag.macrotag;

import com.leimingtech.base.entity.temp.ArticleMobileEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.tag.base.BaseDirective;
import com.leimingtech.cms.tag.base.DirectiveHandler;
import com.leimingtech.base.entity.temp.ArticleEntity;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.util.StringUtils;
import freemarker.template.TemplateException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wy on 2017/3/6.
 */
@Component
public class SingleContentTag extends BaseDirective {
    private static final String PARAM_NAME_CONTENTID = "contentId";

    @Autowired
    private CommonService commonService;

    @Override
    public void execute(DirectiveHandler handler) throws TemplateException, IOException {
        String contentId = handler.getString(PARAM_NAME_CONTENTID, "");

        CriteriaQuery cq = new CriteriaQuery(ContentsEntity.class);

        Map<String,Object> param=new HashMap<String,Object>();

        DetachedCriteria dc = cq.getDetachedCriteria();
        ProjectionList pList = Projections.projectionList();
        pList.add(Projections.property("digest").as("digest"));
        pList.add(Projections.property("published").as("published"));
        pList.add(Projections.property("sourceid").as("sourceid"));
        pList.add(Projections.property("title").as("title"));
        pList.add(Projections.property("tags").as("tags"));
        dc.setProjection(pList);
        dc.setResultTransformer(Transformers.aliasToBean(ContentsEntity.class));
        cq.eq("id",contentId);
        cq.add();
        List<Object> contentEList = commonService.getListByCriteriaQuery(cq,false);
        List<ArticleEntity> articleList = commonService.findByProperty(ArticleEntity.class, "contentid", contentId);
        if (articleList != null && articleList.size() > 0) {
            ArticleEntity article = articleList.get(0);
            article.setContent(replaceWapStr(article.getContent()));
            param.put("articleData", article);
        }else{
            param.put("articleData", new ArticleMobileEntity());
        }

        if(contentEList!=null && contentEList.size()>0){
            param.put("content",contentEList.get(0));
        }else{
            param.put("content",new ContentsEntity());
        }
        handler.putAll(param);
        handler.render();
    }

    public String replaceWapStr(String str) {
        if (StringUtils.isNotEmpty(str)) {
            str = str.replaceAll("<html>", "");
            str = str.replaceAll("<head>", "");
            str = str.replaceAll("</head>", "");
            str = str.replaceAll("<body>", "");
            str = str.replaceAll("</body>", "");
            str = str.replaceAll("</html>", "");

        }
        return str;
    }
}
