package com.vatestar.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;

import com.google.common.collect.Lists;

/**
 * 数据库操作工具类.
 * 
 * @version 1.0版本
 */
public class JdbcUtils {

	/**
	 * 获取ResultSet中的列名称.
	 * 
	 * @param rs
	 *            查询结果.
	 * @return 返回所有的列名称.
	 * @throws SQLException
	 */
	public static List<String> getResultSetColumnNames(ResultSet rs) throws SQLException {
		ResultSetMetaData resultSetMetaData = rs.getMetaData();
		int columnCount = resultSetMetaData.getColumnCount();
		List<String> names = Lists.newArrayList();
		for (int i = 1; i <= columnCount; i++) {
			names.add(resultSetMetaData.getColumnName(i));
		}
		return names;
	}
}
