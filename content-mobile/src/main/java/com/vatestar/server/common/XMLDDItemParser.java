package com.vatestar.server.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;

public class XMLDDItemParser {

	// 数据字典项结�?
	public static DataDictionaryItems dataItems;
	private static String GROUP_NAME = "name";
	private static String GROUP_CODE = "value";
	private static String ITEM_NAME = "name";
	private static String ITEM_CODE = "value";

	public XMLDDItemParser() {
	}

	/**
	 * 获得分组数据字典项集
	 * 
	 * @param groupName
	 *            String
	 * @return DataDictionaryItems
	 */
	public static DataDictionaryItems getDataDictionaryItems(String groupName) {
		if (dataItems == null)
			dataItems = parseXML(groupName);
		return dataItems;
	}

	/**
	 * 根据分组名称解析xml文件，获得该分组下数据字典项�?
	 * 
	 * @param gName
	 *            String
	 * @return DataDictionaryItems 数据字典项分组对�?
	 */
	public static DataDictionaryItems parseXML(String gName) {
		try {
			org.dom4j.io.SAXReader saxReader = new org.dom4j.io.SAXReader();
			Document document = saxReader.read(new XMLDDItemParser().getClass()
					.getResource("/DataDictionaryConfig.xml").getPath());
			dataItems = new DataDictionaryItems();
			List list = document.selectNodes("//group");
			Iterator iter = list.iterator();
			while (iter.hasNext()) {
				Node node = (Node) iter.next();
				if (node instanceof Element) {
					// document
					Element element = (Element) node;
					String GroupName = element.attributeValue(GROUP_NAME);
					String GroupValue = element.attributeValue(GROUP_CODE);
					// 设置分组名称编码
					dataItems.setGroupName(GroupName);
					dataItems.setGroupCode(GroupValue);
					// 取组内数据字典项
					if (gName.equals(GroupName)) {
						// 取数据字典项名称编码
						Iterator elemIter = element.elementIterator();
						while (elemIter.hasNext()) {
							Element elem = (Element) elemIter.next();
							dataItems.setDataDictionaryItem(elem.attributeValue(ITEM_NAME),
									elem.attributeValue(ITEM_CODE));
						}
						return dataItems;
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return dataItems;
	}

	/**
	 * 获取所有所有的数据字典
	 * 
	 * @return
	 */
	public static Map<String, List<DataDictionaryItem>> parseAllXML() {
		Map<String, List<DataDictionaryItem>> map = new HashMap<String, List<DataDictionaryItem>>();
		try {
			org.dom4j.io.SAXReader saxReader = new org.dom4j.io.SAXReader();
			Document document = saxReader.read(new XMLDDItemParser().getClass()
					.getResource("/DataDictionaryConfig.xml").getPath());
			List list = document.selectNodes("//group");
			Iterator iter = list.iterator();
			while (iter.hasNext()) {
				Node node = (Node) iter.next();
				if (node instanceof Element) {
					// document
					Element element = (Element) node;
					String GroupName = element.attributeValue(GROUP_NAME);
					String GroupValue = element.attributeValue(GROUP_CODE);
					// 设置分组名称编码
					List<DataDictionaryItem> ls = new ArrayList<DataDictionaryItem>();
					Iterator elemIter = element.elementIterator();
					while (elemIter.hasNext()) {
						Element elem = (Element) elemIter.next();
						DataDictionaryItem dt = new DataDictionaryItem();
						dt.setCode(elem.attributeValue(ITEM_CODE));
						dt.setName(elem.attributeValue(ITEM_NAME));
						ls.add(dt);
					}
					map.put(GroupValue, ls);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return map;
	}
}
