package com.vatestar.cm.service;

import com.vatestar.cm.entity.Dict;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DictService {
	public List<Dict> query(Dict user);
}
