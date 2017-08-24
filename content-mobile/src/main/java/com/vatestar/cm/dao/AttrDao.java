package com.vatestar.cm.dao;


import com.vatestar.cm.entity.Attr;

import java.util.List;
import java.util.Map;

public interface AttrDao {
	public void InsertValue(Attr attr);
	public List<Attr> quary(Map map);
	public void attrDelete(Integer parentId);
	public void deleteAllAttr(Integer userId);
}
