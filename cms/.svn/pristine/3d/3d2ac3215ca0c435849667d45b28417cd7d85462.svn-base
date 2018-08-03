package com.leimingtech.cms.controller.contentcat;

import com.leimingtech.base.entity.model.ModelsEntity;
import com.leimingtech.cms.service.contribute.ContributeConfigServiceI;
import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.base.entity.temp.ContentCatEntity;
import com.leimingtech.base.entity.temp.ModelManageEntity;
import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.core.service.*;
import com.leimingtech.core.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * @Title: Controller
 * @Description: 栏目
 * @author zhangdaihao modify by linjm 20140402
 * @date 2014-04-21 12:03:25
 * @version V1.0
 * 
 */
@Controller
@RequestMapping("/contentCatController")
public class ContentCatController extends BaseController {
	private String message = null;

	@Autowired
	private SystemService systemService;
	@Autowired
	private ModelsServiceI modelsService;
	@Autowired
	private ModelManageServiceI modelManageService;
	
	/**栏目管理接口*/
	@Autowired
	private ContentCatServiceI contentCatService;
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	/** 投稿配置接口 */
	@Autowired
	private ContributeConfigServiceI contributeConfigService;

	/**
	 * 列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "contentCat")
	public ModelAndView contentCat(HttpServletRequest request) {
		
        String id = request.getParameter("id");
		
		ContentCatEntity cat ;
		List<ContentCatEntity> catList ;
		if (StringUtils.isNotEmpty(id) && !"-1".equals(id)) {
			cat = contentCatService.getEntity(id);
			catList = contentCatService.getListByPid(id);
		} else {
			cat = new ContentCatEntity();
			cat.setName("顶级栏目");
			catList = contentCatService.getRootContentCat();
		}

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("jstreeData", contentCatService.getTreeJson(cat,UserUtils.getSiteId()).toString());
		m.put("parentFunction", cat);
		m.put("catList", catList);
		
		return new ModelAndView("cms/contentcat/contentCatList", m);
	}
	
	
	/**
	 * 加载下级
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "Table")
	public ModelAndView Table(HttpServletRequest request) {
		String id = request.getParameter("id");
		ContentCatEntity parent = null;
		List<ContentCatEntity> catList = null;
		if (StringUtils.isEmpty(id)||"-1".equals(id)) {
			// 点击顶级菜单
			parent = new ContentCatEntity();
			parent.setId(null);
			parent.setName("顶级栏目");
			catList=contentCatService.getRootContentCat();
		} else {
			parent = contentCatService.getEntity(String.valueOf(id));
			catList=contentCatService.getListByPid(java.lang.String.valueOf(id));
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("parentFunction", parent);
		m.put("catList", catList);
		m.put("selectId", id);
		// 三级级联菜单第一级
	
		//m.put("list_test", list);
		return new ModelAndView("cms/contentcat/contentCat", m);

	}

	/**
	 * 修改
	 *
	 * @param test
	 * @param request
	 * @return
	 */

	@RequestMapping(params = "editModel")
	public ModelAndView editModel(HttpServletRequest request) {
		String id = request.getParameter("id");
		String selectId = request.getParameter("selectId");
		ContentCatEntity contentCat = null;
		if (StringUtils.isNotBlank(id)) {
			contentCat = contentCatService.getEntity(id);
		} else {
			String parentId = request.getParameter("parentId");
			contentCat = new ContentCatEntity();
			ContentCatEntity parent = new ContentCatEntity();
			if (StringUtils.isNotBlank(parentId)) {
				parent.setId(parentId);
			}
			contentCat.setContentCat(parent);
		}
		// 用于获取模型模块
		List<ModelsEntity> modelsList = modelsService.getAllOpenModels();

		// 获取modelManage的名称用于选择扩展字段
		List<ModelManageEntity> modelManageList = modelManageService.getAll();

		JSONObject jsonobj = new JSONObject();
		JSONObject jsonobjList = null;
		if(StringUtils.isNotEmpty(contentCat.getJsonid())){
			jsonobj = JSONObject.fromObject(contentCat.getTemplateIndex());
			jsonobjList = JSONObject.fromObject(contentCat.getTemplateList());
		}
		Map<String, Object> m = new HashMap<String, Object>();

		m.put("jsonobj", jsonobj);
		m.put("jsonobjList", jsonobjList);
		m.put("contentCat", contentCat);
		m.put("selectId", selectId);
		m.put("modelsList", modelsList);
		m.put("modelManageList", modelManageList);
		return new ModelAndView("cms/contentcat/contentCatEdit", m);
	}


	// 树更新跳转
	@RequestMapping(params = "update")
	@ResponseBody
	public String update(ContentCatEntity contentCat, HttpServletRequest request) {
		String jsonid = request.getParameter("jsonid");
		JSONObject json1 = new JSONObject();
		JSONObject json2 = new JSONObject();
		List<ModelsEntity> mapList = modelsService.getAllOpenModels();
		if (mapList.size() > 0) {
			for (int j = 0; j < mapList.size(); j++) {
				ModelsEntity model = mapList.get(j);
				String name = model.getName();
				String templateshow = request.getParameter("templateshow" + j);
				String templateIndex = request.getParameter("templateIndex" + j);
				json1.put(name, templateIndex);
				json2.put(name, templateshow);
				if("文章".equals(name)&&"true".equals(templateIndex)){
					contentCat.setIsArticleSelected("true");//文章选中
					
				}
			}
		}
		JSONObject j = new JSONObject();
		j.accumulate("isSuccess", true);
		if (contentCat.getContentCat() != null && contentCat.getContentCat().getId() == null) {
			contentCat.setContentCat(null);
		}
		
		SiteEntity site = UserUtils.getSite();
		
		if (StringUtils.isNotEmpty(contentCat.getId())) {
			//有 id  为修改
			message = "栏目["+contentCat.getName()+"]更新成功";
			String contentCatId = contentCat.getId();
			ContentCatEntity t = contentCatService.getEntity(contentCat.getId());//获取 原来的栏目实体

			String uniqueCode = request.getParameter("uniqueCode");
			String siteid = site.getId();
			//对 标识 唯一判断
			Integer count = contentCatService.checkUniqueCodeIsExist(contentCatId,uniqueCode, siteid);//验证网站标识是否已经存在
			if (count>0) {
				//修改时 查找出 不止一个
				return error("该标识已经被占用，请更换").toString();
			}
			contentCat.setUniqueCode(uniqueCode);//用于存数据库
			
			Boolean isChange=false;
			if(!StringUtils.equals(contentCat.getAlias(), t.getAlias())){
				//如果别名被修改，也需要把生成路径也更改，包括子栏目路径
				isChange=true;
			}
			
			//调整投稿配置
			if (contentCat.getIscontribute() != t.getIscontribute()) {
				if (contentCat.getIscontribute() == 1) {
					contributeConfigService.add(contentCat.getId(),
							contentCat.getName(), site.getId());// 增加一项投稿栏目
				}else{
					contributeConfigService.deleteByCatId(contentCat.getId());//删除一项投稿栏目
				}
			}
			
			try {
				MyBeanUtils.copyBeanNotNull2Bean(contentCat, t);
				t.setTemplateIndex(json1.toString());
				t.setTemplateList(json2.toString());
				if(StringUtils.isNotEmpty(jsonid)){
					t.setJsonid(String.valueOf(jsonid));
				}
				contentCatService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
				
				if(isChange){
					//如果别名被修改，也需要把生成路径也更改，包括子栏目路径
					setContentCatPath(contentCat.getId());
				}
			} catch (Exception e) {
				e.printStackTrace();
				j.accumulate("isSuccess", false);
				message = "栏目"+contentCat.getName()+"更新失败";
			}

			j.accumulate("toUrl", "contentCatController.do?contentCat&id=" + contentCat.getId());
		} else {
			message = "栏目"+contentCat.getName()+"添加成功";

			if (contentCat.getContentCat() == null || StringUtils.isEmpty(contentCat.getContentCat().getId())) {

				contentCat.setLevels(0);
				contentCat.setParentids("0,");
				contentCat.setPathids("0,");
			} else {
				ContentCatEntity pcat = contentCat.getContentCat();
				pcat = contentCatService.getEntity(pcat.getId());
				if (pcat.getIscatend() == 1) {
					// 新添加的栏目父节点不为空 并且是根节点 更改节点状态
					pcat.setIscatend(0);
					pcat.setCreated(new Date());//创建时间
					contentCatService.save(pcat);
				}
				contentCat.setParentids(pcat.getParentids() + pcat.getId() + ",");
				contentCat.setPathids(pcat.getParentids() + pcat.getId() + ",");
				contentCat.setLevels(1);
			}
			contentCat.setTemplateIndex(json1.toString());
			contentCat.setTemplateList(json2.toString());
			if(StringUtils.isNotEmpty(jsonid)){
				contentCat.setJsonid(String.valueOf(jsonid));
			}
			
			if (contentCat.getIscontribute() == 1) {
				contributeConfigService.add(contentCat.getId(),
						contentCat.getName(), site.getId());// 增加一项投稿栏目
			}
			
			contentCat.setSiteid(site.getId());
			contentCat.setIscatend(1);// 新添加的都是根节点
			contentCat.setCreated(new Date());//创建时间
			contentCatService.save(contentCat);
			contentCat.setPathids(contentCat.getPathids() + contentCat.getId());
			contentCatService.saveOrUpdate(contentCat);
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
			// 设置栏目生成路径
			setContentCatPath(contentCat.getId());
			j.accumulate("toUrl", "contentCatController.do?contentCat&id=" +contentCat.getId());
		}
		
		j.accumulate("msg", message);
		String str = j.toString();
		return str;
	}

	/**
	 * 设置栏目生成路径
	 * @param contentCat
	 */
	private void setContentCatPath(String contentCatId) {
		
		ContentCatEntity contentCat = contentCatService.getEntity(contentCatId);
		
		String thisPath = "";
		if (StringUtils.isNotEmpty(contentCat.getAlias())) {
			thisPath = contentCat.getAlias().trim();
		} else {
			if (StringUtils.isEmpty(contentCat.getContentcatAbbreviation())) {
				contentCat.setContentcatAbbreviation(PinyinUtil.getPinYinHeadChar(contentCat.getName().trim()));
			}
			thisPath = contentCat.getContentcatAbbreviation();
		}
		thisPath += "/";
		
		if (contentCat.getContentCat() != null && StringUtils.isNotEmpty(contentCat.getContentCat().getId())) {
			ContentCatEntity pcontentcat = contentCatService.getEntity(contentCat.getContentCat().getId());
			contentCat.setPath(pcontentcat.getPath() + thisPath);
			
		} else {
			contentCat.setPath(thisPath);
		}
		contentCatService.saveOrUpdate(contentCat);
	
		List<ContentCatEntity> child = contentCatService.getListByPid(contentCat.getId());
		if(child!=null && child.size()>0){
			for (int i = 0; i < child.size(); i++) {
				setContentCatPath(child.get(i).getId());
			}
		}
	}


	/**
	 * 获取名称拼音
	 * 
	 * @param test
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "pyChange")
	@ResponseBody
	public String pyChange(HttpServletRequest request) {
		String name = request.getParameter("name").trim();
		String str = "";
		try {
			str = java.net.URLDecoder.decode(name, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String quanpin = PinyinUtil.hanziToPinyin(str, "");// 全拼
		String acronym = PinyinUtil.getPinYinHeadChar(str);// 首字母
		JSONObject j = new JSONObject();
		JSONObject json = new JSONObject();
		j.accumulate("quanpin", quanpin);
		j.accumulate("acronym", acronym);
		str = j.toString();
		return str;
	}
	/**
	 * 批量添加栏目页面
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "batchCat")
	public ModelAndView batchCat(HttpServletRequest request) {
		String catId = request.getParameter("selectId");
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("catId", catId);
		return new ModelAndView("cms/contentcat/batchCat", m);
	}
	
	@RequestMapping(params = "importCatalog")
	@ResponseBody
	public String importCatalog(HttpServletRequest request) {
		String parentID = request.getParameter("catPId");
		String templateIndex = request.getParameter("templateIndex");
		String templateList = request.getParameter("templateList");
		String listModel = request.getParameter("listModel");
		String text =request.getParameter("BatchColumn");
		
		String[] catas = text.split("\n");
		List<ContentCatEntity> catList = new ArrayList<ContentCatEntity>();
		String pId = "";
		if(StringUtils.isNotEmpty(parentID)){
			pId = String.valueOf(parentID);
		}
		JSONObject json = new JSONObject();
		ContentCatEntity pCat = contentCatService.getEntity(pId);
		try {
			message = "批量添加栏目【";
			json.accumulate("toUrl", "contentCatController.do?contentCat&id=" + pCat.getId());

			for(int i=0;i<catas.length;i++){
				String cata = catas[i];
				// 如果当前行为空，则退出本次循环
				if (StringUtils.isEmpty(cata.trim())) {
					continue;
				}
				message+=cata;
				cata = StringUtils.toDBC(cata);
				cata = StringUtils.rightTrim(cata);
				int length = 0;
				for (int k = 0; k < cata.length(); k++) {
					if (cata.charAt(k) != ' ') {
						length = k;
						break;
					}
				}
				int currentLevel = length / 2;
				//新建每条栏目
				ContentCatEntity contentCat = new ContentCatEntity();
				contentCat.setName(cata.trim());
				String quanpin = PinyinUtil.hanziToPinyin(cata.trim(), "");// 全拼
				String acronym = PinyinUtil.getPinYinHeadChar(cata.trim());// 首字母
				contentCat.setContentcatSpell(quanpin);
				contentCat.setContentcatAbbreviation(acronym);
				contentCat.setSiteid(UserUtils.getSiteId());
				contentCat.setJsonid("-1");
				contentCat.setTemplateIndex(templateIndex);
				contentCat.setTemplateList(templateList);
				contentCat.setWorkflowid("0");
				contentCat.setListModel(listModel);
				contentCat.setIsshow("1");
				if(pCat==null){
					contentCat.setLevels(currentLevel);
					contentCat.setParentids("0,");
					contentCat.setPathids("0,");
				}else{
					contentCat.setParentids(pCat.getParentids() + pCat.getId() + ",");
					contentCat.setPathids(pCat.getParentids() + pCat.getId() + ",");
					contentCat.setLevels(currentLevel);
				}
				
				if(pCat!=null && pCat.getIscatend() == 1){
					// 新添加的栏目父节点不为空 并且是根节点 更改节点状态
					pCat.setIscatend(0);
					pCat.setCreated(new Date());//创建时间

					contentCatService.save(pCat);
				}
				contentCat.setIscatend(1);
				contentCat.setCreated(new Date());//创建时间
				contentCatService.save(contentCat);
				if(0==currentLevel){//父节点
					contentCat.setPathids(contentCat.getParentids()+contentCat.getId()+",");
					if(pCat==null){
						contentCat.setLevels(0);
					}else{
						contentCat.setContentCat(pCat);
					}

					contentCatService.saveOrUpdate(contentCat);
				}
				// 设置栏目生成路径
				setContentCatPath(contentCat.getId());
				catList.add(contentCat);
			}
			for(int i=0;i<catList.size();i++){
				ContentCatEntity cati = catList.get(i);
				int level = cati.getLevels();
				String id = cati.getId();
				for(int j=i+1;j<catList.size();j++){
					ContentCatEntity catj = catList.get(j);
					if(catj.getLevels()<=level){
						break;
					}
					if(catj.getLevels()==level+1){//子节点
						catj.setParentids(catj.getParentids()+id+",");
						contentCatService.saveOrUpdate(catj);
						catj.setPathids(catj.getParentids()+catj.getId()+",");
						catj.setContentCat(cati);

						contentCatService.saveOrUpdate(catj);
						
						if(cati!=null && cati.getIscatend() == 1){
							// 新添加的栏目父节点不为空 并且是根节点 更改节点状态
							cati.setIscatend(0);
							cati.setCreated(new Date());//创建时间
							
							json.accumulate("toUrl", "contentCatController.do?contentCat&id=" +cati.getId());

							contentCatService.save(cati);
						}
						
						// 设置栏目生成路径
						setContentCatPath(catj.getId());
					}
				}
				//如果是父节点并且该节点作为根目录的子节点，需要更改level
				if(0==level&&cati.getContentCat()!=null){
					cati.setLevels(level+1);

					contentCatService.saveOrUpdate(cati);
				}
			}
			message+="】添加成功";
		} catch (Exception e) {
			message = "】添加失败";
		}
		
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		json.accumulate("isSuccess", true);
		json.accumulate("msg", message);
		//json.accumulate("toUrl", "contentCatController.do?contentCat");
		String str = json.toString();
		return str;
	}
	/**
	 * 删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		if (StringUtils.isEmpty(id)) {
			return error("id不能为空").toString();
		}

		ContentCatEntity contentCat = contentCatService.getEntity(String
				.valueOf(id));

		if (contentCat == null) {
			return error("id为" + id + "栏目不存在").toString();
		}
		
		String toUrl=null;
		
		if (contentCat.getContentCat() != null
				&& StringUtils.isNotEmpty(contentCat.getContentCat().getId())) {
			toUrl = "contentCatController.do?contentCat&id="
					+ contentCat.getContentCat().getId();
		} else {
			toUrl = "contentCatController.do?contentCat";
		}
		
		message = "栏目【"+contentCat.getName()+"】删除成功";
		contentCatService.delete(contentCat);
		
		systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_DEL);
		return success(message).accumulate("toUrl", toUrl).toString();
	}

	/**
	 * 左边树展示
	 * 
	 * @param requset
	 * @return
	 */
	@RequestMapping(params = "contentCatTree")
	public ModelAndView contentCatTree(HttpServletRequest requset) {
		String istree = requset.getParameter("istree");
		List<ContentCatEntity> list = contentCatService.getRootContentCat();
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("list", list);
		return new ModelAndView("cms/contentcat/leftcontentCatTree", m);
	}
	
	/**
	 * 添加链接地址
	 * 
	 * @param test
	 * @param request
	 * @return
	 */

	@RequestMapping(params = "editLinkURL")
	public ModelAndView editLinkURL(HttpServletRequest request) {
		String id = request.getParameter("id");
		String selectId = request.getParameter("selectId");
		ContentCatEntity contentCat = null;
		if (id != null && !"".equals(id)) {
			contentCat = contentCatService.getEntity(String.valueOf(id));
		} else {
			String parentId = request.getParameter("parentId");
			contentCat = new ContentCatEntity();
			ContentCatEntity parent = new ContentCatEntity();
			if (parentId != null && !"".equals(parentId)) {
				parent.setId(String.valueOf(parentId));
			}
			contentCat.setContentCat(parent);
		}
		
		Map<String, Object> m = new HashMap<String, Object>();
	
		m.put("contentCat", contentCat);
		m.put("selectId", selectId);
		return new ModelAndView("cms/contentcat/catLinkUrl", m);
	}

	/**
	 * 获取栏目的
	 * @return
     */
	@RequestMapping("/treeData")
	@ResponseBody
	public String treeData(){
		JSONObject obj=new JSONObject();
		JSONArray jsonArray=contentCatService.getzTreeData(UserUtils.getSiteId());
		obj.accumulate("isSuccess",true);
		obj.accumulate("ztreeData",jsonArray);
		return obj.toString();
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	
	}
}
