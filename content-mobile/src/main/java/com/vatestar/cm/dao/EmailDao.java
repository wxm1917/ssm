package com.vatestar.cm.dao;


import com.vatestar.cm.entity.Email;

import java.util.List;

public interface EmailDao {
	List<Email> queryByGroup(String group);
}
