package com.leimingtech.api.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leimingtech.core.controller.BaseController;
import com.leimingtech.mobile.entity.advertisemen.AdvertisemenContentEntity;
import com.leimingtech.mobile.entity.advertisemen.AdvertisemenStartingEntity;
import com.leimingtech.mobile.service.advertisemen.AdvertisemenContentServiceI;
import com.leimingtech.mobile.service.advertisemen.AdvertisemenStartingServiceI;

/**
 * 移动平台的广告接口
 * 
 * @author zhangyulong
 * 
 */
@Controller
@RequestMapping(value = "/front/mobileAdvertisemenApi")
public class MobileAdvertisemenApi extends BaseController {
	private String error = "请求数据出错，请重试！";
	@Autowired
	private AdvertisemenStartingServiceI advertisemenStartingService = null;
	@Autowired
	private AdvertisemenContentServiceI advertisemenContentService = null;

	/**
	 * 获取所有的启动画面广告
	 * 
	 * @return 启动画面广告实体集合的JSON
	 */
	@RequestMapping(value = "/getListStarting")
	@ResponseBody
	public List getListAdvertisemenStarting() {
		List list = null;
		try {
			list = advertisemenStartingService.getList(AdvertisemenStartingEntity.class);
		} catch (Exception e) {// 请求出错 返回错误信息
			e.printStackTrace();
			list = new ArrayList<String>();
			list.add(error);
		}
		return list;
	}

	/**
	 * 获取分页的启动画面广告
	 * 
	 * @param pageNo
	 *            页码
	 * @param pageSize
	 *            页码尺寸
	 * @return 启动画面广告实体集合的JSON
	 */
	// @SuppressWarnings("null")
	// @RequestMapping(value =
	// "/getListStartingByPage/pageNo/{pageNo}/pageSize/{pageSize}")
	// public Map<String, Object>
	// getListAdvertisemenStarting(@PathVariable("pageNo") Integer pageNo,
	// @PathVariable("pageSize") Integer pageSize) {
	@RequestMapping(value = "/getListStartingByPage")
	@ResponseBody
	public Map<String, Object> getListAdvertisemenStarting(Integer pageNo, Integer pageSize) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = this.advertisemenStartingService.getListByPage(pageNo, pageSize);
		} catch (Exception e) { // 请求出错 返回错误信息
			e.printStackTrace();
			;
			map.put("error", error);
		}
		return map;
	}

	/**
	 * 获取启动画面广告根据ID
	 * 
	 * @param ID
	 *            启动画面广告实体类的ID
	 * @return 启动画面广告实体类的JSON
	 */
	// @RequestMapping(value = "/getStarting/{id}")
	// public Object getAdvertisemenStarting(@PathVariable("id") Integer id) {
	@RequestMapping(value = "/getStarting")
	@ResponseBody
	public Object getAdvertisemenStarting(String id, HttpServletRequest request) {
		AdvertisemenStartingEntity bean = null;
		try {
			bean = advertisemenStartingService.get(AdvertisemenStartingEntity.class, id);
			String imgUrl = bean.getImgUrl();
//			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+request.getContextPath() + imgUrl;
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + imgUrl;
			bean.setImgUrl(basePath);
			//System.out.println(basePath);

		} catch (Exception e) {// 请求出错 返回错误信息
			e.printStackTrace();
			return error;
		}
		return bean;
	}

	/**
	 * 获取所有的内容广告
	 * 
	 * @return 内容广告实体集合的JSON
	 */
	@RequestMapping(value = "/getListContent")
	@ResponseBody
	public List getListAdvertisemenContent() {
		List list = null;
		try {
			list = advertisemenContentService.getList(AdvertisemenContentEntity.class);
		} catch (Exception e) {// 请求出错 返回错误信息
			e.printStackTrace();
			list = new ArrayList<String>();
			list.add(error);
		}
		return list;
	}

	/**
	 * 获取分页的内容广告
	 * 
	 * @param pageNo
	 *            页码
	 * @param pageSize
	 *            页码尺寸
	 * @return 内容广告实体集合的JSON
	 */
	@RequestMapping(value = "/getListContentByPage")
	@ResponseBody
	public JSONObject getListAdvertisemenContent(HttpServletRequest request) {
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageNo");
		JSONObject jsonObject = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = this.advertisemenContentService.getListByPage(pageNo != null ? Integer.parseInt(pageNo) : 1,
					pageSize != null ? Integer.parseInt(pageSize) : 10);
		} catch (Exception e) { // 请求出错 返回错误信息
			map.put("error", error);
			e.printStackTrace();
		}
		jsonObject.putAll(map);
		return jsonObject;
	}

	/**
	 * 获取内容广告根据ID
	 * 
	 * @param ID
	 *            内容广告实体类的ID
	 * @return 内容广告实体类的JSON
	 */
	// @RequestMapping(value = "/getContent/{id}")
	// public Object getAdvertisemenContent(@PathVariable("id") Integer id) {
	@RequestMapping(value = "/getContent")
	@ResponseBody
	public Object getAdvertisemenContent(String id) {
		AdvertisemenContentEntity bean = null;
		try {
			bean = advertisemenContentService.get(AdvertisemenContentEntity.class, id);
		} catch (Exception e) {// 请求出错 返回错误信息
			e.printStackTrace();
			return error;
		}
		return bean;
	}
}
