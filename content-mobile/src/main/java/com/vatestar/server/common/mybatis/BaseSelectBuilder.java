/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.mybatis;

import static org.apache.ibatis.jdbc.SelectBuilder.BEGIN;
import static org.apache.ibatis.jdbc.SelectBuilder.FROM;
import static org.apache.ibatis.jdbc.SelectBuilder.ORDER_BY;
import static org.apache.ibatis.jdbc.SelectBuilder.SELECT;
import static org.apache.ibatis.jdbc.SelectBuilder.SQL;
import static org.apache.ibatis.jdbc.SelectBuilder.WHERE;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.vatestar.server.common.bo.DomainObject;
import com.vatestar.server.common.bo.PageListObject;
import com.vatestar.server.common.core.ReflectionUtil;
import com.vatestar.server.common.dao.DataBaseType;
import com.vatestar.server.exception.AnnotationException;

public class BaseSelectBuilder {

	private DataBaseType dataBaseType;

	public BaseSelectBuilder(DataBaseType dataBaseType) {
		this.dataBaseType = dataBaseType;
	}

	protected final static Log log = LogFactory.getLog(BaseSQLBuilder.class);

	public SQLInfo findBySimpleCondition(DomainObject bo) throws IllegalArgumentException,
	        IllegalAccessException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		SELECT("*");
		if (null != bo && null != bo.getClass().getAnnotation(TableName.class))
			FROM(bo.getClass().getAnnotation(TableName.class).name());
		else
			FROM(bo.getClass().getSimpleName().toUpperCase());
		for (Field f : bo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, bo);
				if (o != null) {
					WHERE(fieldName.toUpperCase() + " = #{" + fieldName + "}");
					map.put(fieldName, o);
					values.add(o);
				}
			} else if (SQLBuilderUtil.isDomainObjectType(f, bo)) {
				String id = fieldName + "Id";
				Object o = ReflectionUtil.getFieldValue(f, bo);
				for (Field subf : o.getClass().getDeclaredFields()) {
					if (subf.getName().toLowerCase().equals(id.toLowerCase())) {
						Object subo = ReflectionUtil.getFieldValue(subf, o);
						if (subo != null) {
							WHERE(subf.getName().toUpperCase() + " = #{" + fieldName + "."
							        + subf.getName() + "}");
							map.put(fieldName + "." + subf.getName(), subo);
							values.add(subo);
						}
					}
				}
			}
		}
		sqlInfo.setSql(SQL());
		sqlInfo.setKeysMap(map);
		sqlInfo.setValues(values.toArray(new Object[values.size()]));
		SQLBuilderUtil.debugSQLLog(sqlInfo);
		return sqlInfo;
	}

	public SQLInfo findById(DomainObject bo) throws IllegalArgumentException,
	        IllegalAccessException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		SELECT("*");
		if (null != bo && null != bo.getClass().getAnnotation(TableName.class))
			FROM(bo.getClass().getAnnotation(TableName.class).name());
		else
			FROM(bo.getClass().getSimpleName().toUpperCase());
		for (Field f : bo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, bo);
				if (fieldName.toUpperCase().equals(
				        bo.getClass().getSimpleName().toUpperCase() + "ID")) {
					WHERE(fieldName.toUpperCase() + " = #{" + fieldName + "}");
					map.put(fieldName, o);
					values.add(o);
				}
			}
		}
		sqlInfo.setSql(SQL());
		sqlInfo.setKeysMap(map);
		sqlInfo.setValues(values.toArray(new Object[values.size()]));
		SQLBuilderUtil.debugSQLLog(sqlInfo);
		return sqlInfo;
	}

	public SQLInfo findCount(PageListObject po) throws IllegalArgumentException,
	        IllegalAccessException,
	        AnnotationException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		SELECT("count(0)");
		commonCondition(po, map, values);
		sqlInfo.setSql(SQL());
		sqlInfo.setKeysMap(map);
		sqlInfo.setValues(values.toArray(new Object[values.size()]));
		SQLBuilderUtil.debugSQLLog(sqlInfo);
		return sqlInfo;
	}

	public SQLInfo findList(PageListObject po) throws IllegalArgumentException,
	        IllegalAccessException,
	        AnnotationException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		SELECT("*");
		commonCondition(po, map, values);
		sqlInfo.setSql(SQL());
		sqlInfo.setKeysMap(map);
		sqlInfo.setValues(values.toArray(new Object[values.size()]));
		SQLBuilderUtil.debugSQLLog(sqlInfo);
		return sqlInfo;
	}

	public SQLInfo findListByPage(PageListObject po) throws IllegalArgumentException,
	        IllegalAccessException,
	        AnnotationException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		SELECT("*");
		commonCondition(po, map, values);
		String sql = "";
		int offset = po.getStart() - 1 >= 0 ? po.getStart() - 1 : 0;
		if (dataBaseType.equals(DataBaseType.MYSQL)) {
			sql = SQL() + " LIMIT " + offset + "," + po.getRowCount();
		} else if (dataBaseType.equals(DataBaseType.ORACLE)) {
			String tempSQL = SQL();
			BEGIN();
			SELECT("* FROM (SELECT row_.*,rownum rownum_ ");
			FROM("(" + tempSQL + ") row_ ");
			WHERE("rownum <= " + po.getEnd() + ") where rownum_ >= " + offset);
			sql = SQL();
		}
		sqlInfo.setSql(sql);
		sqlInfo.setKeysMap(map);
		sqlInfo.setValues(values.toArray(new Object[values.size()]));
		SQLBuilderUtil.debugSQLLog(sqlInfo);
		return sqlInfo;
	}

	private void commonCondition(PageListObject po, Map<String, Object> map, List<Object> values)
	        throws AnnotationException, IllegalArgumentException, IllegalAccessException {
		if (po.getClass().isAnnotationPresent(SearchTable.class)) {
			SearchTable searchTable = po.getClass().getAnnotation(SearchTable.class);
			FROM(searchTable.tableName().toUpperCase());
			if (!searchTable.orderby().equals("")) {
				ORDER_BY(searchTable.orderby().toUpperCase());
			}
		} else {
			throw new AnnotationException("isAnnotationPresent SearchTable error");
		}
		for (Field f : po.getClass().getDeclaredFields()) {
			if (f.isAnnotationPresent(SearchField.class)) {
				String fieldName = f.getName();
				SearchField searchField = f.getAnnotation(SearchField.class);
				Object o = ReflectionUtil.getFieldValue(f, po);
				if (o != null) {
					String condition = SQLBuilderUtil.formatConditionFactory(searchField,
					        fieldName, o, dataBaseType);
					WHERE(condition);
					SQLBuilderUtil.parameterBinding(searchField, fieldName, o, map, values);
				}
			}
		}

	}

}
