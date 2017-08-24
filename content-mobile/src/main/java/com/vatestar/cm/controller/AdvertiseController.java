package com.vatestar.cm.controller;


import com.alibaba.fastjson.JSONObject;
import com.vatestar.cm.entity.AdGroup;
import com.vatestar.cm.entity.Creative;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.AdvertiseGroupService;
import com.vatestar.cm.service.AdvertiseService;
import com.vatestar.util.DateUtil;
import com.vatestar.util.PropertiesUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/advertise")
public class AdvertiseController {
	
	private static final Logger log = Logger.getLogger(AdvertiseController.class);
	private static int pageSize=10;
	@Resource
	private AdvertiseService advertiseService;
	@Resource
	private AdvertiseGroupService advertiseGroupService;
	
	/**
	 * @desc 广告组列表
	 * @author hjr
	 * @date 2014-10-31
	 */
	@RequestMapping(value="/statistics")
	public String statistics(Integer id, String adName, ModelMap map, HttpServletRequest request){
		String offset=request.getParameter("pager.offset");
		int pageCoutn=0;
		if(StringUtils.isNotEmpty(offset)){
			pageCoutn= Integer.parseInt(offset);
		}
		
		Map<String,Object> allctMap=advertiseService.statisticsAll(id);
		
		StringBuffer total=new StringBuffer();
		List<Map<String,Object>> ctList=advertiseService.statistics(id,pageCoutn, pageSize,total);
		map.addAttribute("total", Long.parseLong(total+""));
		map.addAttribute("allctMap", allctMap);
		map.addAttribute("ctList", ctList);
		map.addAttribute("adName", adName);
		map.addAttribute("id", id);
		return "/adtive/advertise/advertise_main";
	}
	
	/**
	 * @desc 广告列表
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Creative ct, @RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, HttpServletRequest request,Integer groupid){
		ModelAndView mv = new ModelAndView();
		if(pageOffset<0){
			pageOffset=0;
		}
		ct.setPageOffset(pageOffset);
		User user = (User)request.getSession().getAttribute("user");
		ct.setGroupId(groupid);
		List<AdGroup> groupList = advertiseGroupService.getAllGroup(user.getId());
	//	List<Creative> clist = advertiseService.queryByGroupId(groupId)
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		dataList = advertiseService.getDataList(ct);
		Integer total = advertiseService.countData(ct);
		
		mv.addObject("creative", ct);
		mv.addObject("total", total==0?1:total);
		mv.addObject("groupList", groupList);
		mv.addObject("dataList", dataList);
		 
		mv.setViewName("/adtive/advertise/advertise_list");
		return mv;
	}
	@RequestMapping(value="/queryPage")
	public String queryPage(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, Creative ct, ModelMap map){
		
		ct.setPageOffset(pageOffset);
		StringBuffer total=new StringBuffer();
		List<Creative> ctList = advertiseService.queryPage(ct,total);
		map.addAttribute("ctList", ctList);
		map.addAttribute("total", Long.parseLong(total+""));
		map.addAttribute("ct", ct);
		 
		return "/creative/lise_creative";
	}
	/**
	 * @desc 添加广告页面
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		List<AdGroup> groupList = advertiseGroupService.getAllGroup(user.getId());
		mv.addObject("groupList", groupList);
		 
		mv.setViewName("/adtive/advertise/advertise_add");
		return mv;
	}
	/**
	 * @desc 添加广告
	 * @author hjr
	 * @date 2014-10-31
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/save",method= RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Creative advertise){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		advertise.setcTime(DateUtil.getDateTime());
		advertise.setStatus(0);
		advertise.setUsername(user.getUsername());
		advertiseService.save(advertise);
		advertise.setAdType(0);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	/**
	 * 保存图片用于图片预览
	 * @throws IOException
	 */
	@RequestMapping(value="saveShowImg")
	public String saveShowImg(HttpServletRequest request, HttpServletResponse response,
                              MultipartFile adtiveImage, String oldImgSrc){
		//String picPath = request.getSession().getServletContext().getRealPath("/adImage");
		String picPath = PropertiesUtil.getStringValue("creative.img.path");
		picPath=picPath+"/";
		//选择图片时删除旧的图片以节省空间
		if(oldImgSrc!=null&&!"".equals(oldImgSrc)){
			oldImgSrc = oldImgSrc.substring(oldImgSrc.lastIndexOf("/")+1,oldImgSrc.length());
			File oldPic = new File(picPath+oldImgSrc);
			if(oldPic.exists()){
				oldPic.delete();
			}
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		long st= System.currentTimeMillis();
		String result = null;
		int width = 0;
		int height = 0;
		String res = null;
		if(adtiveImage!=null&&!adtiveImage.isEmpty()){
			String filename = adtiveImage.getOriginalFilename();
			FileInputStream fs;
			BufferedImage img;
			
			String ext = filename.substring(filename.lastIndexOf("."));
			String path=picPath+"ad"+st+ext;
			try {
				FileUtils.writeByteArrayToFile(new File(path), adtiveImage.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fs = new FileInputStream(new File(path));
				img = ImageIO.read(fs);
				width = img.getWidth();
				height = img.getHeight();
				fs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = "/adimage/"+"ad"+st+ext;
			Map<String,Object> resMap = new HashMap<String,Object>();
			resMap.put("width", width);
			resMap.put("height", height);
			resMap.put("imgSrc", result);
			res = JSONObject.toJSON(resMap).toString();
		}
	    try {
			response.getWriter().print(res);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 广告创意详细信息
	 * @author hjr
	 */
	@RequestMapping(value="detail")
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, Integer id, String groupName){
		ModelAndView mv = new ModelAndView();
		Creative advertise = advertiseService.getAdvertiseById(id);
		User user = (User)request.getSession().getAttribute("user");
		mv.addObject("advertise", advertise);
		mv.addObject("groupName", groupName);
		 
		mv.setViewName("/adtive/advertise/advertise_detail");
		return mv;
	}
	/**
	 * 修改创意状态
	 */
	@RequestMapping(value="updateAvailable")
	public ModelAndView updateAvailable(HttpServletRequest request, int type, String ids, String names){
		ModelAndView mv = new ModelAndView();
		try {
			names= URLDecoder.decode(names,"UTF-8");
			User user=(User) request.getSession().getAttribute("user");
			List<Creative> creativeList = new ArrayList<Creative>();
			if(ids!=null&&!"".equals(ids)){
				String[] idsArray = ids.split(",");
				for(int i=0;i<idsArray.length;i++){
					Creative cte=new Creative();
					cte.setId(Integer.parseInt(idsArray[i]));
					cte.setStatus(type);
					creativeList.add(cte);
				} 
				advertiseService.updateAvailable(creativeList,names,user.getUsername());
			}
			mv.setViewName("redirect:list");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 删除选中广告组
	 */
	@RequestMapping(value="delCheckAd")
	public ModelAndView delCheckAd(HttpServletRequest request, HttpServletResponse response, String ids){
		ModelAndView mv = new ModelAndView();
		List<Integer> paraList = new ArrayList<Integer>();
		if(ids!=null&&!"".equals(ids)){
			String[] strs = ids.split(",");
			String images = null;
			for(int i=0;i<strs.length;i++){
				paraList.add(Integer.parseInt(strs[i]));
				Creative advertise = advertiseService.getAdvertiseById(Integer.parseInt(strs[i]));
				if(images==null){
					images=advertise.getAdImage();
				}else{
					images=images+","+advertise.getAdImage();
				}
			}
			Integer m=advertiseService.delCheckAd(paraList);
			if(m>0){
				delFocusImg(request,response,images);
			}
		}
		mv.setViewName("redirect:list");
		return mv;
	}
	/**
	 * 广告创意更新页面(暂未使用)
	 * @author hjr
	 */
	@RequestMapping(value="edit")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, Integer id, String groupName){
		ModelAndView mv = new ModelAndView();
		Creative advertise = advertiseService.getAdvertiseById(id);
		User user = (User)request.getSession().getAttribute("user");
		mv.addObject("advertise", advertise);
		mv.addObject("groupName", groupName);
		 
		mv.setViewName("/adtive/advertise/advertise_update");
		return mv;
	}
	/**
	 * 删除旧的图片(暂未使用)
	 */
	@RequestMapping(value="delShowImg")
	public String delFocusImg(HttpServletRequest request, HttpServletResponse response, String oldImgs){
		String picPath = PropertiesUtil.getStringValue("creative.img.path");
		picPath=picPath.replaceAll("\\\\","/");
		picPath=picPath+"/";
		//选择图片时删除旧的图片以节省空间
		if(oldImgs!=null&&!"".equals(oldImgs)){
			String[] oldImg = oldImgs.split(",");
			if(oldImg!=null&&oldImg.length>0){
				for(int i=0;i<oldImg.length;i++){
					String imgStr = oldImg[i].substring(oldImg[i].lastIndexOf("/")+1,oldImg[i].length());
					File oldPic = new File(picPath+imgStr);
					if(oldPic.exists()){
						oldPic.delete();
					}
				}
			}
		}
		return null;
	}
}
