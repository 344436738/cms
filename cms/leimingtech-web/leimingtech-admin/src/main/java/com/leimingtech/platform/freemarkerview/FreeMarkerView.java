package com.leimingtech.platform.freemarkerview;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * freemarker视图中增加tomcat上下文值
 * Created by liuzhen on 2017/5/6.
 */
public class FreeMarkerView extends org.springframework.web.servlet.view.freemarker.FreeMarkerView {
    private static final String CONTEXT_PATH = "base";

    @Override
    protected void exposeHelpers(Map<String, Object> model,
                                 HttpServletRequest request) throws Exception {
        model.put(CONTEXT_PATH, request.getContextPath());
        super.exposeHelpers(model, request);
    }
}
