package com.vatestar.cm.dao;



import java.util.List;
import java.util.Map;

import com.vatestar.cm.entity.Menu;


public interface MenuDao {
	
	
	/** 
	 *  查询 Menu 实体  dao
	 * @param roleId
	 * @param parentId
	 * @return
	 */
	List<Menu> queryMenuByRoleId(Map<String,Object> map);
	/** 
	 *  查询 Menu 实体  dao
	 * @param roleId
	 * @param parentId
	 * @return
	 */
	List<Menu> queryMenuById(Integer parentId);
	
	/**
	 * 添加 Menu 实体 dao
	 * @param menu
	 * @return
	 */
	public void addMenu(Menu menu);
	
	/**
	 * 根据id删除 Menu 实体 dao
	 * @param id
	 * @return
	 */
	public Integer deleteMenuById(Integer id);
	
	/**
	 * 根据名字 得到 Menu
	 * @param name
	 * @return
	 */
	public List<Menu> queryMenuId(String menuName);
	
	/**
	 * 查所有
	 * @return
	 */
	public List<Menu> queryAll();


	public List<Menu> getMenuByRoleId(Integer roleId);

	public Menu getMenuById(Integer menuId);

	public Integer updateParentId(Integer parentId);

	public Integer update(Menu menu);

	public Integer deleteMenuByParentId(Integer menuId);
 }
