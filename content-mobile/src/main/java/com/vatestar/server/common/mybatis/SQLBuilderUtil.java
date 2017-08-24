/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.mybatis;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.vatestar.server.common.bo.DomainObject;
import com.vatestar.server.common.core.ReflectionUtil;
import com.vatestar.server.common.dao.DataBaseType;
import com.vatestar.server.common.mybatis.BaseSQLBuilder;
import com.vatestar.server.common.mybatis.Connector;
import com.vatestar.server.common.mybatis.SQLBuilderUtil;
import com.vatestar.server.common.mybatis.SQLInfo;
import com.vatestar.server.common.mybatis.SearchField;



public class SQLBuilderUtil {

	protected final static Log log = LogFactory.getLog(BaseSQLBuilder.class);

	public static boolean isDomainFieldType(Field f) {
		if (f.getType().isAssignableFrom(Integer.class) ||
		        f.getType().isAssignableFrom(Long.class) ||
		        f.getType().isAssignableFrom(Double.class) ||
		        f.getType().isAssignableFrom(Float.class) ||
		        f.getType().isAssignableFrom(java.util.Date.class) ||
		        f.getType().isAssignableFrom(BigInteger.class) ||
		        f.getType().isAssignableFrom(BigDecimal.class) ||
		        f.getType().isAssignableFrom(String.class) ||
		        f.getType().isAssignableFrom(Boolean.class)) {
			return true;
		}
		return false;
	}

	public static boolean isDomainObjectType(Field f, DomainObject bo) {
		try {
			return ReflectionUtil.getFieldValue(f, bo) instanceof DomainObject ? true : false;
		} catch (IllegalArgumentException e) {
			log.error(e.getMessage(), e);
		} catch (IllegalAccessException e) {
			log.error(e.getMessage(), e);
		}
		return false;
	}

	public static void debugSQLLog(SQLInfo sqlInfo) {
		if (log.isDebugEnabled()) {
			log.debug("SQL, " + sqlInfo.getSql());
			StringBuffer sb = new StringBuffer();
			Set<String> set = sqlInfo.getKeysMap().keySet();
			if (set != null && !set.isEmpty()) {
				Iterator<String> setIter = set.iterator();
				while (setIter.hasNext()) {
					String key = setIter.next();
					sb.append(", ").append(key).append(":").append(sqlInfo.getKeysMap().get(key));
				}
				log.debug("SQL Keymaps " + sb.toString());
				sb = new StringBuffer();
			}
			for (Object o : sqlInfo.getValues())
				sb.append(", ").append(o);
			log.debug("SQL Valuse " + sb.toString());
		}
	}

	public static DomainObject mapToBo(Map<String, Object> map, DomainObject bo)
	        throws IllegalArgumentException, IllegalAccessException {
		for (Field f : bo.getClass().getDeclaredFields()) {
			if (SQLBuilderUtil.isDomainObjectType(f, bo)) {
				String id = f.getName() + "Id";
				Object o = ReflectionUtil.getFieldValue(f, bo);
				for (Field subf : o.getClass().getDeclaredFields()) {
					if (subf.getName().toLowerCase().equals(id.toLowerCase())) {
						Object value = map.get(subf.getName().toUpperCase());
						if (value != null) {
							if (subf.getType().isAssignableFrom(Long.class) && value instanceof Integer) {
								value = Long.valueOf(String.valueOf(value));
							}
							ReflectionUtil.setFieldValue(subf, o, value);
						}
					}
				}
			} else if (SQLBuilderUtil.isDomainFieldType(f)) {
				Object value = map.get(f.getName().toUpperCase());
				if (value != null) {
					if (f.getType().isAssignableFrom(Boolean.class) && value instanceof Integer) {
						value = Boolean.valueOf(String.valueOf(value));
					}
					if (f.getType().isAssignableFrom(Long.class) && value instanceof Integer) {
						value = Long.valueOf(String.valueOf(value));
					}
					ReflectionUtil.setFieldValue(f, bo, value);
				}
			}
		}
		return bo;
	}

	public static String formatConditionFactory(SearchField searchField, String field, Object o,
	        DataBaseType dataBaseType) {
		Connector connector = searchField.connector();
		StringBuffer sb = new StringBuffer();
		if (Connector.EQUAL.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" = #{").append(field).append("}");
		} else if (Connector.LIKE.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" like '").append(o).append("%'");
		} else if (Connector.RIGHTLIKE.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" like '").append(o).append("%'");
		} else if (Connector.LEFTLIKE.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" like '%").append(o).append("'");
		} else if (Connector.MORETHANOREQUAL.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" >= #{").append(field).append("}");
		} else if (Connector.LESSTHANOREQUAL.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" <= #{").append(field).append("}");
		} else if (Connector.MORETHAN.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" > #{").append(field).append("}");
		} else if (Connector.LESSTHAN.equals(connector)) {
			sb.append((o instanceof Date) ? conditionFormatDate(searchField, dataBaseType) : searchField
			        .column());
			sb.append(" < #{").append(field).append("}");
		} else if (Connector.IN.equals(connector)) {
			// sb.append(searchField.column()).append(" in (#{").append(field).append("})");
			Object[] ids = null;
			if (o instanceof Object[])
				ids = (Object[]) o;
			StringBuffer ss = new StringBuffer();
			String symbol = ids[0].getClass() == String.class ? "'" : "";
			for (Object id : ids) {
				ss.append(symbol).append(id).append(symbol).append(",");
			}
			ss.delete(ss.length() - 1, ss.length());
			String value = ss.toString();
			sb.append(searchField.column()).append(" in (").append(value).append(")");

		} else if (Connector.NOTIN.equals(connector)) {
			// sb.append(searchField.column()).append(" not in (#{").append(field).append("})");
			Object[] ids = null;
			if (o instanceof Object[])
				ids = (Object[]) o;
			StringBuffer ss = new StringBuffer();
			String symbol = ids[0].getClass() == String.class ? "'" : "";
			for (Object id : ids) {
				ss.append(symbol).append(id).append(symbol).append(",");
			}
			ss.delete(ss.length() - 1, ss.length());
			String value = ss.toString();
			sb.append(searchField.column()).append(" in (").append(value).append(")");

		} else if (Connector.ISNULL.equals(connector)) {
			sb.append(searchField.column()).append(" is null ");
		} else if (Connector.ISNOTNULL.equals(connector)) {
			sb.append(searchField.column()).append(" is not null ");
		}
		return sb.toString();
	}

	public static void parameterBinding(SearchField searchField, String field, Object o,
	        Map<String, Object> map, List<Object> values) {
		Connector connector = searchField.connector();
		if (Connector.ISNULL.equals(connector) || Connector.ISNOTNULL.equals(connector))
			return;
		if (Connector.LIKE.equals(connector) || Connector.RIGHTLIKE.equals(connector)
		        || Connector.LEFTLIKE.equals(connector)) {
			return;
		}
		if (Connector.IN.equals(connector) || Connector.NOTIN.equals(connector)) {
			// Object[] ids = null;
			// if(o instanceof Object[])
			// ids = (Object[])o;
			// StringBuffer sb = new StringBuffer();
			// String symbol = ids[0].getClass()==String.class ? "'" : "";
			// for(Object id : ids) {
			// sb.append(symbol).append(id).append(symbol).append(",");
			// }
			// sb.delete(sb.length()-1, sb.length());
			// String value = sb.toString();
			// map.put(field, value);
			// values.add(value);
			return;
		}
		Object tempO = o;
		if (o instanceof Date) {
			if (com.vatestar.server.common.mybatis.DateFormat.DATETIME.equals(searchField.format())) {
				tempO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o);
			} else if (com.vatestar.server.common.mybatis.DateFormat.DATE.equals(searchField.format())) {
				tempO = new SimpleDateFormat("yyyy-MM-dd").format(o);
			}
		}
		map.put(field, tempO);
		values.add(tempO);
	}

	private static String conditionFormatDate(SearchField searchField, DataBaseType dataBaseType) {
		if (com.vatestar.server.common.mybatis.DateFormat.DATETIME.equals(searchField.format())) {
			if (DataBaseType.ORACLE.equals(dataBaseType)) {
				return "to_char(" + searchField.column() + ",'yyyy-mm-dd hh24:mi:ss')";
			} else if (DataBaseType.MYSQL.equals(dataBaseType)) {
				return "date_format(" + searchField.column() + ",'%Y-%m-%d %H:%i:%s')";
			} else {
				return searchField.column();
			}
		} else if (com.vatestar.server.common.mybatis.DateFormat.DATE.equals(searchField.format())) {
			if (DataBaseType.ORACLE.equals(dataBaseType)) {
				return "to_char(" + searchField.column() + ",'yyyy-mm-dd')";
			} else if (DataBaseType.MYSQL.equals(dataBaseType)) {
				return "date_format(" + searchField.column() + ",'%Y-%m-%d')";
			} else {
				return searchField.column();
			}
		}
		return "";
	}

}
