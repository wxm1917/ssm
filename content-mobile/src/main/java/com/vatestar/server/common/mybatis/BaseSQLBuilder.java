/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.mybatis;

import static org.apache.ibatis.jdbc.SqlBuilder.BEGIN;
import static org.apache.ibatis.jdbc.SqlBuilder.DELETE_FROM;
import static org.apache.ibatis.jdbc.SqlBuilder.INSERT_INTO;
import static org.apache.ibatis.jdbc.SqlBuilder.SET;
import static org.apache.ibatis.jdbc.SqlBuilder.SQL;
import static org.apache.ibatis.jdbc.SqlBuilder.UPDATE;
import static org.apache.ibatis.jdbc.SqlBuilder.VALUES;
import static org.apache.ibatis.jdbc.SqlBuilder.WHERE;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.Null;

import com.vatestar.server.common.bo.DomainObject;
import com.vatestar.server.common.core.ReflectionUtil;
import com.vatestar.server.common.dao.DataBaseType;
import com.vatestar.server.common.mybatis.SQLBuilderUtil;
import com.vatestar.server.common.mybatis.SQLInfo;
import com.vatestar.server.common.mybatis.TableName;



public class BaseSQLBuilder {

	@SuppressWarnings("unused")
	private DataBaseType dataBaseType;

	public BaseSQLBuilder(DataBaseType dataBaseType) {
		this.dataBaseType = dataBaseType;
	}

	// protected final Log logger = LogFactory.getLog(getClass());

	public SQLInfo insert(DomainObject bo) throws IllegalArgumentException, IllegalAccessException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		if (null != bo && null != bo.getClass().getAnnotation(TableName.class))
			INSERT_INTO(bo.getClass().getAnnotation(TableName.class).name());
		else
			INSERT_INTO(bo.getClass().getSimpleName().toUpperCase());
		for (Field f : bo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, bo);
				if (o != null) {
					VALUES(fieldName.toUpperCase(), "#{" + fieldName + "}");
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
							VALUES(subf.getName().toUpperCase(), "#{" + fieldName + "." + subf.getName()
							        + "}");
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

	public SQLInfo delete(DomainObject bo) throws IllegalArgumentException, IllegalAccessException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		if (null != bo && null != bo.getClass().getAnnotation(TableName.class))
			DELETE_FROM(bo.getClass().getAnnotation(TableName.class).name());
		else
			DELETE_FROM(bo.getClass().getSimpleName().toUpperCase());
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
							WHERE(subf.getName().toUpperCase() + " = #{" + fieldName + "." + subf.getName()
							        + "}");
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

	public SQLInfo bulkDeleteByIds(Class<? extends DomainObject> cls, Object[] ids)
	        throws IllegalArgumentException, IllegalAccessException {
		if (ids == null || ids.length == 0)
			return null;
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		if (null != cls && null != cls.getClass().getAnnotation(TableName.class))
			DELETE_FROM(cls.getClass().getAnnotation(TableName.class).name());
		else
			DELETE_FROM(cls.getSimpleName().toUpperCase());
		for (Field f : cls.getDeclaredFields()) {
			String fieldName = f.getName();
			if (fieldName.toUpperCase().equals((cls.getSimpleName() + "id").toUpperCase())) {
				StringBuffer sb = new StringBuffer();
				String symbol = ids[0].getClass() == String.class ? "'" : "";
				for (Object id : ids) {
					sb.append(symbol).append(id).append(symbol).append(",");
				}
				sb.delete(sb.length() - 1, sb.length());
				String value = sb.toString();
				map.put(fieldName, value);
				values.add(value);
				WHERE(fieldName.toUpperCase() + " in (#{" + fieldName + "})");
			}
		}
		sqlInfo.setSql(SQL());
		sqlInfo.setKeysMap(map);
		sqlInfo.setValues(values.toArray(new Object[values.size()]));
		SQLBuilderUtil.debugSQLLog(sqlInfo);
		return sqlInfo;
	}

	public SQLInfo update(DomainObject bo, DomainObject selectBo) throws IllegalArgumentException,
	        IllegalAccessException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		if (null != bo && null != bo.getClass().getAnnotation(TableName.class))
			UPDATE(bo.getClass().getAnnotation(TableName.class).name());
		else
			UPDATE(bo.getClass().getSimpleName().toUpperCase());
		for (Field f : bo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, bo);
				// if(fieldName.toUpperCase().equals(bo.getClass().getSimpleName().toUpperCase()+"ID")) {
				// WHERE(fieldName.toUpperCase()+" = ${"+fieldName+"}");
				// }
				SET(fieldName.toUpperCase() + " = #{" + fieldName + "}");
				if (o == null) {
					Null nullValue = Null.valueOf(f.getType().getSimpleName().toUpperCase());
					map.put(fieldName, nullValue);
					values.add(nullValue);
				} else {
					map.put(fieldName, o);
					values.add(o);
				}
			} else if (SQLBuilderUtil.isDomainObjectType(f, bo)) {
				String id = fieldName + "Id";
				Object o = ReflectionUtil.getFieldValue(f, bo);
				for (Field subf : o.getClass().getDeclaredFields()) {
					if (subf.getName().toLowerCase().equals(id.toLowerCase())) {
						Object subo = ReflectionUtil.getFieldValue(subf, o);
						SET(subf.getName().toUpperCase() + " = #{" + fieldName + "." + subf.getName() + "}");
						if (subo == null) {
							Null nullValue = Null.valueOf(subf.getType().getSimpleName().toUpperCase());
							map.put(fieldName + "." + subf.getName(), nullValue);
							values.add(nullValue);
						} else {
							map.put(fieldName + "." + subf.getName(), subo);
							values.add(subo);
						}
					}
				}
			}
		}

		for (Field f : selectBo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, selectBo);
				if (o != null) {
					WHERE(fieldName.toUpperCase() + " = #{" + fieldName + "}");
					map.put(fieldName, o);
					values.add(o);
				}
			} else if (SQLBuilderUtil.isDomainObjectType(f, selectBo)) {
				String id = fieldName + "Id";
				Object o = ReflectionUtil.getFieldValue(f, selectBo);
				for (Field subf : o.getClass().getDeclaredFields()) {
					if (subf.getName().toLowerCase().equals(id.toLowerCase())) {
						Object subo = ReflectionUtil.getFieldValue(subf, o);
						if (subo != null) {
							WHERE(subf.getName().toUpperCase() + " = #{" + fieldName + "." + subf.getName()
							        + "}");
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

	public SQLInfo updateSpecial(DomainObject bo, DomainObject selectBo) throws IllegalArgumentException,
	        IllegalAccessException {
		SQLInfo sqlInfo = new SQLInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> values = new ArrayList<Object>();
		BEGIN();
		if (null != bo && null != bo.getClass().getAnnotation(TableName.class))
			UPDATE(bo.getClass().getAnnotation(TableName.class).name());
		else
			UPDATE(bo.getClass().getSimpleName().toUpperCase());
		for (Field f : bo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, bo);
				// if(fieldName.toUpperCase().equals(bo.getClass().getSimpleName().toUpperCase()+"ID")) {
				// WHERE(fieldName.toUpperCase()+" = ${"+fieldName+"}");
				// }
				if (o != null) {
					SET(fieldName.toUpperCase() + " = #{" + fieldName + "}");
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
							SET(subf.getName().toUpperCase() + " = #{" + fieldName + "." + subf.getName()
							        + "}");
							map.put(fieldName + "." + subf.getName(), subo);
							values.add(subo);
						}
					}
				}
			}
		}

		for (Field f : selectBo.getClass().getDeclaredFields()) {
			String fieldName = f.getName();
			if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object o = ReflectionUtil.getFieldValue(f, selectBo);
				if (o != null) {
					WHERE(fieldName.toUpperCase() + " = #{" + fieldName + "}");
					map.put(fieldName, o);
					values.add(o);
				}
			} else if (SQLBuilderUtil.isDomainObjectType(f, selectBo)) {
				String id = fieldName + "Id";
				Object o = ReflectionUtil.getFieldValue(f, selectBo);
				for (Field subf : o.getClass().getDeclaredFields()) {
					if (subf.getName().toLowerCase().equals(id.toLowerCase())) {
						Object subo = ReflectionUtil.getFieldValue(subf, o);
						if (subo != null) {
							WHERE(subf.getName().toUpperCase() + " = #{" + fieldName + "." + subf.getName()
							        + "}");
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

}
