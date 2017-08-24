package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.DictDao;
import com.vatestar.cm.entity.Dict;
import com.vatestar.cm.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictServiceImpl implements DictService {
	
	@Autowired
	private DictDao dictMapper;

	public List<Dict> query(Dict user){
		return dictMapper.query(user);
	}
}
