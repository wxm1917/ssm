package com.vatestar.cm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.vatestar.cm.entity.Admedia;
import com.vatestar.cm.entity.Admediadata;
import com.vatestar.cm.entity.MediaLabel;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.AdmediadataService;
import com.vatestar.util.DateUtil;
import com.vatestar.util.PageUtil;

@Controller
@RequestMapping(value="media")
public class MediaController {

	private static final Logger log = Logger.getLogger(AdvertiseController.class);
	private static int pageSize=10;
	@Autowired
	private AdmediadataService addataService;
	/**
	 * 媒体列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="medialist")	
	public ModelAndView mediaList(HttpServletRequest request,HttpServletResponse response,Integer current, Integer rowSize){
		ModelAndView  mv  =new ModelAndView();
		if(current==null){
			current=1;
		}
		if(rowSize==null){
			rowSize=10;
		}
		User user = (User)request.getSession().getAttribute("user");
		List<Admediadata> mediadatas=addataService.getMediadata((current-1)*rowSize,rowSize,user.getId());
		Integer rowCount = addataService.countData(user.getId());
		PageUtil page = new PageUtil(current,rowCount,rowSize);
		page.setList(mediadatas);
		mv.addObject("pu", page);
		mv.addObject("list",mediadatas);
		mv.setViewName("/media/media");
		return mv;
	}
	/**
	 * 跳转添加媒体
	 * @param mediadata
	 * @return
	 */
	@RequestMapping(value="toaddmedia")	
	public ModelAndView toaddmedia(Admediadata mediadata){
		ModelAndView  mv  =new ModelAndView();
		List<MediaLabel> mediaLabels = addataService.quarylabel(0);
		mv.addObject("list",mediaLabels);
		mv.setViewName("/media/media_add");
		return mv;
	}
	/**
	 * 添加媒体
	 * @param request
	 * @param response
	 * @param mediadata
	 * @param file
	 * @return
	 */
	@RequestMapping(value="addmedia")	
	public ModelAndView upimage(HttpServletRequest request,HttpServletResponse response,Admediadata mediadata,MultipartFile file){
		ModelAndView  mv  =new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		String path = request.getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
        File targetFile = new File(path, fileName);
		try {
			file.transferTo(targetFile);
			mediadata.setFilepath("/upload/"+fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.setViewName("redirect:/media/medialist.html");
			return mv;
		}
		
		mediadata.setCtime(DateUtil.getDateTime());
		mediadata.setUserid(user.getId());
		addataService.addMediadata(mediadata);
		mv.setViewName("redirect:/media/medialist.html");
		return mv;
	}
	/**
	 * 异步添加媒体资源
	 * @param media
	 * @return
	 */
	@RequestMapping(value="admedialist", produces="text/html;charset=UTF-8")	
	@ResponseBody
	public String admediaList( Admedia media){
		int id = addataService.addMedia(media );
		return String.valueOf(media.getId());
	}
	/**
	 * 异步删除媒体资源
	 * @param media
	 */
	@RequestMapping(value="remedia")	
	public void remedia( Admedia media){
		addataService.remedia(media);;
	}
	/**
	 * 异步获取媒体列表
	 * @param optimal
	 * @param antistop
	 * @return
	 */
	@RequestMapping(value="getmedias",produces="text/html;charset=UTF-8" )	
	@ResponseBody
	public String  getMedias(String optimal,String antistop ){
		List<Admediadata> admediadatas = addataService.getMedias(optimal, antistop);
		return JSONArray.toJSONString(admediadatas);
	}
	/**
	 * 异步获取媒体所对应的标签
	 * @param id
	 * @return
	 */
	@RequestMapping(value="getlabel.html",produces="text/html;charset=UTF-8" )	
	@ResponseBody
	public String  getLbael(int id){
		
		List<MediaLabel> mediaLabels = addataService.quarylabel(id);
		return JSONArray.toJSONString(mediaLabels);
	}
}
