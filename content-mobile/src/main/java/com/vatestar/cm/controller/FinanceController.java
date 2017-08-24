package com.vatestar.cm.controller;

import com.vatestar.cm.entity.MoneyLog;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.FinanceService;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
public class FinanceController {
	
	private static final Logger logger = Logger.getLogger(FinanceController.class);
	
	private static Integer pageSize=10;
	@Resource
	private FinanceService financeService;
	
	

	@RequestMapping(value="/finance/queryPage.html")
	public String queryPage(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, HttpServletRequest request, ModelMap map){
		
		
		StringBuffer total=new StringBuffer();
		Map<String,Object> allMap=new HashMap<String,Object>();
		User user=(User) request.getSession().getAttribute("user");
		total.append(user.getRole());
		MoneyLog moneyLog = new MoneyLog();
		moneyLog.setPageOffset(pageOffset);
		moneyLog.setPageSize(pageSize);
		if(user.getRole()==2){
			moneyLog.setFromUserId(user.getId());
		}else if(user.getRole()==3){
			moneyLog.setToUserId(user.getId());
		}
		
		List<MoneyLog> financeList = financeService.queryPage(moneyLog,allMap,total);
		map.addAttribute("financeList", financeList);
		map.addAttribute("allMap", allMap);
		map.addAttribute("total", Long.parseLong(total+""));
		return "/finance/list_money_log";
	}
	

	@RequestMapping(value="/finance/show.html")
	public String show(String type, User userEntity, ModelMap map){
		if("money_log".equals(type)){
			return "finance/list_money_log";
		}else{
			return "/finance/list_money_log";
		}
		
	}
	
}
