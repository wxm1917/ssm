/**
 * 持久化操作类，针对单表的数据库操作（单表是可以包含外键的表，但是不会对外键关联的表做任何操作） 前提条件 
 * 1.数据库中的字段必须全大写，主键字段名称为（表名+ID）
 * 2.数据库中的表必须单主键，不能是联合主键 
 * 3.bo对象必须继承DomainObject，类名和属性名按java命名规范
 * 4.持有的对象，对象名称必须与类名称一致，首字母小写，bo对象中的属性与数据库表一一对应，不能多于或少于 查询条件annotation 
 * 1.必须继承PageListObject
 * 2.类注释@SearchTable ，具体查看@SearchTable类 
 * 3.属性注释@SearchField，具体查看@SearchField类
 * Author:zhengQiang 2013-6-19 业务对象基类 Domain Object
 */
package com.vatestar.server.common.dao;

import java.util.List;

import com.vatestar.server.common.bo.DomainObject;
import com.vatestar.server.common.bo.PageListObject;

public interface Dao {

	/**
	 * 获取数据库类型
	 * 
	 * @return
	 */
	public DataBaseType getDataBaseType();

	/**
	 * 保存操作
	 * 
	 * @param bo
	 * @param useGeneratedKeySupport
	 *            true把自动生成的主键，写入到domainObject 的主键中
	 * @throws DaoException
	 */
	public void save(DomainObject bo, boolean useGeneratedKeySupport) throws DaoException;

	/**
	 * 更新操作，按bo中的值进行更新，null也将被更新，按selectBo中的值进行筛选
	 * 
	 * @param bo
	 * @param selectBo
	 * @throws DaoException
	 */
	public void update(DomainObject bo, DomainObject selectBo) throws DaoException;

	/**
	 * 更新操作，按bo中非NULL的值进行更新，NULL将被忽略不更新，按selectBo中的值进行筛选
	 * 
	 * @param bo
	 * @param selectBo
	 * @throws DaoException
	 */
	public void updateSpecial(DomainObject bo, DomainObject selectBo) throws DaoException;

	/**
	 * 删除操作，按DomainObject中的条件，进行删除
	 * 
	 * @param bo
	 * @throws DaoException
	 */
	public void delete(DomainObject bo) throws DaoException;

	/**
	 * 批量删除操作，按Object[]中的一组主键，对Class表进行删除操作
	 * 
	 * @param domainObject
	 * @param ids
	 * @throws DaoException
	 */
	public void bulkDeleteByIds(Class<? extends DomainObject> domainObject, Object[] ids)
	        throws DaoException;

	/**
	 * 查询单一数据操作，通过主键进行查询
	 * 
	 * @param bo
	 * @return
	 * @throws DaoException
	 */
	public DomainObject findById(DomainObject bo) throws DaoException;

	/**
	 * 查询总数操作，通过查询条件查询总数
	 * 
	 * @param po
	 * @return
	 * @throws DaoException
	 */
	public Integer findCount(PageListObject po) throws DaoException;

	/**
	 * 查询一组数据操作，通过查询条件进行查询
	 * 
	 * @param po
	 * @return
	 * @throws DaoException
	 */
	public List<? extends DomainObject> findList(PageListObject po) throws DaoException;

	/**
	 * 查询一组数据，把DomainObject中不为null的属性，用and进行拼装成查询条件，进行查询
	 * 
	 * @param bo
	 * @return
	 * @throws DaoException
	 */
	public List<? extends DomainObject> findListBySimpleCondition(DomainObject bo)
	        throws DaoException;

	/**
	 * 分页查询一组数据，按PageListObject中的分页数据和查询条件进行查询
	 * 
	 * @param po
	 * @return
	 * @throws DaoException
	 */
	public List<? extends DomainObject> findListByPage(PageListObject po) throws DaoException;

}
