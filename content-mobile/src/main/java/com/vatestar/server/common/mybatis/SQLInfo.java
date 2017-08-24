/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.mybatis;

import java.util.Map;
public class SQLInfo {

	private String sql;
	private Map<String,Object> keysMap;
	private Object[] values;
	/**
	 * @return the sql
	 */
	public String getSql() {
		return sql;
	}
	/**
	 * @param sql the sql to set
	 */
	public void setSql(String sql) {
		this.sql = sql;
	}
	/**
	 * @return the keysMap
	 */
	public Map<String,Object>  getKeysMap() {
		return keysMap;
	}
	/**
	 * @param keysMap the keysMap to set
	 */
	public void setKeysMap(Map<String,Object>  keysMap) {
		this.keysMap = keysMap;
	}
	/**
	 * @return the values
	 */
	public Object[] getValues() {
		return values;
	}
	/**
	 * @param values the values to set
	 */
	public void setValues(Object[] values) {
		this.values = values;
	}

	
	
}
