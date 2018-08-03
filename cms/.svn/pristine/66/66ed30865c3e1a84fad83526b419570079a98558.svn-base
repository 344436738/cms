package com.leimingtech.cms.service.impl.visibletemplate;

import com.leimingtech.cms.entity.visibletemplate.VisibleContentParamEntity;
import com.leimingtech.cms.service.visibletemplate.VisibleContentParamServiceI;
import com.leimingtech.common.hqlsearch.HqlGenerateUtil;
import com.leimingtech.common.hibernate.qbc.CriteriaQuery;
import com.leimingtech.common.hibernate.qbc.PageList;
import com.leimingtech.core.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: interface
 * @Description: 内容条件接口实现
 * @author
 * @date 2016-11-17 17:27:57
 * @version V1.0
 * 
 */
@Service("visibleContentParamService")
@Transactional
public class VisibleContentParamServiceImpl implements VisibleContentParamServiceI {
	
	/** 公共Dao接口 */
	@Autowired
	private CommonService commonService;
	
	/**
	 * 保存内容条件
	 * 
	 * @param visibleContentParam
	 * @return
	 */
	public java.lang.String save(VisibleContentParamEntity visibleContentParam) {
		return (java.lang.String) commonService.save(visibleContentParam);
	}

	/**
	 * 更新内容条件
	 * 
	 * @param visibleContentParam
	 */
	@Override
	public void saveOrUpdate(VisibleContentParamEntity visibleContentParam) {
		commonService.saveOrUpdate(visibleContentParam);
	}

	/**
	 * 通过id获取内容条件
	 * 
	 * @param id
	 *            内容条件id
	 * @return
	 */
	@Override
	public VisibleContentParamEntity getEntity(java.lang.String id) {
		return commonService.getEntity(VisibleContentParamEntity.class, id);
	}

	/**
	 * 获取分页后的内容条件数据集
	 * 
	 * @param visibleContentParam
	 * @param param
	 *            字段结尾含有"_begin"或"_end"的查询条件，无此类型时传参null
	 * @param pageSize
	 *            每页获取数量
	 * @param pageNo
	 *            当前页码
	 * @return visibleContentParamList内容条件数据集 pageCount总页数
	 */
	@Override
	public Map<String, Object> getPageList(VisibleContentParamEntity visibleContentParam, Map param,
			int pageSize, int pageNo) {
		CriteriaQuery cq = new CriteriaQuery(VisibleContentParamEntity.class, pageSize, pageNo,
				"", "");
		// 查询条件组装器
		HqlGenerateUtil.installHql(cq, visibleContentParam, param);
		cq.add();
		PageList pageList = commonService.getPageList(cq, true);
		List<VisibleContentParamEntity> resultList = pageList.getResultList();

		int pageCount = (int) Math.ceil((double) pageList.getCount()
				/ (double) pageSize);
		if (pageCount <= 0) {
			pageCount = 1;
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("visibleContentParamList", resultList);
		m.put("pageCount", pageCount);
		return m;
	}

	/**
	 * 删除内容条件
	 * 
	 * @param visibleContentParam
	 */
	@Override
	public void delete(VisibleContentParamEntity visibleContentParam) {
		commonService.delete(visibleContentParam);
	}

	/**
	 * 通过组件获取参数
	 *
	 * @param moduleId
	 * @return
	 */
	@Override
	public Map<String, Object> getParamByModuleId(String moduleId) {
		String sql=" select id \"paramsId\",catid \"catId\",count \"count\",image \"image\" from visible_content_param where module_id = ? ";
		return this.commonService.findOneForJdbc(sql,moduleId);
	}
	/**
	 * 通过组件获取参数
	 *
	 * @param moduleId
	 * @return
	 */
	@Override
	public Map<String, Object> getParam(String moduleId) {
		String sql=" select id \"paramsId\",catid \"catId\",count \"count\" from visible_content_list_param where module_id = ? ";
		return this.commonService.findOneForJdbc(sql,moduleId);
	}

	/**
	 * 修改组件参数
	 * @param paramsId 参数主键id
	 * @param  catId - 模板参数：栏目id
	 * @param count - 模板参数：获取数量
	 * @param image - 是否必须包含缩略图
	 */
	@Override
	public int updateModuleParam(String paramsId, String catId, int count, int image) {
		String sql = " update visible_content_param set catid = ? , count = ? , image = ? where id = ?";
		return this.commonService.executeSql(sql, catId, count, image , paramsId);
	}

	/**
	 * 删除模板中所有参数数据
	 *
	 * @param templateId 模板id
	 * @return
	 */
	@Override
	public int deleteByTemplateId(String templateId) {
		return this.commonService.executeSql(" delete from visible_content_param where template_id = ? ", templateId);
	}

	/**
	 * 根据moduleId获取分页组件参数
	 * @param moduleId
	 * @return
	 */
	@Override
	public Map<String, Object> getPainationByModuleId(String moduleId) {
		String sql=" select id \"paramsId\",catid \"catId\" from visible_pagination_param where module_id = ? ";
		return this.commonService.findOneForJdbc(sql,moduleId);
	}

}