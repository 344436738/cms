package com.leimingtech.platform.controller.classify;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.base.entity.temp.ClassifyEntity;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.core.service.ClassifyServiceI;
import com.leimingtech.core.service.SystemService;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.util.StringUtils;



/**   
 * @Title: Controller
 * @Description: 分类管理
 * @author zhangdaihao modify by linjm 20140402
 * @date 2014-04-09 09:43:53
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/classifyController")
public class ClassifyController extends BaseController {
	private static final Logger logger = Logger.getLogger(ClassifyController.class);
	private String message = null;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	@Autowired
	private ClassifyServiceI classifyService;
	@Autowired
	private SystemService systemService;

	/**
	 * 列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "classify")
	public ModelAndView function(HttpServletRequest request) {
		CriteriaQuery cq = new CriteriaQuery(ClassifyEntity.class);
		cq.eq("levels", 0);
		cq.add();
		List<ClassifyEntity> list = classifyService.getListByCriteriaQuery(cq, false);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("list", list);
		return new ModelAndView("lmPage/limengbo/classifyList", m);
	}
	
	/**
	 * 加载下级
	 * @param test
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "load")
	@ResponseBody
	public JSONArray loadMenu(HttpServletRequest request) {
		String id = request.getParameter("id");
		CriteriaQuery cq = new CriteriaQuery(ClassifyEntity.class);
		cq.eq("classify.id", String.valueOf(id));
		cq.add();
		List<ClassifyEntity> list = classifyService.getListByCriteriaQuery(cq, false);
		JSONArray jsonArray = new JSONArray();
		for(ClassifyEntity classify : list){
			JSONObject json = new JSONObject();
			if(classify.getClassifys() != null && classify.getClassifys().size() > 0){
				json.put("text", classify.getName());
				json.put("value", classify.getId());
				json.put("leaf", false);
				json.put("expanded", false);
				json.put("cls", "folder");
				json.put("id", classify.getId());
				json.put("href", "classifyController.do?load&id=" + classify.getId());
				json.put("data-role", "branch");
				json.put("children", new JSONArray());
			}else{
				json.put("text", classify.getName());
				json.put("value", classify.getId());
				json.put("leaf", true);
				json.put("href", "javascript:void(0);");
				json.put("data-role", "leaf");
				json.put("id", classify.getId());
				json.put("checked", false);
			}
			jsonArray.add(json);
		}
		return jsonArray;
	}
	
	/**
	 * 加载下级地区
	 * @param test
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "loads")
	@ResponseBody
	public String loadMenus(HttpServletRequest request) {
		String id = request.getParameter("id");
		CriteriaQuery cq = new CriteriaQuery(ClassifyEntity.class);
		cq.eq("classify.id", String.valueOf(id));
		cq.add();
		List<ClassifyEntity> list = classifyService.getListByCriteriaQuery(cq, false);
		JSONArray jsonArray = new JSONArray();
		for(ClassifyEntity classify : list){
			JSONObject json = new JSONObject();
			if(classify.getClassifys() != null && classify.getClassifys().size() > 0){
				json.put("text", classify.getName());
				json.put("value", classify.getId());
				json.put("leaf", false);
				json.put("expanded", false);
				json.put("cls", "folder");
				json.put("id", classify.getId());
				json.put("href", "classifyController.do?load&id=" + classify.getId());
				json.put("data-role", "branch");
				json.put("children", new JSONArray());
			}else{
				json.put("text", classify.getName());
				json.put("value", classify.getId());
				json.put("leaf", true);
				json.put("href", "javascript:void(0);");
				json.put("data-role", "leaf");
				json.put("id", classify.getId());
				json.put("checked", false);
			}
			jsonArray.add(json);
		}
		return jsonArray.toString();
	}
	
	/**
	 * 修改
	 * @param test
	 * @param request
	 * @return
	 */
	
	@RequestMapping(params = "editModelPage")
	public ModelAndView editModelPage(HttpServletRequest request){
		String id = request.getParameter("id");
		String selectId = request.getParameter("selectId");
		ClassifyEntity classify = null;
		if(id != null && !"".equals(id)){
			classify = classifyService.getEntity(ClassifyEntity.class, String.valueOf(id));
		}else{
			String parentId = request.getParameter("parentId");
			classify = new ClassifyEntity();
			ClassifyEntity parent = new ClassifyEntity();
				parent.setId(String.valueOf(parentId));
			classify.setClassify(parent);
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("classify", classify);
		m.put("selectId", selectId);
		return new ModelAndView("lmPage/limengbo/classifyeditModel", m);
	}
	
	@RequestMapping(params = "update")
	@ResponseBody
	public String update(ClassifyEntity classify, HttpServletRequest request) {
		JSONObject j = new JSONObject();
		if(classify.getClassify() != null && classify.getClassify().getId()==null){
			classify.setClassify(null);
		}
		if (StringUtils.isNotEmpty(classify.getId())) {
			message = "菜单信息["+classify.getName()+"]更新成功";
			ClassifyEntity t = classifyService.get(ClassifyEntity.class, classify.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(classify, t);
				classifyService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
			} catch (Exception e) {
				e.printStackTrace();
				message = "菜单信息["+classify.getName()+"]更新失败";
			}
		} else {
			message = "菜单信息["+classify.getName()+"]添加成功";
			if(classify.getClassify() == null){
			classify.setLevels(0);
			}else{
				classify.setLevels(1);
		
			}
			classify.setCreatedtime(new Date());//创建时间
			classifyService.save(classify);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		String str = j.toString();
		return str;
	}
	
	/**
	 * 加载下级
	 * @param test
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "Table")
	public ModelAndView menuTable(HttpServletRequest request) {
		String id = request.getParameter("id");
		ClassifyEntity parent = null;
		if(id != null && "".equals(id)){
			//点击顶级菜单
			parent = new ClassifyEntity ();
			parent.setId(null);
			parent.setName("顶级菜单");
		}else{
			parent =classifyService.getEntity(ClassifyEntity.class, String.valueOf(id));
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("parentFunction", parent);
		m.put("list", parent.getClassifys());
		m.put("selectId", id);
		//三级级联菜单第一级
		CriteriaQuery cq = new CriteriaQuery(ClassifyEntity.class);
		cq.eq("levels", 1);
		cq.add();
		List<ClassifyEntity> list =classifyService.getListByCriteriaQuery(cq, false);
		m.put("list_test", list);
		return new ModelAndView("lmPage/limengbo/classify", m);
		
	}
	

	/**
	 * 地域删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		JSONObject j = new JSONObject();
		String id = request.getParameter("id");
		
		ClassifyEntity classify = classifyService.getEntity(ClassifyEntity.class, String.valueOf(id));
		message = "文档信息["+classify.getName()+"]删除成功";
		classifyService.delete(classify);
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
		
		j.accumulate("isSuccess", true);
		j.accumulate("msg", message);
		j.accumulate("toUrl", "classifyController.do?classify");
		String str = j.toString();
		return str;
	}

}
