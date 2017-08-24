package com.vatestar.cm.dao;


import com.vatestar.cm.entity.Dict;

import java.util.List;

public interface DictDao {
  
	/**
	 * @desc 查询
	 */
	public List<Dict> query(Dict user);
}
