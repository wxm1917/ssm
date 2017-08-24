package com.vatestar.cm.service.impl;



import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.vatestar.cm.dao.MenuDao;
import com.vatestar.cm.dao.RoleMenuDao;
import com.vatestar.cm.entity.Menu;
import com.vatestar.cm.entity.RoleMenu;
import com.vatestar.cm.service.MenuService;


@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private RoleMenuDao RoleMenuDao;

//	@Cacheable(value="menuCache", key="''+#roleId+#parentId")
	public List<Menu>queryMenuByRoleId(Integer roleId,Integer parentId) {
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("roleId", roleId);
		map.put("parentId", parentId);
		return menuDao.queryMenuByRoleId(map);
	}

	@Override
	public List<Menu> queryMenuById(Integer parentId) {
		List<Menu> menus = menuDao.queryMenuById(parentId);
		return menus;
	}
	
	@Override
	public String addMenu(Menu menu) {
		String mess = "";
		try {
			if(null != menu){
				menuDao.addMenu(menu);
				return mess = "添加成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mess;
	}

	@Override
	public String deleteMenuById(Integer id,Integer roleid) {
		String mess ="";
		try {
			if(null!=roleid){
				RoleMenuDao.deleteRoleMenu(roleid, id);
			}
			menuDao.deleteMenuById(id);
			mess ="保存成功";
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return mess;
	}

	@Override
	public Integer queryMenuId(String menuName) {
		if(menuName!=null){
			List<Menu> menu = menuDao.queryMenuId(menuName);
			return menu.get(0).getId();
		}
		return null;
	}

	@Override
	public List<Menu> queryAll() {
		
		return menuDao.queryAll();
	}


	@Override
	public void updateMenu(List<Integer> menuids, List<String> menus, String parentid, Integer roleid) {
		SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		Menu menu = new Menu();
		try {
			if(null!=menuids){
				for(int id :menuids ){
					this.deleteMenuById(id,roleid);
				}
			}
			if(null!=menus){
				for(String name: menus){
					menu.setMenuName(name);
					menu.setParentId(parentid);
					menu.setCreateTime(sdf.format(new Date()));
					this.addMenu(menu);
					
					RoleMenu rolemenu = new RoleMenu();
					rolemenu.setRoleId(roleid);
					rolemenu.setMemuId(this.queryMenuId(name));
					RoleMenuDao.insertRoleMenu(rolemenu);
				}
			}
		} catch (Exception e) {
			if(null!=menu.getId()){
				this.deleteMenuById(menu.getId(),roleid);
			}
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> getMenuByRoleId(Integer roleId) {
		return menuDao.getMenuByRoleId(roleId);
	}

	@Override
	public Menu getMenuById(Integer menuId) {
		return menuDao.getMenuById(menuId);
	}

	@Override
	public Integer updateParentId(Integer parentId) {

		return menuDao.updateParentId(parentId);
	}

	@Override
	public Integer update(Menu menu) {
		return menuDao.update(menu);
	}

	@Override
	public Integer delete(Integer id) {
		return menuDao.deleteMenuById(id);
	}


	@Override
	public Integer deleteMenuByParentId(Integer menuId) {
		//同时删除角色对应的菜单
		RoleMenuDao.deleteByMenuId(menuId);
		return menuDao.deleteMenuByParentId(menuId);
	}


}
