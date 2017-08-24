package com.vatestar.cm.controller;

import com.vatestar.cm.entity.EbsImgDate;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.EbsImgDateService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class EbsImgDateController {
	
	private static final Logger logger = Logger.getLogger(EbsImgDateController.class);
	
	@Resource
	private EbsImgDateService ebsImgDateService;
	
	/**
	 * 分页查询
	 * @param pageOffset 当前页
	 */
	@RequestMapping(value="/ebs/queryGroupPage.html")
	public String queryGroupPage(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, HttpServletRequest request, ModelMap map){
		if(pageOffset<0){
			pageOffset=0;
		}
		User user=(User) request.getSession().getAttribute("user");
		
		EbsImgDate ebsImgDate = new EbsImgDate();
		ebsImgDate.setPageOffset(pageOffset);
		ebsImgDate.setUserId(user.getId()+"");
		
		List<EbsImgDate> ebsImgList = ebsImgDateService.queryGroupPage(ebsImgDate);
		int ebsImgCount = ebsImgDateService.queryGroupPageCount(ebsImgDate);
		map.addAttribute("ebsImgList", ebsImgList);
		map.addAttribute("total", ebsImgCount);
		return "/adtive/advertise/ebs_img_list";
	}
	/**
	 * 分页查询
	 * @param pageOffset 当前页
	 */
	@RequestMapping(value="/ebs/queryPage.html")
	public String queryPage(@RequestParam(value ="pager.offset",defaultValue="0" )int pageOffset, EbsImgDate ebsImgDate, HttpServletRequest request, ModelMap map){
		if(pageOffset<0){
			pageOffset=0;
		}
		User user=(User) request.getSession().getAttribute("user");
		
		ebsImgDate.setPageOffset(pageOffset);
		ebsImgDate.setUserId(user.getId()+"");
		
		List<EbsImgDate> ebsImgList = ebsImgDateService.queryPage(ebsImgDate);
		int ebsImgCount = ebsImgDateService.queryPageCount(ebsImgDate);
		map.addAttribute("ebsImgList", ebsImgList);
		map.addAttribute("total", ebsImgCount);
		map.addAttribute("ebsImgDate", ebsImgDate);
		return "/adtive/advertise/ebs_imgdate_list";
	}
	
}
