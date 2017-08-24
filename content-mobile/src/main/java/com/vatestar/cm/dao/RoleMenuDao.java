package com.vatestar.cm.dao;


import java.util.List;
import java.util.Map;

import com.vatestar.cm.entity.RoleMenu;


public interface RoleMenuDao {
  
	/**
	 * 添加 一个 role 和menu的关系
	 * @param rolemenu
	 */
	public void insertRoleMenu(RoleMenu rolemenu);
	
	/**
	 * 删除一个 role 和Menu的关系
	 * @param rolemenu
	 */
	public void deleteRoleMenu(Integer roleiId,Integer menuId);


	public void deleteByMenuId(Integer menuId);
	
	public List queryByMenuId(Integer menuId);
}
