package com.vatestar.cm.service.impl;


import com.vatestar.cm.dao.MoneyLogDao;
import com.vatestar.cm.entity.MoneyLog;
import com.vatestar.cm.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FinanceServiceImpl implements FinanceService {
	@Autowired
	private MoneyLogDao moneyLogMapper;
	
	/**
	 * 
	 */

	public List<MoneyLog> queryPage(MoneyLog moneyLog, Map<String, Object> allMap, StringBuffer total) {
		allMap.put("addMoney", 0);
		allMap.put("addMoneyCount", 0);
		allMap.put("catMoney", 0);
		allMap.put("catMoneyCount", 0);
		List<MoneyLog> financeList = moneyLogMapper.queryPage(moneyLog);
		
		if("2".equals(total+"")){
			for(MoneyLog finance:financeList){
				if(finance.getType()==1){
					allMap.put("addMoney", Double.parseDouble(allMap.get("addMoney")+"")+finance.getMoney());
					allMap.put("addMoneyCount", Integer.parseInt(allMap.get("addMoneyCount")+"")+1);
				}else if(finance.getType()==0){
					finance.setMoney(finance.getMoney()*-1);
					allMap.put("catMoney", Double.parseDouble(allMap.get("catMoney")+"")+finance.getMoney());
					allMap.put("catMoneyCount", Integer.parseInt(allMap.get("catMoneyCount")+"")+1);
				}
			}
			allMap.put("money", Double.parseDouble(allMap.get("addMoney")+"")+ Double.parseDouble(allMap.get("catMoney")+""));
		}else if("3".equals(total+"")){
			for(MoneyLog finance:financeList){
				if(finance.getType()==1){
					allMap.put("addMoney", Double.parseDouble(allMap.get("addMoney")+"")+finance.getMoney());
					allMap.put("addMoneyCount", Integer.parseInt(allMap.get("addMoneyCount")+"")+1);
				}else if(finance.getType()==0){
					finance.setMoney(finance.getMoney()*-1);
					allMap.put("catMoney", Double.parseDouble(allMap.get("catMoney")+"")+finance.getMoney());
					allMap.put("catMoneyCount", Integer.parseInt(allMap.get("catMoneyCount")+"")+1);
				}
			}
			allMap.put("money", Double.parseDouble(allMap.get("addMoney")+"")+ Double.parseDouble(allMap.get("catMoney")+""));
		}
		total.delete(0, total.length());
		total.append(moneyLogMapper.queryPageCount(moneyLog));
		return financeList;
	}

}
