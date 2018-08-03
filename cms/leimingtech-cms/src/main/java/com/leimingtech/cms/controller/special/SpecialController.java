package com.leimingtech.cms.controller.special;

import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.base.entity.temp.ModelItemEntity;
import com.leimingtech.base.entity.temp.SpecialEntity;
import com.leimingtech.cms.controller.contents.ContentsbaseController;
import com.leimingtech.cms.entity.contents.ContentClassify;
import com.leimingtech.cms.entity.visibletemplate.VisibleTemplateEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleTemplateServiceI;
import com.leimingtech.core.service.ContentCatServiceI;
import com.leimingtech.core.service.ModelItemServiceI;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhangdaihao modify by linjm 20140402
 * @version V1.0
 * @Title: Controller
 * @Description: 专题
 * @date 2014-05-07 12:20:15
 */
@Controller
@RequestMapping("/specialController")
public class SpecialController extends ContentsbaseController {

    @Autowired
    private ModelItemServiceI modelItemService;
    /**
     * 可视化模板接口
     */
    @Autowired
    private VisibleTemplateServiceI visibleTemplateService;
    /**
     * 栏目接口
     */
    @Autowired
    private ContentCatServiceI contentCatService;
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


    /**
     * 专题添加
     *
     * @return
     */
    @RequestMapping(params = "addPageModel")
    public ModelAndView addPageModel(String contentCatId, String modelsId, Model model) {
        //区分添加/编辑页面
        String flag = "add";
        ContentCatEntity contentCat = contentCatService.getEntity(contentCatId);

        if (!"-1".equals(contentCat.getJsonid())) {
            List<ModelItemEntity> modelItemList = modelItemService.findByModelId(contentCat.getJsonid());
            model.addAttribute("modelItemList", modelItemList);
        }
        //当前人
        String markpeople = "";
        if (UserUtils.getUser() != null) {
            markpeople = UserUtils.getUser().getUserName();
            if (StringUtils.isEmpty(markpeople)) {
                markpeople = UserUtils.getUser().getRealName();
            }
        }
        ContentsEntity contents = new ContentsEntity();
        // 设置文章分类(1文章2组图3链接4视频5活动6投票7访谈8调查9专题)
        contents.setClassify(ContentClassify.CONTENT_SPECIAL);

        List<VisibleTemplateEntity> visibleTemplateList = visibleTemplateService.getSiteTemplate(UserUtils.getSiteId());

        Map<String, Object> m = new HashMap<String, Object>();
        m.put("special", new SpecialEntity());
        m.put("contents", contents);
        m.put("contentCat", contentCat);
        m.put("modelsId", modelsId);
        m.put("flag", flag);
        m.put("markpeople", markpeople);
        m.put("memberinfo", UserUtils.getUser());
        m.put("visibleTemplateList", visibleTemplateList);
        return new ModelAndView("cms/special/special_open", m);
    }
}
