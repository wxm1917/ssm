package com.vatestar.cm.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vatestar.cm.dao.RoleMenuDao;
import com.vatestar.cm.entity.RoleMenu;
import com.vatestar.cm.service.RoleMenuService;


@Service
public class RoleMenuServiceImpl implements RoleMenuService {

	@Autowired
	private RoleMenuDao RoleMenuDao;
	@Override
	public void insertRoleMenu(RoleMenu rolemenu) {
		
		RoleMenuDao.insertRoleMenu(rolemenu);
	}
	@Override
	public List queryByMenuId(Integer id) {
		RoleMenuDao.queryByMenuId(id);
		
		return null;
	}
	@Override
	public void deleteByMenuId(Integer id) {
	
		RoleMenuDao.deleteByMenuId(id);
	}
	
	
}
