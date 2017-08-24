package com.vatestar.server.common;

import java.util.List;
import java.util.Map;

public interface DataDictionaryUtils {

	/**
	 * 根据数据项编码获取对应码值
	 * 
	 * @param groupCode
	 *            String
	 * @param itemCode
	 *            String
	 * @return String 数据项编�?
	 */
	public String getItemName(String groupCode, String itemCode);

	/**
	 * 根据类型编码获取所有该类型项
	 * 
	 * @param groupCode
	 *            String
	 * @return List<DataDictionaryItem>
	 */
	public List<DataDictionaryItem> getAllItem(String groupCode);

	/**
	 * 根据类型编码获取所有该类型项
	 * 
	 * @param groupCode
	 *            String
	 * @return List<DataDictionaryItem>
	 */
	public Map getGroupItemMap(String groupCode);

}
