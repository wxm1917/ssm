package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.MoneyLogDao;
import com.vatestar.cm.dao.UserDao;
import com.vatestar.cm.entity.MoneyLog;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.UserService;
import com.vatestar.util.DateUtil;
import com.vatestar.util.MD5;
import com.vatestar.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
	private Logger logger= LoggerFactory.getLogger(UserServiceImpl.class);
	@Autowired
	private UserDao userMapper;
	@Autowired
	private MoneyLogDao moneyLogMapper;
	
	/**
	 * @desc 用户登录
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 */
	@Override
	public User login(User user) {
		user.setPassword(MD5.ToMD5(user.getPassword()));
		User u = userMapper.login(user);
		return u;
	}

	@Override
	public List<User> queryPage(User userEntity, StringBuffer total) {
		total.append(userMapper.queryPageCount(userEntity));
		List<User> userList = userMapper.queryPage(userEntity);
		for(User user:userList){
			user.setDateTotle(DateUtil.getDaysBetween(user.getCreateTime(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()))==0?1:DateUtil.getDaysBetween(user.getCreateTime(), new SimpleDateFormat("yyyy-MM-dd").format(new Date())));
			String s=new DecimalFormat("#.00").format((user.getConsumeMoney()+user.getConsumeRresentMoney())/user.getDateTotle());
			user.setAverageConsume(Double.parseDouble(s));
		}
		return userList;
	}

	/**
	 * 审核页面分页查询
	 */
	public List<User> queryPageForCheck(User userEntity, StringBuffer total) {
		total.append(userMapper.queryPageForCheckCount(userEntity));
		List<User> userList = userMapper.queryPageForCheck(userEntity);
		return userList;
	}
	
	@Override
	public List<Map<String, Object>> queryPageUserForAd(User userEntity, StringBuffer total) {
		total.append(userMapper.queryPageCount(userEntity));
		List<Map<String, Object>> userList = userMapper.queryPageUserForAd(userEntity);
		return userList;
	}


	@Transactional
	public String saveUser(User user, MoneyLog moneyLog) {
		try {
			userMapper.saveUser(user);
			if(moneyLog!=null){
				moneyLogMapper.saveMoneyLog(moneyLog);
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		return null;
	}

	@Override
	public void updateUser(User userEntity) {
		userMapper.updateUser(userEntity);
	}
	@Override
	public void updateCheck(String ids, int check ) {
		for(String id:ids.split(";",0)){
			User userEntity= new User();
			userEntity.setId(Integer.parseInt(id));
			userEntity.setState(check);
			userMapper.updateUser(userEntity);
		}
	}
	/**
	 * 充值
	 * @param client  广告组
	 * @param recharge 代理商
	 * @author hanchanghong
	 * @date 2014年12月8日 上午9:28:38
	 */
	@Transactional
	public String recharge(User client, User recharge, MoneyLog moneyLog) {
		try {
			userMapper.updateUser(client);
			userMapper.updateUser(recharge);
			if(moneyLogMapper!=null){
				moneyLogMapper.saveMoneyLog(moneyLog);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@Cacheable(value="userCache", key="#id")
	public User queryOne(Integer id) {
		return userMapper.queryOne(id);
	}
	
	/**
	 * 用户名唯一性验证
	 */
	public int onlyOne(String username){
		
		List<User> userList = userMapper.queryUser(new User(username));
		if(userList==null){
			return 0;
		}else{
			return userList.size();
		}
	}

	@Override
	public int queryPageCount() {
		return userMapper.queryPageCount(null);
	}

	@Override
	public List<User> getAllUser(Integer page, Integer pageSize, String sort, String order) {
		page = page == null ? 1 : page;
		pageSize = pageSize == null ? new PageUtil().getRowSize() : pageSize;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("currentRow", (page-1)*pageSize);
		map.put("pageSize", pageSize);
		map.put("sort", sort);
		map.put("order", order);
		System.err.println(map);
		List<User> list = userMapper.getAllUser(map);
		return list;
	}

	@Override
	public void deleteUser(Integer userId) {
		userMapper.deleteUser(userId);
	}
}
