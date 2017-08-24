package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.AttrDao;
import com.vatestar.cm.entity.Attr;
import com.vatestar.cm.service.AttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AttrServiceImpl implements AttrService {
	@Autowired
	private AttrDao attr;
	public void InsertValue(Attr attr1) {
		// TODO Auto-generated method stub
		attr.InsertValue(attr1);
	}
	
	public List<Attr> quary(Integer userId, Integer parentId){
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("userId", userId);
		map.put("parentId", parentId);
		return attr.quary(map);
	}
	
	public void attrDelete(Integer parentId){
		attr.attrDelete(parentId);
	}
	public void deleteAllAttr(Integer userId){
		attr.deleteAllAttr(userId);
	}
}
