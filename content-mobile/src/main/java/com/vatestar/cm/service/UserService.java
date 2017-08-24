package com.vatestar.cm.service;

import com.vatestar.cm.entity.MoneyLog;
import com.vatestar.cm.entity.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface UserService {
	
	/**
	 * @desc 用户登录
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 */
	public User login(User user);

	public List<User> queryPage(User userEntity, StringBuffer total);
	public List<User> queryPageForCheck(User userEntity, StringBuffer total);

	public List<Map<String, Object>> queryPageUserForAd(User userEntity,
                                                        StringBuffer total);

	public String saveUser(User user, MoneyLog moneyLog);

	public void updateUser(User userEntity);
	public void updateCheck(String ids, int check);
	@Transactional
	public String recharge(User client, User recharge, MoneyLog moneyLog);
	public User queryOne(Integer id);
	public int onlyOne(String username);

	public int queryPageCount();

	public List<User> getAllUser(Integer page, Integer pageSize,String sort,String order);

	public void deleteUser(Integer userId);


}
