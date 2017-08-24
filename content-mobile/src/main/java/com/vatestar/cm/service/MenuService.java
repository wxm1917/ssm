package com.vatestar.cm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.vatestar.cm.entity.Menu;



public interface MenuService {
	/** 
	 *  根据  用户 roleid  和 父类id 查询 Menu 实体 
	 * @param roleId
	 * @param parentId
	 * @return
	 */
	public List<Menu> queryMenuByRoleId(Integer roleId,Integer parentId);
	/** 
	 *  根据  用户 父类id 查询 Menu 实体 
	 * @param parentId
	 * @return
	 */
	public List<Menu> queryMenuById(Integer parentId);
	
	/**
	 * 添加 Menu 实体 
	 * @param menu
	 * @return
	 */
	public String addMenu(Menu menu);
	
	/**
	 * 根据id删除 Menu 与 role 之间的关系
	 * @param id
	 * @return
	 */
	public String deleteMenuById(Integer id,Integer roleid);
	
	/**
	 * 根据名字 得到 ID
	 * @param name
	 * @return
	 */
	public Integer queryMenuId(String menuName);
	
	/**
	 * 查所有
	 * @return
	 */
	public List<Menu> queryAll();
	
	/**
	 * 更新实体  添加和删除同时进行
	 */
	public void updateMenu(List<Integer> menuids,List<String> menus,String parentid,Integer roleid);


    /**
	 * @根据roleId得到菜单列表
	 * @author hjr
	 * @date 2014-10-17
	 * @return
	 */
	public List<Menu> getMenuByRoleId(Integer roleId);

	public Menu getMenuById(Integer menuId);


	/**
	 * 根据parentId修改parentId
	 * @param parentId
	 * @return
	 */
	public Integer updateParentId(Integer parentId);

	public Integer update(Menu menu);

	public Integer delete(Integer id);

	public Integer deleteMenuByParentId(Integer menuId);
}
