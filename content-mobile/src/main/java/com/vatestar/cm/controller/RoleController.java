package com.vatestar.cm.controller;


import com.vatestar.cm.entity.Menu;
import com.vatestar.cm.entity.Role;
import com.vatestar.cm.entity.RoleMenu;
import com.vatestar.cm.service.MenuService;
import com.vatestar.cm.service.RoleService;
import com.vatestar.util.PageUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @desc 有关用户的相关操作
 * @author hjr
 * @createTime  2014-04-21
 */

//@SuppressWarnings("unchecked")

@Controller
@RequestMapping("/role")
public class RoleController {
	
	private static final Logger log = Logger.getLogger(RoleController.class);

	@Resource
	private RoleService roleService;
	@Resource
	private MenuService menuService;
	/**
	 * @desc查询所有的用户信息
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/list.html" ,method = RequestMethod.GET)
	public String list(Integer current, Integer rowSize,
							 HttpServletRequest request, HttpServletResponse response, ModelMap map){
		response.setContentType("text/html;charset=utf-8");
		int allRows = roleService.count();
		List<Role> list = roleService.list(current, rowSize);
		PageUtil pu=new PageUtil(current, allRows, rowSize);
		pu.setList(list);
		map.addAttribute("pu",pu);
		return "/role/list";
	}
	
	/**
	 * @desc增加用户信息跳转页面
	 * @author ygm
	 * @date 2014-04-28
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/toAdd.html",method= RequestMethod.GET)
	public ModelAndView toAddRole(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		List<Menu> menuList = menuService.queryMenuById(0);
		mv.addObject("menuList", menuList);
		mv.setViewName("/role/add");
		return mv;
	}
	
	
	/**
	 * @desc修改用户信息跳转页面
	 * @author ygm
	 * @date 2014-04-29
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/toEdit.html",method= RequestMethod.GET)
	public ModelAndView toUpdateRole(Integer roleId, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		Role role = roleService.queryById(roleId);
		List<Menu> mList = menuService.getMenuByRoleId(roleId);
		role.setMenuList(mList);
		List<Menu> menuList = menuService.queryMenuById(0);
		mv.addObject("menuList", menuList);
		mv.addObject("role", role);
		mv.setViewName("/role/update");
		return mv;
	}

	/**
	 * @desc删除角色
	 * @param roleId
	 * @param request
	 * @param response
	 * @author ygm
	 * @createTime 2014-04-29
	 * @return
	 */
	@RequestMapping(value="/delete.html",method= RequestMethod.GET)
	public String delete(Integer roleId, HttpServletRequest request, HttpServletResponse response){
		if(roleId!=null){
			Integer num = roleService.deleteRole(roleId);
			if(num>0){
				roleService.deleteRoleMenuByRoleId(roleId);
			}
		}
		return "redirect:/role/list.html";
	}
	
	/**
	 * @desc新增角色
	 * @param role 菜单级别
	 * @param request 
	 * @param response
	 * @author ygm
	 * @createTime 2014-04-21
	 * @editTime 2016-08-22
	 */
	@RequestMapping(value="/save.html", method= RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response, String menuIdList,
                               Role role){
		List<RoleMenu> rmList = new ArrayList<RoleMenu>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		role.setCreateTime(sdf.format(new Date()));
		if(role.getId()!=null){
			Integer num = roleService.updateRole(role);
			List<Integer> menuIds = roleService.getMenuIdsByRoleId(role.getId());
			if(menuIdList!=null&&!"".equals(menuIdList)){
				String[] strs = null;
				List<Integer> mIdList = new ArrayList<Integer>();
				strs = menuIdList.split(",");
				if(menuIds!=null&&menuIds.size()>0){
					for(int i=0;i<strs.length;i++){
						mIdList.add(Integer.parseInt(strs[i]));
						if(!menuIds.contains(Integer.parseInt(strs[i]))){
							RoleMenu rm = new RoleMenu();
							rm.setRoleId(role.getId());
							rm.setMemuId(Integer.parseInt(strs[i]));
							rmList.add(rm);
						}
					}
				}else{
					for(int i=0;i<strs.length;i++){
						mIdList.add(Integer.parseInt(strs[i]));
						RoleMenu rm = new RoleMenu();
						rm.setRoleId(role.getId());
						rm.setMemuId(Integer.parseInt(strs[i]));
						rmList.add(rm);
					}
				}
				if(num>0&&rmList!=null&&rmList.size()>0){
					roleService.addRoleMenu(rmList);
				}
				for(int i=0;i<menuIds.size();i++){
					if(!mIdList.contains(menuIds.get(i))){
						RoleMenu rm = new RoleMenu();
						rm.setRoleId(role.getId());
						rm.setMemuId(menuIds.get(i));
						roleService.deleteRoleMenu(rm);
					}
				}
			}else{
				roleService.deleteRoleMenuByRoleId(role.getId());
			}
		}else{
			Integer num = roleService.addRole(role);
			if(num>0){
				if(menuIdList!=null&&!"".equals(menuIdList)){
					String[] strs = menuIdList.split(",");
					for(int i=0;i<strs.length;i++){
						RoleMenu rm = new RoleMenu();
						rm.setRoleId(role.getId());
						rm.setMemuId(Integer.parseInt(strs[i]));
						rmList.add(rm);
					}
					roleService.addRoleMenu(rmList);
				}
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/role/list.html");
		return mv;
	}
}
