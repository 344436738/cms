package com.leimingtech.platform.controller.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.leimingtech.base.entity.vo.FunctionVOManager;
import com.leimingtech.core.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leimingtech.common.Globals;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.base.entity.temp.TSFunction;
import com.leimingtech.platform.service.function.FunctionServiceI;

/**
 * 菜单权限处理类
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/menuController")
public class MenuController extends BaseController {
	/**
	 * 菜单管理接口
	 */
	@Autowired
	private FunctionServiceI functionService;

	/**
	 * 菜单管理页面
	 *
	 * @return
	 */
	@RequestMapping(params = "menu")
	public ModelAndView menu() {

		List<FunctionVOManager> functionList = functionService.getAllFunctionAndSortThem();//获取所有的菜单并且进行排序

		Map<String, Object> m = new HashMap<>();
		m.put("functionList", functionList);
		return new ModelAndView("lmPage/menu/menuList", m);
	}

	@ResponseBody
	@RequestMapping("saveAllSort")
	public String saveAllSort(String[] id, int[] sort) {

		if (id.length == 0 || id.length != sort.length) {
			return super.error("提交的数据有误，无法保存排序！").toString();
		}
		functionService.batchUpdateSort(id, sort, UserUtils.getUser().getId());//批量修改排序

		return super.success("排序成功！").accumulate("toUrl", Globals.CONTEXTPATH + "/menuController.do?menu").toString();
	}

	/**
	 * 去添加页面
	 *
	 * @param parentId 父菜单id
	 * @return
	 */
	@RequestMapping("toAddView")
	public ModelAndView toAddView(String parentId) {

		if (com.leimingtech.common.utils.StringUtils.isBlank(parentId)) {
			parentId = "0";
		}

		Map<String, Object> m = new HashMap<>();
		TSFunction function = new TSFunction();
		function.setParentId(parentId);
		function.setFlag(0);
		m.put("function", function);
		return new ModelAndView("lmPage/menu/menu", m);
	}

	/**
	 * 去修改页面
	 *
	 * @return
	 */
	@RequestMapping("toUpdateView")
	public ModelAndView toAddUpdateView(String id) {

		TSFunction function = null;
		if (com.leimingtech.common.utils.StringUtils.isNotBlank(id)) {
			function = functionService.getEntity(id);
		}

		Map<String, Object> m = new HashMap<>();
		m.put("function", function);
		return new ModelAndView("lmPage/menu/menu", m);
	}

	/**
	 * 保存菜单
	 *
	 * @param function 菜单信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("save")
	public String save(TSFunction function) {

		String msg = "菜单添加成功";
		if (com.leimingtech.common.utils.StringUtils.isEmpty(function.getId())) {
			functionService.add(function);
		} else {
			functionService.update(function);
			msg = "菜单修改成功";
		}
		return super.success(msg).accumulate("toUrl", Globals.CONTEXTPATH + "/menuController.do?menu").toString();
	}

	/**
	 * 删除菜单
	 *
	 * @param function 菜单信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("del")
	public String del(String id) {

		int result = this.functionService.deleteById(id);

		return super.success("菜单删除成功").accumulate("toUrl", Globals.CONTEXTPATH + "/menuController.do?menu").toString();
	}

}
