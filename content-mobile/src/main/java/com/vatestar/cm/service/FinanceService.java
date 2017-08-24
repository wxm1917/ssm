package com.vatestar.cm.service;

import com.vatestar.cm.entity.MoneyLog;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface FinanceService {

	List<MoneyLog> queryPage(MoneyLog moneyLog,
                             Map<String, Object> allMap, StringBuffer total);

}
