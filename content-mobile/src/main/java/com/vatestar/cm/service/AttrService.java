package com.vatestar.cm.service;

import com.vatestar.cm.entity.Attr;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AttrService {
	public void InsertValue(Attr attr);
	public List<Attr> quary(Integer userId, Integer parentId);
	public void attrDelete(Integer parentId);
	public void deleteAllAttr(Integer userId);
}
