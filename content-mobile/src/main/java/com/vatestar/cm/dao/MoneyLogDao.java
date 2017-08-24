package com.vatestar.cm.dao;


import com.vatestar.cm.entity.MoneyLog;

import java.util.List;

public interface MoneyLogDao {

	public int saveMoneyLog(MoneyLog moneyLog);

	public Integer queryPageCount(MoneyLog moneyLog);

	public List<MoneyLog> queryPage(MoneyLog moneyLog);
	

}
