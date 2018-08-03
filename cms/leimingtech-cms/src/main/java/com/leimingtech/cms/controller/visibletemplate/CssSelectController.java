package com.leimingtech.cms.controller.visibletemplate;

import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.core.common.CmsConstants;
import com.leimingtech.common.Globals;
import com.leimingtech.core.util.FileUtil;
import com.leimingtech.core.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileFilter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 站点下css选择
 * Created by liuzhen on 2017/2/20.
 */
@Controller
@RequestMapping("/cssSelectController")
public class CssSelectController extends BaseController {

    /**
     * 列表
     *
     * @return
     */
    @RequestMapping("list")
    public ModelAndView list(HttpServletRequest request) {
        // 子文件
        String filePath = request.getParameter("filePath");
        // 模板根目录
        String absolutePath = CmsConstants.getSitePath(ContextHolderUtils.getSession())+"css/";
        File file = new File(absolutePath);
        if (StringUtils.isNotEmpty(filePath)) {
            try {
                filePath=URLDecoder.decode(filePath,"UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            file = new File(absolutePath + "/" + filePath);
        }
        File[] child = file.listFiles(new FileFilter() {
            public boolean accept(File file) {

                if(file.isDirectory()){
                    return true;
                }
                // 只要.css文件
                if (file.getName().endsWith(".css")) {
                    return true;
                }
                return false;
            }
        });
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        if (child != null && child.length > 0) {
            for (int i = 0; i < child.length; i++) {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("isDirectory", child[i].isDirectory());
                map.put("fileName", child[i].getName());
                map.put("lastModifiedDate", sdf.format(child[i].lastModified()));
                map.put("size",
                        child[i].isDirectory() ? FileUtil.FormetFileSize(FileUtil.getFileSize(child[i])) : FileUtil.FormetFileSize(child[i]
                                .length()));
                String path = child[i].getAbsolutePath().replace("\\", "/");
                path = path.substring(path.indexOf("css/") + 4, path.length());
                map.put("filePath", path);
                list.add(map);
            }
        }
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("list", list);
        m.put("navigation", getFileNavigation(filePath));
        return new ModelAndView("cms/visibletemplate/cssSelect", m);
    }

    /**
     * 获取文件导航条
     *
     * @param filepath
     * @return String
     */
    public String getFileNavigation(String filepath) {
        if (StringUtils.isEmpty(filepath)) {
            return "";
        }
        String[] pathname = filepath.split("/");
        StringBuilder sb = new StringBuilder();
        String path = "";
        for (int i = 0; i < pathname.length; i++) {
            path += pathname[i] + "/";
            sb.append("<a href=\"javaScript:changeCSSPage('" + path + "');\">"
                    + pathname[i] + "> </a>");
        }
        return sb.toString();
    }
}
