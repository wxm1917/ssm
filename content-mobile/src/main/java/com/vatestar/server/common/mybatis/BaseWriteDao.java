/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.mybatis;

import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.sql.DataSource;

import org.apache.ibatis.jdbc.SqlRunner;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.scripting.xmltags.DynamicSqlSource;
import org.apache.ibatis.scripting.xmltags.TextSqlNode;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;

import com.vatestar.server.common.bo.DomainObject;
import com.vatestar.server.common.bo.PageListObject;
import com.vatestar.server.common.core.ReflectionUtil;
import com.vatestar.server.common.dao.Dao;
import com.vatestar.server.common.dao.DaoException;
import com.vatestar.server.common.dao.DataBaseType;

public class BaseWriteDao extends SqlSessionDaoSupport implements Dao {

	private DataBaseType dataBaseType;

	public DataBaseType getDataBaseType() {
		return dataBaseType;
	}

	public void setDataBaseType(DataBaseType dataBaseType) {
		this.dataBaseType = dataBaseType;
	}

	private Map<String, Object> getConnectionMap() throws SQLException {
		// 有事务的时候由spring管理数据库连接
		DataSource dataSource = getSqlSession().getConfiguration().getEnvironment()
		        .getDataSource();
		java.sql.Connection conn = DataSourceUtils.getConnection(dataSource);
		SqlRunner sqlRunner = new SqlRunner(conn);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dataSource", dataSource);
		map.put("connetction", conn);
		map.put("sqlRunner", sqlRunner);
		return map;
	}

	public void save(DomainObject bo, boolean useGeneratedKeySupport) throws DaoException {
		Map<String, Object> map = null;
		try {
			map = getConnectionMap();
			SQLInfo sqlInfo = new BaseSQLBuilder(dataBaseType).insert(bo);
			// sqlRunner = getSqlRunner();
			SqlRunner sqlRunner = (SqlRunner) map.get("sqlRunner");
			sqlRunner.setUseGeneratedKeySupport(useGeneratedKeySupport);
			int id = sqlRunner.insert(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
			if (useGeneratedKeySupport) {
				String idField = bo.getClass().getSimpleName() + "Id";
				for (Field f : bo.getClass().getDeclaredFields()) {
					if (f.getName().toLowerCase().equals(idField.toLowerCase())) {
						Object value = null;
						if (f.getType().isAssignableFrom(Integer.class)) {
							value = id;
						} else if (f.getType().isAssignableFrom(Long.class)) {
							value = Long.valueOf(String.valueOf(id));
						} else if (f.getType().isAssignableFrom(String.class)) {
							value = String.valueOf(id);
						}
						ReflectionUtil.setFieldValue(f, bo, value);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(map);
		}
	}

	// 批量存储
	public void batchSave(List<DomainObject> listbo) throws DaoException {
		if (null == listbo || listbo.isEmpty())
			return;
		Map<String, Object> map = null;
		int n = listbo.size();
		try {
			map = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) map.get("sqlRunner");
			for (int i = 0; i < n; i++) {
				DomainObject bo = listbo.get(i);
				SQLInfo sqlInfo = new BaseSQLBuilder(dataBaseType).insert(bo);
				sqlRunner.insert(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(map);
		}
	}

	private BoundSql doBoundSql(SQLInfo sqlInfo) {
		TextSqlNode node = new TextSqlNode(sqlInfo.getSql());
		DynamicSqlSource s = new DynamicSqlSource(getSqlSession().getConfiguration(), node);// 此外对于静态SQL，ibatis还提供了StaticSqlSource
		return s.getBoundSql(sqlInfo.getKeysMap());
	}

	public void bulkDeleteByIds(Class<? extends DomainObject> cls, Object[] ids)
	        throws DaoException {
		Map<String, Object> map = null;
		try {
			map = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) map.get("sqlRunner");
			SQLInfo sqlInfo = new BaseSQLBuilder(dataBaseType).bulkDeleteByIds(cls, ids);
			sqlRunner.delete(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(map);
		}
	}

	public void delete(DomainObject bo) throws DaoException {
		Map<String, Object> map = null;
		try {
			map = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) map.get("sqlRunner");
			SQLInfo sqlInfo = new BaseSQLBuilder(dataBaseType).delete(bo);
			sqlRunner.delete(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(map);
		}
	}

	public DomainObject findById(DomainObject bo) throws DaoException {
		Map<String, Object> map = null;
		try {
			map = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) map.get("sqlRunner");
			SQLInfo sqlInfo = new BaseSelectBuilder(dataBaseType).findById(bo);
			Map<String, Object> mapb;
			try {
				mapb = sqlRunner.selectOne(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
			} catch (SQLException e) {
				if (e.getMessage().indexOf("Statement returned ") == 0) {
					return null;
				}
				throw e;
			}
			bo = SQLBuilderUtil.mapToBo(mapb, bo);
			return bo;
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(map);
		}
	}

	public List<? extends DomainObject> findListBySimpleCondition(DomainObject bo)
	        throws DaoException {
		Map<String, Object> map = null;
		List<DomainObject> domainObjects = new ArrayList<DomainObject>();
		try {
			SQLInfo sqlInfo = new BaseSelectBuilder(dataBaseType).findBySimpleCondition(bo);
			map = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) map.get("sqlRunner");

			List<Map<String, Object>> list = sqlRunner.selectAll(doBoundSql(sqlInfo).getSql(),
			        sqlInfo.getValues());
			for (Map<String, Object> mapb : list) {
				domainObjects.add(SQLBuilderUtil.mapToBo(mapb, bo.getClass().newInstance()));
			}
			return domainObjects;
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(map);
		}
	}

	public Integer findCount(PageListObject po) throws DaoException {
		Map<String, Object> mapC = null;
		try {
			SQLInfo sqlInfo = new BaseSelectBuilder(dataBaseType).findCount(po);
			mapC = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) mapC.get("sqlRunner");
			Map<String, Object> map = sqlRunner
			        .selectOne(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
			if (map != null && map.size() > 0) {
				Set<String> set = map.keySet();
				Iterator<String> iterator = set.iterator();
				while (iterator.hasNext()) {
					String key = iterator.next();
					return Integer.valueOf(String.valueOf(map.get(key)));
				}
			}
			return null;
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(mapC);
		}
	}

	public List<? extends DomainObject> findList(PageListObject po) throws DaoException {
		Map<String, Object> mapC = null;
		List<DomainObject> domainObjects = new ArrayList<DomainObject>();
		try {
			SQLInfo sqlInfo = new BaseSelectBuilder(dataBaseType).findList(po);
			mapC = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) mapC.get("sqlRunner");
			List<Map<String, Object>> list = sqlRunner.selectAll(doBoundSql(sqlInfo).getSql(),
			        sqlInfo.getValues());

			if (po.getClass().isAnnotationPresent(SearchTable.class)) {
				SearchTable searchTable = po.getClass().getAnnotation(SearchTable.class);
				Class<? extends DomainObject> cls = searchTable.cls();
				for (Map<String, Object> map : list) {
					domainObjects.add(SQLBuilderUtil.mapToBo(map, cls.newInstance()));
				}
			}
			return domainObjects;
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(mapC);
		}
	}

	public List<? extends DomainObject> findListByPage(PageListObject po) throws DaoException {
		Map<String, Object> mapC = null;
		List<DomainObject> domainObjects = new ArrayList<DomainObject>();
		try {
			po.calculate(findCount(po));
			SQLInfo sqlInfo = new BaseSelectBuilder(dataBaseType).findListByPage(po);
			mapC = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) mapC.get("sqlRunner");

			List<Map<String, Object>> list = sqlRunner.selectAll(doBoundSql(sqlInfo).getSql(),
			        sqlInfo.getValues());
			if (po.getClass().isAnnotationPresent(SearchTable.class)) {
				SearchTable searchTable = po.getClass().getAnnotation(SearchTable.class);
				Class<? extends DomainObject> cls = searchTable.cls();
				for (Map<String, Object> map : list) {
					domainObjects.add(SQLBuilderUtil.mapToBo(map, cls.newInstance()));
				}
			}
			return domainObjects;
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(mapC);
		}
	}

	public void update(DomainObject bo, DomainObject selectBo) throws DaoException {
		Map<String, Object> mapC = null;
		try {
			SQLInfo sqlInfo = new BaseSQLBuilder(dataBaseType).update(bo, selectBo);
			mapC = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) mapC.get("sqlRunner");
			sqlRunner.update(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(mapC);
		}
	}

	public void updateSpecial(DomainObject bo, DomainObject selectBo) throws DaoException {
		Map<String, Object> mapC = null;
		try {
			SQLInfo sqlInfo = new BaseSQLBuilder(dataBaseType).updateSpecial(bo, selectBo);
			mapC = getConnectionMap();
			SqlRunner sqlRunner = (SqlRunner) mapC.get("sqlRunner");
			sqlRunner.update(doBoundSql(sqlInfo).getSql(), sqlInfo.getValues());
		} catch (Exception e) {
			throw new DaoException(e.getMessage(), e);
		} finally {
			releaseConnection(mapC);
		}
	}

	private void releaseConnection(Map<String, Object> map) {
		if (null != map)
			DataSourceUtils.releaseConnection((java.sql.Connection) map.get("connetction"),
			        (DataSource) map.get("dataSource"));
	}

}
