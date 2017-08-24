package com.vatestar.cm.controller;

import com.vatestar.cm.entity.*;
import com.vatestar.cm.service.*;
import com.vatestar.util.DateUtil;
import com.vatestar.util.MD5;
import com.vatestar.util.PageUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Scope("prototype")
public class UserController {
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	private static Integer pageSize=10;
	@Resource
	private UserService userService;
	@Resource
	private AdvertiseDataService advertiseDataService;
	@Resource
	private MenuService menuService;
	@Resource
	private AttrService attrService;

	@Resource
	private RoleService roleService;
	
	private String id=null;
	
	
	
	
	/**
	 * @desc 修改密码
	 * @author hch
	 * @date 2014-10-31
	 */
	@RequestMapping(value="/updtpd.html")
	public ModelAndView updatePassWord(String oldPassword, String newPassword, HttpServletRequest request, HttpServletResponse response){
		User user=(User) request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView();//MD5.ToMD5(oldPassword)
		if(user!=null&& StringUtils.isNotEmpty(oldPassword)&& StringUtils.isNotEmpty(newPassword)){
			if(user.getPassword().equals(MD5.ToMD5(oldPassword))){
				user.setPassword(MD5.ToMD5(newPassword));
				userService.updateUser(user);
				request.getSession().setAttribute("user", user);
				mv.setViewName("redirect:header.html");
			}else{
				mv.addObject("msg", "旧密码不正确");
				mv.setViewName("/common/pswd_update");
			}
		}else{
			mv.setViewName("/common/pswd_update");
		}
		return mv;
	}
	
	/**
	 * @desc 用户登录页面
	 * @author hjr
	 * @date 2014-10-31
	 */
	@RequestMapping(value="/login.html")
	public ModelAndView login(User user, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		if(user!=null&& StringUtils.isNotEmpty(user.getUsername())&& StringUtils.isNotEmpty(user.getPassword())){
			user = userService.login(user);
			if(user!=null){
				request.getSession().setAttribute("user", user);
				mv.setViewName("redirect:header.html");
			}else{
				mv.addObject("msg", "用户名或密码不正确");
				mv.setViewName("/adtive/login");
			}
		}else{
			mv.setViewName("/adtive/login");
		}
		return mv;
	}
	
	/**
	 * 登录后跳转到首页 
	 */
	@RequestMapping(value="/header.html")
	public String header(HttpServletRequest request, ModelMap mm){
		User user=(User) request.getSession().getAttribute("user");
		if(user==null){
			return "redirect:/login.html";
		}else{
		List<Menu> menuList=menuService.queryMenuByRoleId(user.getRole(),0);
		mm.addAttribute("menuList", menuList);
		return "/common/header";
		}
	}


	/*--2016.08.23 START--*/
	@RequestMapping(value="/user/getalluser.html")
	public ModelAndView getAllUser(Integer current,Integer rowSize, String sort, String order,
								   HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		int allRows = userService.queryPageCount();
		List<User> list = userService.getAllUser(current, rowSize, sort, order);
		PageUtil pu=new PageUtil(current, allRows, rowSize);
		pu.setList(list);
		mv.addObject("pu", pu);
		mv.setViewName("/user/userlist");
		return mv;
	}

	/**
	 * @desc增加用户信息跳转页面
	 * @author ygm
	 * @date 2014-04-28
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/user/toadduser.html",method= RequestMethod.GET)
	public ModelAndView toAddUser(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		List<Role> roleList = roleService.list(null, null);
		mv.addObject("roleList", roleList);
		mv.addObject("type", "add");
		mv.setViewName("/user/useredit");
		return mv;
	}


	/**
	 * @desc修改用户信息跳转页面
	 * @author ygm
	 * @date 2014-04-29
	 * @param userId 用户id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/user/toupuser.html",method=RequestMethod.GET)
	public ModelAndView toUpdatedUser(Integer userId, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		User user = userService.queryOne(userId);
		List<Role> roleList = roleService.list(null, null);
		mv.addObject("roleList", roleList);
		mv.addObject("oneuser", user);
		mv.addObject("type", "update");
		mv.setViewName("/user/useredit");
		return mv;
	}



	/**
	 * @desc删除用户
	 * @param userId
	 * @param request
	 * @param response
	 * @author ygm
	 * @createTime 2014-04-29
	 * @return
	 */
	@RequestMapping(value="/user/deluser.html",method=RequestMethod.GET)
	public String deleteUser(Integer userId, HttpServletRequest request, HttpServletResponse response){
		if(userId!=null){
			userService.deleteUser(userId);
		}
		return "redirect:/user/getalluser.html";
	}


	@RequestMapping(value="/user/saveuser.html", method=RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response, String type,User user){
		if(type!=null && type.equals("update")){
			if(user.getPassword()==null || user.getPassword().equals("")){
				user.setPassword(null);
			}else{
				user.setPassword(MD5.ToMD5(user.getPassword()));
			}
			userService.updateUser(user);
		}else{
			if(null != user.getPassword() && !"".equals(user.getPassword()))
				user.setPassword(MD5.ToMD5(user.getPassword()));
			else
				user.setPassword(MD5.ToMD5("123456"));
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			user.setCreateTime(df.format(new Date()));
			userService.saveUser(user,null);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/user/getalluser.html");
		return mv;
	}

	/*--2016.08.23 END--*/




	@RequestMapping(value="/manage.html")
	public String manage(Integer menuId , ModelMap mm, HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("user");
		List<Menu> menuList=menuService.queryMenuByRoleId(user.getRole(), menuId);
		mm.addAttribute("menuList", menuList);
		return "/common/manage";
	}

	@RequestMapping(value="/new_manage.html")
	public String new_manage(Integer menuId , ModelMap mm, HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("user");
		
		List<Menu> menuList=menuService.queryMenuByRoleId(user.getRole(), menuId);
		
		
		mm.addAttribute("menuList", menuList);
		return "/adtive/new_main";
	}
	
	
	@RequestMapping(value="/p_attribution.html")
	public String p_attribution(Integer menuId , ModelMap mm, HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("user");
		String jud = request.getParameter("cancel");
		if(jud!=null){
			return null;
		}else{
		String menuName = request.getParameter("menuName");
		
		List<Menu> menuList=menuService.queryMenuByRoleId(user.getRole(), menuId);
		
		List<Integer> mList = new ArrayList();
		for(int i = 0; i < menuList.size(); i ++){
			mList.add(menuList.get(i).getId());
		}
		
		List<Attr> attr = new ArrayList();
		attr = attrService.quary(user.getId(),menuId);
	
		List<Integer> att = new ArrayList();
		for(int i = 0; i < attr.size(); i ++){
			att.add(attr.get(i).getMenuId());
		}
		
		
		
		for(int i = 0; i < mList.size(); ++i){
			for(int j = 0; j < att.size(); j++){
				if(mList.get(i).equals(att.get(j))){
					menuList.get(i).setCreateTime("1");
					
					break;
				}
			}
		}
	
		mm.addAttribute("menuList", menuList);
		mm.addAttribute("menuId",menuId);
		mm.addAttribute("userId", user.getId());	
		return "/adtive/new_main_div";
		}
	}
	


	@RequestMapping(value="/p_attribution_pop1.html")
	public String p_attribution_pop1(Integer menuId , ModelMap mm, HttpServletRequest request,HttpServletResponse response){
		User user=(User) request.getSession().getAttribute("user");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String jud = request.getParameter("cancel");
		if(jud!=null){
			return null;
		}else{
			List<Menu> menuList=menuService.queryMenuByRoleId(user.getRole(), menuId);
			   
		    for(Menu menulist : menuList ){//三级id
				List<Menu> menus  = menuService.queryMenuByRoleId(user.getRole(), menulist.getId());//四级属性
				List<Integer> ls_2 = new ArrayList();
				for(int j = 0; j < menus.size(); j ++){  //获取全部四级属性的id 男女
					ls_2.add(menus.get(j).getId());
				}
				List<Attr> ls_3 = new ArrayList();
				ls_3 = attrService.quary(user.getId(),menulist.getId());//获取选中的四级属性
				
				List<Integer> ls_4 = new ArrayList();
				for(Attr at : ls_3){
					ls_4.add(at.getMenuId());
				}
				
				for(int l = 0; l < ls_2.size(); ++l){
					for(int m = 0; m < ls_4.size(); m++){
						if(ls_2.get(l).equals(ls_4.get(m))){ // 在全部的三级属性中将选中的四级属性的值化为1
							menus.get(l).setCreateTime("1");
							break;
						}
					}
					
				}
				menulist.setModel(menus);
				
			}
		    
		    List<String> st = new ArrayList<String>();
		    for(Menu menulist : menuList){
		    	List<Menu> menus  = menuService.queryMenuByRoleId(user.getRole(), menulist.getId());//四级属性
		    	st.add(menus.get(0).getParentId());
		    }
		    mm.addAttribute("st", st);
		    mm.addAttribute("count", st.size());
		    mm.addAttribute("menuList", menuList);
			mm.addAttribute("menuId",menuId);
			mm.addAttribute("userId", user.getId());
		return "/adtive/pop_main_div";
		}

	}



	@RequestMapping(value="/p1_attribution.do")
	public void p1_attribution(HttpServletRequest request){
		
		User user=(User) request.getSession().getAttribute("user");
		String jud = request.getParameter("cancel");
		if(jud!=null){
			
		}else{
		String[] str = request.getParameterValues("category");
		

        
		if(str!=null){
			for(int i = 0; i < str.length; ++i){
				try {
					str[i] =new String(str[i].getBytes("ISO-8859-1"),"UTF-8");//乱码解决方式
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		String userId = request.getParameter("user_id");
		String parentId = request.getParameter("menu_id");
	    
	    if(str!=null){
	    	attrService.attrDelete(Integer.parseInt(parentId));
	    	for(int i = 0; i < str.length; ++i){
	    		Attr attr = new Attr();
	    		attr.setMenuId(Integer.parseInt(str[i]));
	    		attr.setUserId(Integer.parseInt(userId));
	    		attr.setParentId(Integer.parseInt(parentId));
	    		attrService.InsertValue(attr);
	    	}
	    }
		}  
		
	}
	
	@RequestMapping(value="/p1_attribution_pop.do")
	public void p1_attribution_pop(HttpServletRequest request){
		
		User user=(User) request.getSession().getAttribute("user");
		
		String jud = request.getParameter("cancel");
		if(jud!=null){}else{
			
			List<String[]> ls = new ArrayList<String[]>();
			int count = Integer.valueOf(request.getParameter("count"));
			
			for(int i = 0; i < count; i ++){
							
				String[] str = request.getParameterValues(i+"");
				
				ls.add(str);
				
			}
		
			for(String[] str : ls){
				if(str!=null){
					for(int i = 0; i < str.length; ++i){
						try {
							str[i] =new String(str[i].getBytes("ISO-8859-1"),"UTF-8");//乱码解决方式
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}

		
		String userId = request.getParameter("user_id");
	    String s[] = request.getParameterValues("parent_id");
		int acount = 0;
		for(String[] str : ls){
		System.out.println(acount);
			if(str!=null){
		    	attrService.attrDelete(Integer.parseInt(s[acount]));
		    	System.out.println("我是父id"+s[acount]);
		    	for(int i = 0; i < str.length; ++i){
		    		Attr attr = new Attr();
		    		attr.setMenuId(Integer.parseInt(str[i]));
		    		attr.setUserId(Integer.parseInt(userId));
		    		attr.setParentId(Integer.parseInt(s[acount]));
		    		attrService.InsertValue(attr);
		    	}
		    	
		    }
			acount++;
		}
	    
		}
	}
	
	
	
	
	@RequestMapping(value="/deleteAllAttr.do")
	public String deleteAllAttr(String act, ModelMap mm, HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		
		List<Menu> menuList=menuService.queryMenuByRoleId(user.getRole(),40 );
		
        mm.addAttribute("menuList",menuList);
		
		try {
			act = new String(act.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(act.equals("res")){
			attrService.deleteAllAttr(user.getId());
		}
		return "/adtive/new_main";
		
	}
	
	/**
	 * 分页查询
	 * @param pageOffset 当前页
	 */
	@RequestMapping(value="/user/queryPage.html")
	public String queryPage(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, HttpServletRequest request, ModelMap map){
		if(pageOffset<0){
			pageOffset=0;
		}
		StringBuffer total=new StringBuffer();
		User user=(User) request.getSession().getAttribute("user");
		List<User> userList = userService.queryPage(new User(user.getId(),pageOffset,pageSize),total);
		map.addAttribute("userList", userList);
		map.addAttribute("total", Long.parseLong(total+""));
		return "/user/view_main_user";
	}
	
	@RequestMapping(value="/user/queryPageUserForAd.html")
	public String queryPageUserForAd(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, HttpServletRequest request, ModelMap map){
		if(pageOffset<0){
			pageOffset=0;
		}
		User user=(User) request.getSession().getAttribute("user");
		
		StringBuffer total=new StringBuffer();
		List<Map<String, Object>> userList = userService.queryPageUserForAd(new User(user.getId(),pageOffset,pageSize),total);
		map.addAttribute("userList", userList);
		map.addAttribute("total", Long.parseLong(total+""));
		return "/user/list_ad_user";
	}
	
	
	/**
	 * 保存广告主
	 */
	@RequestMapping(value="/user/saveUser.html")
	public String saveUser(User userEntity , HttpServletRequest request, ModelMap map){
		try{
			if(userEntity.getResidualMoney()==null){
				userEntity.setResidualMoney(0D);
			}
			User user=(User) request.getSession().getAttribute("user");
			Double userResidualMoney=user.getResidualMoney()-userEntity.getResidualMoney();
			if(userResidualMoney>=0){
				user.setResidualMoney(userResidualMoney);
				int max=9999;
				int min=1000;
				Random random = new Random();
	
				 //创建一个通用的多部分解析器  
		        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		        //判断 request 是否有文件上传,即多部分请求  
		        if(multipartResolver.isMultipart(request)){  
		            //转换成多部分request    
		            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		            //取得request中的所有文件名  
		            Iterator<String> iter = multiRequest.getFileNames();
		            while(iter.hasNext()){  
		                //取得上传文件  
		                MultipartFile file = multiRequest.getFile(iter.next());
		                if(file != null){  
		                    //取得当前上传文件的文件名称  
		                    String myFileName = file.getOriginalFilename();
		                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
		                    if( !"".equals(myFileName.trim())){  
		                    	logger.info(myFileName);
		                        //重命名上传后的文件名 
		                    	
		                        String fileName = new Date().getTime()+ random.nextInt(max)%(max-min+1) + min+myFileName.substring( myFileName.lastIndexOf("."), myFileName.length());
		                        String savePath = "/data/image/adtive/"+ fileName;
//		                        String savePath = "g://data/"+ fileName;
	//	                        dis.setImgUrl("/certificate/"+fileName);
		                        logger.info(savePath);
		                        userEntity.setBusinessLicense("/adimage/"+fileName+";"+userEntity.getBusinessLicense());
		                        logger.info(userEntity.getBusinessLicense());
								File localFile = new File(savePath);
								file.transferTo(localFile);// save
		                    }  
		                }  
		            }  
		              
		        }
				
				userEntity.setPassword(MD5.ToMD5(userEntity.getPassword()));
				userEntity.setParentId(user.getId());
				userEntity.setAvailable("1");
				userEntity.setCreateTime(DateUtil.getDateTime());
				userEntity.setState(1);
				userService.saveUser(userEntity,null);
				map.addAttribute("msg", "新建用户成功！！");
			}else{
				map.addAttribute("msg", "新建用户失败，充值金额有误！！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/user/save_client_user";
	}
	
	/**
	 * 1:商务经理给代理商充值，
	 * 2:代理商给广告组充值
	 */
	@RequestMapping(value="/user/recharge.html")
	public String recharge(User userEntity , Double plusMoney, HttpServletRequest request, ModelMap map){
		boolean flag=false;
		User user=(User) request.getSession().getAttribute("user");
		if(user.getRole()==2){
			flag=true;
		}else if(user.getRole()==3){
			Double userResidualMoney=user.getResidualMoney()-plusMoney;
			if(userResidualMoney>=0){
				user.setResidualMoney(userResidualMoney);
				flag=true;
			}
		}
		
		if(flag){
			userEntity.setResidualMoney(userEntity.getResidualMoney()+plusMoney);
			MoneyLog moneyLog=new MoneyLog();
			moneyLog.setOperateUserId(user.getId());
			moneyLog.setFromUserId(user.getId());
			moneyLog.setToUserId(userEntity.getId());
			moneyLog.setMoney(plusMoney);
			moneyLog.setType(0);
			moneyLog.setCreatTime(DateUtil.getDateTime());
			userService.recharge(userEntity,user,moneyLog);
			request.getSession().setAttribute("user", user);
			map.addAttribute("userEntity", userEntity);
			map.addAttribute("msg", "充值成功！！");
		}else{
			map.addAttribute("msg", "充值金额有误！！");
		}
		return "/user/recharge_client_user";
	}
	
	/**
	 * 暂停启用
	 */
	@RequestMapping(value="/user/updateUser.html")
	public String updateUser(String ids, String available , ModelMap map){
			for(String id:ids.split(",")){
				userService.updateUser(new User(Integer.parseInt(id),available));
			}
			map.addAttribute("msg", "修改成功！！");
		return "redirect:/user/queryPageUserForAd.html";
	}
	
	/**
	 * 审核
	 */
	@RequestMapping(value="/user/updateCheck.html")
	public String updateCheck(String ids, int check , ModelMap map){
		userService.updateCheck( ids, check);
		map.addAttribute("msg", "审核成功！！");
		return "redirect:/user/lise_check.html";
	}
	
	/**
	 * 用户名唯一性验证
	 */
	@RequestMapping(value="/user/onlyOne.html")
	public @ResponseBody
    int onlyOne(HttpServletRequest request){
		int count=0;
		try {
			String username = new String(request.getParameter("username") .getBytes("iso8859-1"), "utf-8");
			count =userService.onlyOne(username);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	/**
	 * 用于页面跳转
	 */
	@RequestMapping(value="/user/show.html")
	public String show(String type, User userEntity, ModelMap map){
		if("save_client_user".equals(type)){
			return "user/save_client_user";
		}else if("recharge_client_user".equals(type)){
			userEntity=userService.queryOne(userEntity.getId());
			map.addAttribute("userEntity", userEntity);
			return "user/recharge_client_user";
		}else if("view_client_user".equals(type)){
			userEntity=userService.queryOne(userEntity.getId());
			
			map.addAttribute("img", userEntity.getBusinessLicense().split(";",0));
			map.addAttribute("userEntity", userEntity);
			return "user/view_client_user";
		}else{
			return "/adtive/login";
		}
		
	}
	/**
	 * 审核查询
	 */
	@RequestMapping(value="/user/lise_check.html")
	public String queryPageForCheck(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, HttpServletRequest request, ModelMap map){
		if(pageOffset<0){
			pageOffset=0;
		}
		StringBuffer total=new StringBuffer();
		User userEntity=new User();
		userEntity.setState(1);
		userEntity.setPageOffset(pageOffset);
		userEntity.setPageSize(pageSize);
		List<User> userList = userService.queryPageForCheck(userEntity,total);
		map.addAttribute("userList", userList);
		map.addAttribute("total", Long.parseLong(total+""));
		return "/user/list_check_user";
	}
	
	public static Integer getPageSize(){
		return pageSize;
	}

	public static void setPageSize(Integer pageSize) {
		UserController.pageSize = pageSize;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public AdvertiseDataService getAdvertiseDataService() {
		return advertiseDataService;
	}

	public void setAdvertiseDataService(AdvertiseDataService advertiseDataService) {
		this.advertiseDataService = advertiseDataService;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
}
