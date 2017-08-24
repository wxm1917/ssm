package com.vatestar.cm.dao;


import com.vatestar.cm.entity.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserDao {
  
	/**
	 * @desc 登录
	 * @author hjr
	 * @date 2014-10-31
	 * @param map 参数集合 
	 * @return
	 */
	public User login(User user);
	
	/**
	 * @desc 新增用户信息
	 * @author ygm
	 * @date 2014-03-03
	 * @param user 用户对象
	 * @return
	 */
	public int saveUser(User user);
	
	/**
	 * @desc 新增用户信息
	 * @author ygm
	 * @date 2014-04-29
	 * @param user 用户对象
	 * @return
	 */
	public int updateUser(User user);
	
	/**
	 * @desc查询所有的媒体用户的用户Id和公司
	 * @author ygm
	 * @date 2014-05-17
	 * @return
	 */
	public List<HashMap<String, Object>> queryUser();
	/**
	 * @根据userId删除user
	 * @author hjr
	 * @date 2014-06-04
	 * @return
	 */
	public void deleteUser(Integer userId);

	public List<User> queryPage(User userEntity);
	public Integer queryPageCount(User userEntity);
	
	public List<User> queryPageForCheck(User userEntity);
	public String queryPageForCheckCount(User userEntity);

	public List<Map<String, Object>> queryPageUserForAd(User userEntity);

	public User queryOne(Integer id);
	public List<User> queryUser(User userEntity);

	public List<User> getAllUser(HashMap<String, Object> map);

}
