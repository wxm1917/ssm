package com.vatestar.cm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.vatestar.cm.entity.RoleMenu;


@Service
public interface RoleMenuService {
	
	/**
	 * 添加 一个 role 和menu的关系
	 * @param rolemenu
	 */
	public void insertRoleMenu(RoleMenu rolemenu);
	
	
	public List queryByMenuId(Integer id);
	
	public void deleteByMenuId(Integer id);
		
}
