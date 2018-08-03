package com.leimingtech.cms.service.impl.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.VisibleImageParamEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleImageParamServiceI;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 可视化图片条件接口实现
 * @author
 * @date 2016-11-25 18:18:27
 * @version V1.0
 * 
 */
@Service("visibleImageParamService")
@Transactional
public class VisibleImageParamServiceImpl implements VisibleImageParamServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	
	/**
	 * 保存可视化图片条件
	 * 
	 * @param visibleImageParam
	 * @return
	 */
	public java.lang.String save(VisibleImageParamEntity visibleImageParam) {
		return (java.lang.String) commonService.save(visibleImageParam);
	}

	/**
	 * 更新可视化图片条件
	 * 
	 * @param visibleImageParam
	 */
	@Override
	public void saveOrUpdate(VisibleImageParamEntity visibleImageParam) {
		commonService.saveOrUpdate(visibleImageParam);
	}

	/**
	 * 通过id获取可视化图片条件
	 * 
	 * @param id
	 *            可视化图片条件id
	 * @return
	 */
	@Override
	public VisibleImageParamEntity getEntity(java.lang.String id) {
		return commonService.getEntity(VisibleImageParamEntity.class, id);
	}

	/**
	 * 获取分页后的可视化图片条件数据集
	 * 
	 * @param visibleImageParam
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleImageParamList可视化图片条件数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(VisibleImageParamEntity visibleImageParam, Map param,
										   int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(VisibleImageParamEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, visibleImageParam, param);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<VisibleImageParamEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleImageParamList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除可视化图片条件
	 * 
	 * @param visibleImageParam
	 */
	@Override
	public void delete(VisibleImageParamEntity visibleImageParam) {
		commonService.delete(visibleImageParam);
	}

	/**
	 * 修改图片组件参数
	 *
	 * @param imageParamsId 图片组件参数id
	 * @param imageUrl      图片地址
	 * @param imageWidth    图片宽度
	 * @param imageHeight   图片高度
	 * @param description   描述
	 * @param linkUrl       链接地址
	 * @param blank         新窗口打开（1、是；0、否）
	 * @return 数据库修改影响的行数
	 */
	@Override
	public boolean updateImageModuleParam(String imageParamsId, String imageUrl, Integer imageWidth, Integer imageHeight,
										  String description, String linkUrl, Integer blank) {

		VisibleImageParamEntity imageParam = this.getEntity(imageParamsId);
		if (imageParam == null) {
			return Boolean.FALSE;
		}

		String userId = UserUtils.getUser().getId();
		Date date = new Date();

		imageParam.setImageUrl(imageUrl);
		imageParam.setWidth(imageWidth);
		imageParam.setHeight(imageHeight);
		imageParam.setDescription(description);
		imageParam.setLinkUrl(linkUrl);
		imageParam.setBlank(blank);
		imageParam.setUpdateTime(date);
		imageParam.setUpdateBy(userId);

		this.commonService.saveOrUpdate(imageParam);

		return Boolean.TRUE;
	}

	/**
	 * 获取组件的参数
	 *
	 * @param moduleId
	 * @return
	 */
	@Override
	public Map<String, Object> getParamByModuleId(String moduleId) {

		CriteriaQuery cq = new CriteriaQuery(VisibleImageParamEntity.class);

		//指定要返回的列
		DetachedCriteria dc = cq.getDetachedCriteria();
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("id").as("id"));
		pList.add(Projections.property("imageUrl").as("imageUrl"));
		pList.add(Projections.property("width").as("width"));
		pList.add(Projections.property("height").as("height"));
		pList.add(Projections.property("description").as("description"));
		pList.add(Projections.property("linkUrl").as("linkUrl"));
		pList.add(Projections.property("blank").as("blank"));
		dc.setProjection(pList);
		dc.setResultTransformer(Transformers.aliasToBean(VisibleImageParamEntity.class));

		cq.eq("moduleId", moduleId);
		cq.add();

		List<VisibleImageParamEntity> data = this.commonService.getListByCriteriaQuery(cq, false);
		if (data != null && data.size() > 0) {
			VisibleImageParamEntity imageParam = data.get(0);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("paramsId", imageParam.getId());
			params.put("imageUrl", imageParam.getImageUrl());
			params.put("width", imageParam.getWidth() == 0 ? "" : imageParam.getWidth());
			params.put("height", imageParam.getHeight() == 0 ? "" : imageParam.getHeight());
			params.put("title", imageParam.getDescription());
			params.put("linkUrl", imageParam.getLinkUrl());
			params.put("blank", imageParam.getBlank());
			return params;
		}
		return null;
	}

	/**
	 * 删除模板中的所有参数数据
	 *
	 * @param templateId
	 * @return
	 */
	@Override
	public int deleteByTemplateId(String templateId) {
		return this.commonService.executeSql(" delete from visible_image_param where template_id = ? ", templateId);
	}

}