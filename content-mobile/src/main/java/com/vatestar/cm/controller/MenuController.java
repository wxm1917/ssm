package com.vatestar.cm.controller;

import com.vatestar.cm.entity.Menu;
import com.vatestar.cm.service.MenuService;
import com.vatestar.server.common.mybatis.DateFormat;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @desc 有关用户的相关操作
 * @author hjr
 * @createTime  2014-04-21
 */

//@SuppressWarnings("unchecked")
@RequestMapping("/menu")
@Controller
public class MenuController {
	
	private static final Logger log = Logger.getLogger(MenuController.class);

	@Resource
	private MenuService menuService;
	/**
	 * @desc查询所有的用户信息
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/list.html")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		List<Menu> menuList = menuService.queryMenuById(0);
		mv.addObject("menuList", menuList);
		mv.setViewName("/menu/list");
		return mv;
	}
	
	/**
	 * @desc增加菜单信息跳转页面
	 * @author ygm
	 * @date 2014-04-28
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/toAdd.html",method= RequestMethod.GET)
	public ModelAndView toAddMenu(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		List<Menu> parentMenuList = menuService.queryMenuById(0);
		mv.addObject("parentMenuList", parentMenuList);
		mv.setViewName("/menu/add");
		return mv;
	}
	

	@RequestMapping(value="/toEdit.html",method= RequestMethod.GET)
	public ModelAndView toUpdateMenu(Integer menuId, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		Menu menu = menuService.getMenuById(menuId);
		mv.addObject("menu", menu);
		mv.addObject("type", "update");
		List<Menu> parentMenuList = menuService.queryMenuById(0);
		mv.addObject("parentMenuList", parentMenuList);
		mv.setViewName("/menu/update");
		return mv;
	}

	/**
	 * @desc删除用户
	 * @param request
	 * @param response
	 * @author ygm
	 * @createTime 2014-04-29
	 * @return
	 */
	@RequestMapping(value="/delete.html",method= RequestMethod.GET)
	public String delete(Integer menuId, HttpServletRequest request, HttpServletResponse response){
		if(menuId!=null){
			Integer num = menuService.delete(menuId);
			if(num>0){
				menuService.deleteMenuByParentId(menuId);
			}
		}
		return "redirect:/menu/list.html";
	}
	
	/**
	 * @desc新增用户
	 * @param menuType 菜单级别
	 * @param request 
	 * @param response
	 * @author ygm
	 * @createTime 2014-04-21
	 */
	@RequestMapping(value="/save.html", method= RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response, Integer menuType,
                               Menu menu){
		if(menuType==0){
			menu.setParentId("0");
		}
		SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		menu.setCreateTime(sdf.format(new Date()));
		if(menu.getId()!=null){
			Menu m = menuService.getMenuById(menu.getId());
			if(m.getParentId().equals("0")&&!menu.getParentId().equals("0")){
				menuService.updateParentId(m.getId());
			}
			menuService.update(menu);
		}else{
			menuService.addMenu(menu);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/menu/list.html");
		return mv;
	}
}
