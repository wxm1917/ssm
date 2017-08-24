package com.vatestar.server.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DataDictionaryUtilsImpl implements DataDictionaryUtils {

	public DataDictionaryUtilsImpl() {

	}

	/**
	 * 根据数据项编码获取对应码值
	 * 
	 * @param groupCode
	 *            String
	 * @param itemCode
	 *            String
	 * @return String 数据项编�?
	 */
	public String getItemName(String groupCode, String itemCode) {
		String itemName = "未知";
		// DataDictionaryItems dataItems = XMLDDItemParser.getDataDictionaryItems(groupCode);
		// java.util.ArrayList items = dataItems.getDataDictioanryItems();
		// if (items != null) {
		// DataDictionaryItem item;
		// for (int i = 0; i < items.size(); i++) {
		// item = (DataDictionaryItem) items.get(i);
		// if (item != null) {
		// String code = item.getCode();
		// if (code.equals(itemCode)) {
		// itemName = item.getName();
		// break;
		// }
		// }
		// }
		// }

		List<DataDictionaryItem> list = new ArrayList<DataDictionaryItem>();
		if (CacheMapUtil.map.isEmpty()) {
			CacheMapUtil.map = XMLDDItemParser.parseAllXML();
		}
		list = CacheMapUtil.map.get(groupCode);
		if (null != list && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getCode().equals(itemCode)) {
					itemName = list.get(i).getName();
				}
			}
		}
		return itemName;
	}

	/**
	 * 根据类型编码获取所有该类型项
	 * 
	 * @param groupCode
	 *            String
	 * @return List<DataDictionaryItem>
	 */
	public List<DataDictionaryItem> getAllItem(String groupCode) {
		List<DataDictionaryItem> list = new ArrayList<DataDictionaryItem>();
		if (CacheMapUtil.map.isEmpty()) {
			CacheMapUtil.map = XMLDDItemParser.parseAllXML();
		}
		list = CacheMapUtil.map.get(groupCode);
		return list;
	}

	@Override
	public Map getGroupItemMap(String groupCode) {
		List<DataDictionaryItem> list = new ArrayList<DataDictionaryItem>();
		if (CacheMapUtil.map.isEmpty()) {
			CacheMapUtil.map = XMLDDItemParser.parseAllXML();
		}
		list = CacheMapUtil.map.get(groupCode);
		java.util.Iterator<DataDictionaryItem> it = list.iterator();
		java.util.Map tempMap = new java.util.HashMap();
		while (it.hasNext()) {
			DataDictionaryItem ddi = it.next();
			tempMap.put(ddi.getCode(), ddi.getName());
		}
		return tempMap;
	}

}
