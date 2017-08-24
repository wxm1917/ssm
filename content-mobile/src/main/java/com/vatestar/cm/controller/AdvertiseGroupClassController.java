package com.vatestar.cm.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.vatestar.cm.entity.AdGroup;
import com.vatestar.cm.entity.AddGroupClass;
import com.vatestar.cm.entity.Admedia;
import com.vatestar.cm.entity.Admediadata;
import com.vatestar.cm.entity.MediaLabel;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.AddGroupClassService;
import com.vatestar.cm.service.AdmediadataService;
import com.vatestar.cm.service.AdvertiseGroupService;
import com.vatestar.util.DateUtil;
import com.vatestar.util.PageUtil;

@Controller
@RequestMapping(value="/advertiseGroupClass")
public class AdvertiseGroupClassController {
	
	private static final Logger log = Logger.getLogger(AdvertiseGroupClassController.class);
	private static int pageSize=10;
	@Resource
	private AdmediadataService adservice;
	@Resource
	private AddGroupClassService agcservice;
	@Resource
	private AdvertiseGroupService advertiseGroupService;
	
	/**
	 * @desc 广告组查询
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/list2")
	public ModelAndView list2(HttpServletRequest request,Integer groupid,Integer current, Integer rowSize){
		ModelAndView mv = new ModelAndView();
		if(current==null){
			current=1;
		}
		if(rowSize==null){
			rowSize=10;
		}
		List<AddGroupClass>  agcs = agcservice.queryaddGroupClass(0);
		
		PageUtil page = new PageUtil(current,agcs.size(),rowSize);
		page.setList(agcs);
		mv.addObject("pu", page);
		mv.addObject("groupid", groupid);
		mv.addObject("agcs", agcs);
		mv.setViewName("/adtive/advertise/advertiseGroupClass_list2");
		return mv;
	}
	/**
	 * @desc 广告组添加2页面
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/add2")
	public ModelAndView add2(HttpServletRequest request,Integer groupid,String parid){
		ModelAndView mv = new ModelAndView();
		User user=(User) request.getSession().getAttribute("user");
		List<Admedia>  adlist = adservice.getQueryMedias();
		List<MediaLabel> labels = adservice.getCIBNlabel("0");
		List<AdGroup> groupList = advertiseGroupService.getAllGroup(user.getId());
 		mv.addObject("adlist",adlist);
 		mv.addObject("groupList",groupList);
 		mv.addObject("labels",labels);
		mv.addObject("groupid", groupid);
		mv.setViewName("/adtive/advertise/advertiseGroupClass_add2");
		return mv;
	}
	
	@RequestMapping(value="/adpositionid" ,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String adPositionId(HttpServletRequest request,int mediaid){
		User user=(User) request.getSession().getAttribute("user");
		AdGroup adgroup = advertiseGroupService.getGroupById(mediaid);
		List<String> mediasid = Arrays.asList(adgroup.getMedia().split(","));
		Set<Admedia>  meset = new HashSet<Admedia>();
		Set<String> labelset = new HashSet<String>();
		for(String id : mediasid){
			List<Admedia> melist = adservice.getMedias(Integer.valueOf(id), user.getId());
			meset.addAll(melist);
			List<String> labellist = adservice.getMediaLabel(Integer.valueOf(id), user.getId()) ;
			labelset.addAll(labellist);
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("melist", meset);
		map.put("labellist", labelset);
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * @desc 广告组添加2
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/save2")
	public ModelAndView save2(HttpServletRequest request,AddGroupClass adgroupclass,MultipartFile file){
		ModelAndView mv = new ModelAndView();
		User user=(User) request.getSession().getAttribute("user");
		String path = request.getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
        File targetFile = new File(path, fileName);
		try {
			file.transferTo(targetFile);
			adgroupclass.setFilepath("/upload/"+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		adgroupclass.setCtime(DateUtil.getDateTime());
		adgroupclass.setUser_id(user.getId());
		agcservice.inseraddGroupClass(adgroupclass);
		mv.setViewName("redirect:list2.html");
		return mv;
	}

	/**
	 * 广告组详细
	 * @author hjr
	 */
	@RequestMapping(value="detail2")
	public ModelAndView detail2(HttpServletRequest request, HttpServletResponse response, Integer id){
		ModelAndView mv = new ModelAndView();
		AddGroupClass groupclass = agcservice.queryaddGroupClassById(id);
		mv.addObject("groupclass", groupclass);
		mv.setViewName("/adtive/advertise/advertiseGroupClass_detail2");
		return mv;
	}
	/**
	 * 广告组更新页面
	 * @author hjr
	 */
	@RequestMapping(value="edit2")
	public ModelAndView edit2(HttpServletRequest request, HttpServletResponse response, Integer id){
		ModelAndView mv = new ModelAndView();
		AddGroupClass groupclass = agcservice.queryaddGroupClassById(id);
		mv.addObject("groupclass", groupclass);
		mv.setViewName("/adtive/advertise/advertiseGroupClass_update2");
		return mv;
	}
	/**
	 * @desc 广告组更新
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/update2")
	public ModelAndView update2(HttpServletRequest request, AddGroupClass adgroupclass){
		ModelAndView mv = new ModelAndView();
		/*if(adgroupclass.getMedia_group()==0){
			adgroupclass.setVideo_media("");
			adgroupclass.setPlanting_media("");
		}else if(adgroupclass.getMedia_group()==1){
			adgroupclass.setLive_media("");
			adgroupclass.setPlanting_media("");
		}else if(adgroupclass.getMedia_group()==2){
			adgroupclass.setVideo_media("");
			adgroupclass.setLive_media("");
		}
		if(adgroupclass.getCommodity_orientation().equals("0")){
			adgroupclass.setCommodity("");
		}
		if(adgroupclass.getScene_orientation().equals("0")){
			adgroupclass.setScene("");
		}
		if(adgroupclass.getFacerecognition_orientation().equals("0")){
			adgroupclass.setFacerecognition("");
		}
		if(adgroupclass.getEmotion_orientation().equals("0")){
			adgroupclass.setEmotion("");
		}
		if(adgroupclass.getVoice_orientation().equals("0")){
			adgroupclass.setVoice("");
		}
		if(adgroupclass.getMusic_orientation().equals("0")){
			adgroupclass.setMusic("");
		}
		if(adgroupclass.getEquipment_orientation().equals("0")){
			adgroupclass.setEquipment("");
		}
		if(adgroupclass.getTerminal_orientation().equals("0")){
			adgroupclass.setTerminal("");
		}*/
		agcservice.updateddGroupClass(adgroupclass);
		mv.setViewName("redirect:list2?groupid="+adgroupclass.getGroup_id());
		return mv;
	}
	/**
	 * 开启选中广告组
	 */
	@RequestMapping(value="startCheckGroup")
	public ModelAndView startCheckGroup(HttpServletRequest request, HttpServletResponse response, String ids){
		ModelAndView mv = new ModelAndView();
		try {
			User user=(User) request.getSession().getAttribute("user");
			List<Integer> paraList = new ArrayList<Integer>();
			if(ids!=null&&!"".equals(ids)){
				String[] strs = ids.split(",");
				for(int i=0;i<strs.length;i++){
					paraList.add(Integer.parseInt(strs[i]));
				}
				agcservice.startCheckGroup(paraList);
			}
			
			mv.setViewName("redirect:list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 暂停选中广告组
	 */
	@RequestMapping(value="pauseCheckGroup")
	public ModelAndView pauseCheckGroup(HttpServletRequest request, HttpServletResponse response, String ids){
		ModelAndView mv = new ModelAndView();
		try {
			User user=(User) request.getSession().getAttribute("user");
			List<Integer> paraList = new ArrayList<Integer>();
			if(ids!=null&&!"".equals(ids)){
				String[] strs = ids.split(",");
				for(int i=0;i<strs.length;i++){
					paraList.add(Integer.parseInt(strs[i]));
				}
				agcservice.pauseCheckGroup(paraList);
			}
			mv.setViewName("redirect:list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
