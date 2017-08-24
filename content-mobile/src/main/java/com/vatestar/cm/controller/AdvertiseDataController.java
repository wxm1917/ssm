package com.vatestar.cm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vatestar.cm.entity.CreativeData;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.AdvertiseDataService;
import com.vatestar.util.AjaxWrite;
import com.vatestar.util.PageUtil;

@Controller
@RequestMapping(value="/advertiseData")
public class AdvertiseDataController {
	
	private static final Logger log = Logger.getLogger(AdvertiseDataController.class);
	private static int pageSize=10;
	@Resource
	private AdvertiseDataService advertiseDataService;
	@Resource
	private ServletContext servletContext;  
	/**
	 * @desc 用户登录页面
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/list")
	public ModelAndView login(@RequestParam(value ="pager.offset",defaultValue="0" )int  pageOffset, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		if(pageOffset<0){
			pageOffset=0;
		}
		User user = (User)request.getSession().getAttribute("user");
		Map<String,Object> sumMap = new HashMap<String,Object>();
		sumMap = advertiseDataService.countAData(user.getId());
		List<Map<String,Object>> sumMapList = new ArrayList<Map<String,Object>>();
		sumMapList = advertiseDataService.countADataListDay(pageOffset,pageSize,user.getId());
		Double balance = user.getResidualMoney();
		if(sumMap!=null&&sumMap.get("charge")!=null){
			balance = user.getResidualMoney()-(Float)sumMap.get("charge");
		}
//		balance = balance>0?balance:0;
		DecimalFormat df = new DecimalFormat("0.00");
		String extraMoney = df.format(balance);
		Integer total = advertiseDataService.countData(user.getId());
		PageUtil page = new PageUtil(pageOffset,total,pageSize);
		page.setList(sumMapList);
		mv.addObject("pu", page);
		 
		mv.addObject("total", total);
		mv.addObject("extraMoney", extraMoney);
		mv.addObject("sumMap", sumMap);
		mv.setViewName("/adtive/main");
		return mv;
	}

	@RequestMapping(value="/ShowAdverDate.html")
	public ModelAndView ShowAdverDate(Integer current,Integer rowSize, String sort, Integer pageCount, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		if(current==null){
			current =1;
		}
		if(rowSize==null){
			rowSize =10;
		}
		User user = (User)request.getSession().getAttribute("user");

		List<Map<String,Object>> sumMapList = new ArrayList<Map<String,Object>>();
		sumMapList = advertiseDataService.countADataListDay(current,rowSize,user.getId());

		Integer total = advertiseDataService.countData(user.getId());
		PageUtil page = new PageUtil(current,total,rowSize);
		page.setList(sumMapList);
		mv.addObject("pu", page);
		mv.setViewName("/dimensionsetting/Dimensionlist");
		return mv;
	}
	


	@RequestMapping(value="/tosave.html")
	public ModelAndView tosave(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			mv.setViewName("redirect:/login.html");
			return mv;
		}
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		mv.addObject("user",user);
		mv.addObject("cTime",sf.format(new Date()));
		mv.setViewName("/adtive/addData");
		return mv;
	}

	@RequestMapping(value="/save.html")
	public ModelAndView save(HttpServletRequest request,CreativeData creativeData){
		ModelAndView mv = new ModelAndView();
		if(creativeData.getCreativeId()==null){
			mv.setViewName("redirect:/login.html");
			return mv;
		}
		if(creativeData.getAdv()!=0){
			advertiseDataService.saveData(creativeData);
		}
		mv.setViewName("/adtive/addData");
		return mv;
	}
	
	
	@RequestMapping(value="/exceldownload.html")
	public void exceldownload(HttpServletRequest request,HttpServletResponse response,String fdate, String sdate){
        String path = servletContext.getRealPath("/");  
        String filepath = path+"execl/customer.xlsx";
        File file = new File(filepath);
        if(file.exists()){
        	file.delete();
        }
		String mess = advertiseDataService.exceldownload( fdate,  sdate ,filepath);
		AjaxWrite.writeText(response, mess);
	}

	@RequestMapping(value="/download.html")
	public void  download(HttpServletRequest request,HttpServletResponse response,String fdate, String sdate){
		//获取网站部署路径(通过ServletContext对象)，用于确定下载文件位置，从而实现下载  
        String path = servletContext.getRealPath("/");  
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型  
        response.setContentType("multipart/form-data");  
        //2.设置文件头：最后一个参数是设置下载文件名 
        response.setHeader("Content-Disposition", "attachment;fileName="+"customer.xlsx");  
        ServletOutputStream out;  
        //通过文件路径获得File对象(假如此路径中有一个download.pdf文件) 
        String filepath = path+"execl/customer.xlsx";
        File file = new File(filepath);
        if(file.exists()){
        	file.delete();
        }
		String sr = advertiseDataService.exceldownload( fdate,  sdate ,filepath);
		log.info(sr);
		try {  
            FileInputStream inputStream = new FileInputStream(filepath);  
            //3.通过response获取ServletOutputStream对象(out)  
            out = response.getOutputStream();  
            int b = 0;  
            byte[] buffer = new byte[512];  
            while ((b=inputStream.read(buffer)) != -1){
            	log.info(buffer);
                //4.写到输出流(out)中  
                 out.write(buffer,0,b);  
            }  
            inputStream.close();  
            out.close();  
            out.flush();  
            
        } catch (IOException e) {  
            e.printStackTrace();  
        }
	}
}
