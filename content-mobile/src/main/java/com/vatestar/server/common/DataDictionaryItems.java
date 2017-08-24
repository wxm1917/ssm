package com.vatestar.server.common;

public class DataDictionaryItems {
	// 数据字典项分组编�?
	private String groupCode;
	// 数据字典项分组名�?
	private String groupName;
	// 数据字典项详�?
	private java.util.ArrayList items;

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	// 设置数据字典�?
	public void setDataDictionaryItem(DataDictionaryItem item) {
		if (this.items == null)
			this.items = new java.util.ArrayList();
		this.items.add(item);
	}

	// 设置数据字典�?
	public void setDataDictionaryItem(String itemName, String itemCode) {
		if (this.items == null)
			this.items = new java.util.ArrayList();
		DataDictionaryItem item = new DataDictionaryItem();
		item.setCode(itemCode);
		item.setName(itemName);
		this.items.add(item);
	}

	// 获得数据字典项组对象
	public java.util.ArrayList getDataDictioanryItems() {
		return this.items;
	}
}
