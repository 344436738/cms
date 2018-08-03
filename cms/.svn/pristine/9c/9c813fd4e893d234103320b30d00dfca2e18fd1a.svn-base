package com.leimingtech.core.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.leimingtech.base.entity.temp.*;
import com.leimingtech.common.entity.Autocomplete;
import com.leimingtech.common.hibernate.qbc.HqlQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

import com.leimingtech.common.hibernate.qbc.CriteriaQuery;

import com.leimingtech.common.hibernate.qbc.PageList;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;

public interface CommonService {

	<T> Serializable save(T entity);

	<T> void saveOrUpdate(T entity);

	<T> void delete(T entity);

	<T> void batchSave(List<T> entitys);

	/**
	 * 根据实体名称和主键获取实体
	 *
	 * @param <T>
	 * @param entityName
	 * @param id
	 * @return
	 */
	<T> T get(Class<T> class1, Serializable id);

	/**
	 * 根据实体名称和主键获取实体
	 *
	 * @param <T>
	 * @param entityName
	 * @param id
	 * @return
	 */
	<T> T getEntity(Class entityName, Serializable id);

	/**
	 * 根据实体名称和字段名称和字段值获取唯一记录
	 *
	 * @param <T>
	 * @param entityClass
	 * @param propertyName
	 * @param value
	 * @return
	 */
	<T> T findUniqueByProperty(Class<T> entityClass,
							   String propertyName, Object value);

	/**
	 * 按属性查找对象列表.
	 */
	<T> List<T> findByProperty(Class<T> entityClass,
							   String propertyName, Object value);

	/**
	 * 加载全部实体
	 *
	 * @param <T>
	 * @param entityClass
	 * @return
	 */
	<T> List<T> loadAll(final Class<T> entityClass);

	/**
	 * 删除实体主键删除
	 *
	 * @param <T>
	 * @param entities
	 */
	<T> void deleteEntityById(Class entityName, Serializable id);

	/**
	 * 删除实体集合
	 *
	 * @param <T>
	 * @param entities
	 */
	<T> void deleteAllEntitie(Collection<T> entities);

	/**
	 * 更新指定的实体
	 *
	 * @param <T>
	 * @param pojo
	 */
	<T> void updateEntitie(T pojo);

	/**
	 * 通过hql 查询语句查找对象
	 *
	 * @param <T>
	 * @param query
	 * @return
	 */
	<T> List<T> findByQueryString(String hql);

	/**
	 * 根据sql更新
	 *
	 * @param query
	 * @return
	 */
	int updateBySqlString(String sql);

	/**
	 * 通过sql更新记录
	 *
	 * @param sql
	 * @param objects 参数
	 * @return
	 */
	int updateBySql(final String sql, Object... objects);

	/**
	 * 根据sql查找List
	 *
	 * @param <T>
	 * @param query
	 * @return
	 */
	<T> List<T> findListbySql(String query);

	/**
	 * 通过属性称获取实体带排序
	 *
	 * @param <T>
	 * @param clas
	 * @return
	 */
	<T> List<T> findByPropertyisOrder(Class<T> entityClass,
									  String propertyName, Object value, boolean isAsc);

	<T> List<T> getList(Class clas);

	<T> T singleResult(String hql);

	/**
	 *
	 * cq方式分页
	 *
	 * @param cq
	 * @param isOffset
	 * @return
	 */
	PageList getPageList(final CriteriaQuery cq, final boolean isOffset);


	/**
	 *
	 * hqlQuery方式分页
	 *
	 * @param cq
	 * @param isOffset
	 * @return
	 */
	PageList getPageList(final HqlQuery hqlQuery,
						 final boolean needParameter);

	Session getSession();

	List findByExample(final String entityName,
					   final Object exampleEntity);

	/**
	 * 通过cq获取全部实体
	 *
	 * @param <T>
	 * @param cq
	 * @return
	 */
	<T> List<T> getListByCriteriaQuery(final CriteriaQuery cq,
									   Boolean ispage);

	HttpServletResponse viewOrDownloadFile(UploadFile uploadFile);

	/**
	 * 生成XML文件
	 *
	 * @param fileName
	 *            XML全路径
	 */
	HttpServletResponse createXml(ImportFile importFile);

	/**
	 * 解析XML文件
	 *
	 * @param fileName
	 *            XML全路径
	 */
	void parserXml(String fileName);


	/**
	 * 获取自动完成列表
	 *
	 * @param <T>
	 * @return
	 */
	<T> List<T> getAutoList(Autocomplete autocomplete);

	/**
	 * 执行SQL
	 */
	Integer executeSql(String sql, List<Object> param);

	/**
	 * 执行SQL
	 */
	Integer executeSql(String sql, Object... param);

	/**
	 * 执行SQL 使用:name占位符
	 */
	Integer executeSql(String sql, Map<String, Object> param);
	/**
	 * 执行SQL 使用:name占位符,并返回执行后的主键值
	 */
	Object executeSqlReturnKey(String sql, Map<String, Object> param);
	/**
	 * 通过JDBC查找对象集合 使用指定的检索标准检索数据返回数据
	 */
	List<Map<String, Object>> findForJdbc(String sql, Object... objs);

	/**
	 * 通过JDBC查询集合
	 * @param sql
	 * @param elementType
	 * @param args
	 * @return
	 */
	<T> List<T> findForList(String sql, Class<T> elementType, Object... args);

	/**
	 * 通过JDBC查找对象集合 使用指定的检索标准检索数据返回数据
	 */
	Map<String, Object> findOneForJdbc(String sql, Object... objs);

	/**
	 * 通过JDBC查找对象集合,带分页 使用指定的检索标准检索数据并分页返回数据
	 */
	List<Map<String, Object>> findForJdbc(String sql, int page, int rows);

	/**
	 * 通过JDBC查找对象集合,带分页 使用指定的检索标准检索数据并分页返回数据
	 */
	<T> List<T> findObjForJdbc(String sql, int page, int rows,
							   Class<T> clazz);

	/**
	 * 通过JDBC查找对象集合,带分页 使用指定的检索标准检索数据并分页返回数据
	 */
	<T> List<T> findObjForJdbc(String sql, int page, int rows,
							   Class<T> clazz,Object... objs);

	/**
	 * 使用指定的检索标准检索数据并分页返回数据-采用预处理方式
	 *
	 * @param criteria
	 * @param firstResult
	 * @param maxResults
	 * @return
	 * @throws DataAccessException
	 */
	List<Map<String, Object>> findForJdbcParam(String sql, int page,
											   int rows, Object... objs);

	/**
	 * 通过hql 查询语句查找对象
	 *
	 * @param <T>
	 * @param query
	 * @return
	 */
	<T> List<T> findHql(String hql, Object... param);

	<T> List<T> pageList(DetachedCriteria dc, int firstResult,
						 int maxResult);

	<T> List<T> findByDetached(DetachedCriteria dc);

	<T> List<T> query(String sql, RowMapper<T> clazz, Object... param) ;
}
