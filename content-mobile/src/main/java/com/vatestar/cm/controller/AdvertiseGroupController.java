package com.vatestar.cm.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vatestar.cm.entity.AdGroup;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.AdvertiseGroupService;
import com.vatestar.cm.service.AdvertiseService;
import com.vatestar.util.DateUtil;
import com.vatestar.util.PageUtil;

@Controller
@RequestMapping(value="/advertiseGroup")
public class AdvertiseGroupController {
	
	private static final Logger log = Logger.getLogger(AdvertiseGroupController.class);
	private static int pageSize=10;
	@Resource
	private AdvertiseGroupService advertiseGroupService;
	@Resource
	private AdvertiseService advertiseService;
	
	/**
	 * @desc 广告组信息统计
	 * @author hjr
	 * @date 2014-10-31
	 */
	@RequestMapping(value="/statistics")
	public String statistics(Integer id, ModelMap map, String groupName, HttpServletRequest request){
		String offset=request.getParameter("pager.offset");
		int pageCoutn=0;
		if(StringUtils.isNotEmpty(offset)){
			pageCoutn= Integer.parseInt(offset);
		}
		
		Map<String,Object> allGroupMap=advertiseGroupService.statisticsAll(id);
		
		StringBuffer total=new StringBuffer();
		List<Map<String,Object>> groupList=advertiseGroupService.statistics(id,pageCoutn, pageSize,total);
		map.addAttribute("total", Long.parseLong(total+""));
		map.addAttribute("allGroupMap", allGroupMap);
		map.addAttribute("groupList", groupList);
		map.addAttribute("groupName", groupName);
		map.addAttribute("id", id);
		//报表分析-广告列表
		return "/adtive/advertise/advertiseGroup_main";
	}
	/**
	 * @desc 广告组列表
	 * @author hjr
	 * @date 2014-10-31
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Integer id, Integer current, Integer rowSize, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		if(current==null){
			current=1;
		}
		if(rowSize==null){
			rowSize=10;
		}
		if(id==null){
			User user = (User)request.getSession().getAttribute("user");
			id=user.getId();
		}
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		dataList = advertiseGroupService.getDataList((current-1)*rowSize,rowSize,id);
		Integer rowCount = advertiseGroupService.countData(id);
		PageUtil page = new PageUtil(current,rowCount,rowSize);
		page.setList(dataList);
		mv.addObject("pu", page);
		mv.addObject("id", id);
		//投放管理-广告计划 
		mv.setViewName("/adtive/advertise/advertiseGroup_list");
		return mv;
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	/*
	 * 
	 * 数据导入处理器
	 */
	@RequestMapping(value="/new_list")
	public ModelAndView new_list(Integer id, Integer current, Integer rowSize, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		if(current==null){
			current=1;
		}
		if(rowSize==null){
			rowSize=10;
		}
		if(id==null){
			User user = (User)request.getSession().getAttribute("user");
			id=user.getId();
		}
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		dataList = advertiseGroupService.getDataList((current-1)*rowSize,rowSize,id);
		Integer rowCount = advertiseGroupService.countData(id);
		PageUtil page = new PageUtil(1,rowCount,10);
		page.setList(dataList);
		mv.addObject("pu", page);
		mv.addObject("id", id);
		 
		mv.setViewName("/adtive/advertise/new_advertiseGroup_list");
		return mv;
	}
	//////////////////////////////////////////////////////////////////////////////////////
	/**
	 * @desc 广告组添加页面
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		 
		mv.setViewName("/adtive/advertise/advertiseGroup_add");
		return mv;
	}
	
	/**
	 * @desc 广告组添加
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request, AdGroup group){
		ModelAndView mv = new ModelAndView();
		group.setcTime(DateUtil.getDateTime());
		User user = (User)request.getSession().getAttribute("user");
		group.setUserId(user.getId());
		group.setStatus(0);
		group.setUsername(user.getUsername());
		advertiseGroupService.save(group);
		mv.setViewName("redirect:list.html");
		return mv;
	}
	/**
	 * 广告组详细
	 * @author hjr
	 */
	@RequestMapping(value="detail")
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, Integer id){
		ModelAndView mv = new ModelAndView();
		AdGroup group = advertiseGroupService.getGroupById(id);
		User user = (User)request.getSession().getAttribute("user");
		 
		mv.addObject("group", group);
		mv.setViewName("/adtive/advertise/advertiseGroup_detail");
		return mv;
	}
	/**
	 * 广告组更新页面
	 * @author hjr
	 */
	@RequestMapping(value="edit")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, Integer id){
		ModelAndView mv = new ModelAndView();
		AdGroup group = advertiseGroupService.getGroupById(id);
		User user = (User)request.getSession().getAttribute("user");
		 
		mv.addObject("group", group);
		mv.setViewName("/adtive/advertise/advertiseGroup_update");
		return mv;
	}
	/**
	 * @desc 广告组更新
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/update")
	public ModelAndView update(HttpServletRequest request, AdGroup group){
		ModelAndView mv = new ModelAndView();
		if(group.getTimeOrientation()==0){
			group.setMedia("");
		}
		if(group.getRegionalOrientation()==0){
			group.setCity("");
		}
		if(group.getIndustryOrientation()==0){
			group.setIndustry("");
		}
		if(group.getPeopleOrientation()==0){
			group.setAge("");
			group.setSex("");
			group.setEducation("");
			group.setAddage("");;
		}
		group.setUpdateDate(DateUtil.getDateTime());
		User user = (User)request.getSession().getAttribute("user");
		group.setUserId(user.getId());
		group.setStatus(0);
		group.setUsername(user.getUsername());
		advertiseGroupService.update(group);
		mv.setViewName("redirect:list");
		return mv;
	}
	/**
	 * 开启选中广告组
	 */
	@RequestMapping(value="startCheckGroup")
	public ModelAndView startCheckGroup(HttpServletRequest request, HttpServletResponse response, String ids, String names){
		ModelAndView mv = new ModelAndView();
		try {
			User user=(User) request.getSession().getAttribute("user");
			names= URLDecoder.decode(names,"UTF-8");
			List<Integer> paraList = new ArrayList<Integer>();
			if(ids!=null&&!"".equals(ids)){
				String[] strs = ids.split(",");
				for(int i=0;i<strs.length;i++){
					paraList.add(Integer.parseInt(strs[i]));
				}
				advertiseGroupService.startCheckGroup(paraList,user.getUsername(),names);
			}
			
			mv.setViewName("redirect:list");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 暂停选中广告组
	 */
	@RequestMapping(value="pauseCheckGroup")
	public ModelAndView pauseCheckGroup(HttpServletRequest request, HttpServletResponse response, String ids, String names){
		ModelAndView mv = new ModelAndView();
		try {
			User user=(User) request.getSession().getAttribute("user");
			names= URLDecoder.decode(names,"UTF-8");
			List<Integer> paraList = new ArrayList<Integer>();
			if(ids!=null&&!"".equals(ids)){
				String[] strs = ids.split(",");
				for(int i=0;i<strs.length;i++){
					paraList.add(Integer.parseInt(strs[i]));
				}
				advertiseGroupService.pauseCheckGroup(paraList,user.getUsername(),names);
			}
			mv.setViewName("redirect:list");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 删除选中广告组
	 */
	@RequestMapping(value="delCheckGroup")
	public ModelAndView delCheckGroup(HttpServletRequest request, HttpServletResponse response, String ids){
		ModelAndView mv = new ModelAndView();
		List<Integer> paraList = new ArrayList<Integer>();
		if(ids!=null&&!"".equals(ids)){
			String[] strs = ids.split(",");
			for(int i=0;i<strs.length;i++){
				paraList.add(Integer.parseInt(strs[i]));
			}
			Integer num = advertiseGroupService.delCheckGroup(paraList);
			if(num>0){
				for(int i=0;i<strs.length;i++){
					advertiseService.delAdvertiseByGroupId(Integer.parseInt(strs[i]));
				}
			}
		}
		mv.setViewName("redirect:list");
		return mv;
	}
}	
	

