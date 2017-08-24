package com.vatestar.cm.controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.vatestar.cm.entity.Menu;
import com.vatestar.cm.entity.RoleMenu;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.MenuService;
import com.vatestar.cm.service.RoleMenuService;
import com.vatestar.util.AjaxWrite;

@Controller
public class DimensionSettingController {

	@Resource 
	private MenuService menuService;
	@Resource 
	private RoleMenuService roleMenuService;
	
	@RequestMapping(value="/DimensionSetting.html")
	public String  dimensionSetting(HttpServletRequest request, HttpServletResponse response,ModelMap map){
		User user=(User) request.getSession().getAttribute("user");
		List<Menu> menuslist = menuService.queryMenuByRoleId(user.getRole(), 40);

		for(Menu menulist : menuslist ){
			List<Menu> menus  = menuService.queryMenuByRoleId(user.getRole(), menulist.getId());
			for(Menu menu : menus ){
				List<Menu> list  = menuService.queryMenuByRoleId(user.getRole(), menu.getId());
				for(Menu me:list){
					List<Menu> mes  = menuService.queryMenuByRoleId(user.getRole(), menu.getId());
					me.setModel(mes);
				}
				menu.setModel(list);
			}
			menulist.setModel(menus);
		}
		
		//map.addAttribute("menu",menus);
		map.addAttribute("menuslist",menuslist);

		return "/dimensionsetting/DimensionSetting"; 
	}

	@RequestMapping("/addmenu.html")
	@SuppressWarnings("unchecked")
	public void  addMenu(HttpServletRequest request, HttpServletResponse response,String menuname, String menus){
		SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		if(null != menuname){
			User user=(User) request.getSession().getAttribute("user");
			List<String> names=(List)JSONArray.parseArray(menus);
			Menu menu = new Menu();
			menu.setMenuName(menuname);
			menu.setCreateTime(sdf.format(new Date()));
			menu.setParentId("40");
			String mes = menuService.addMenu(menu);
			if(mes.equals("添加成功")){
				Integer id =  menuService.queryMenuId(menuname);
				RoleMenu rolemenu = new RoleMenu();
				rolemenu.setMemuId(id);
				rolemenu.setRoleId(user.getRole());
				roleMenuService.insertRoleMenu(rolemenu);
				for (String str : names){
					Menu me = new Menu();
					me.setMenuName(str);
					me.setCreateTime(sdf.format(new Date()));
					me.setParentId(id.toString());
					String mess = menuService.addMenu(me);
					if(mess.equals("添加成功")){
						Integer mid =  menuService.queryMenuId(str);
						RoleMenu mrolemenu = new RoleMenu();
						mrolemenu.setMemuId(mid);
						mrolemenu.setRoleId(user.getRole());
						roleMenuService.insertRoleMenu(mrolemenu);
					}
				}
			}
		}
		AjaxWrite.writeText(response, "添加成功");

	}

	
	/* 
	 * 接收  添加删除 Menu的 参数
	 */
	@RequestMapping(value="/updatemenu")
	@SuppressWarnings("unchecked")
	public void  updateMenu( HttpServletRequest request, HttpServletResponse response,String menuids, String menus, String parentid){
		User user=(User) request.getSession().getAttribute("user");
		
		List<Integer> ids=(List)JSONArray.parseArray(menuids);
		List<String> names=(List)JSONArray.parseArray(menus);
		menuService.updateMenu(ids, names,parentid,user.getRole());
		
	}
	
	
	@RequestMapping(value="/deletemenurole")
	public void  deleteMenuRole( HttpServletRequest request, HttpServletResponse response, Integer  id){
		
		roleMenuService.deleteByMenuId(id);
		
	}
	

}
