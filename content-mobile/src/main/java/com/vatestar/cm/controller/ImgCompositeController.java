package com.vatestar.cm.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.ImgCompositeService;
import com.vatestar.cm.service.UserService;
import com.vatestar.util.Im4JavaUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.vatestar.server.exception.BadRequestException;
import com.vatestar.util.AjaxWrite;
import com.vatestar.util.FileUtil;
import com.vatestar.util.HttpUtil;


@Controller
public class ImgCompositeController {
	
	private static final Logger log = Logger.getLogger(AdvertiseController.class);
	
	
	//服务器临时存放路径地址
    public static final String IMG_STORE_ADDRESS ="images";

	@Resource
	private ImgCompositeService imgCompositeService;

	@Resource
	private UserService userService;

	/**
	 * @desc 用户登录页面
	 * @author hjr
	 * @date 2014-10-31
	 */
	@RequestMapping(value="/native.html")
	public ModelAndView login(User user, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		if(user!=null&& StringUtils.isNotEmpty(user.getUsername())&& StringUtils.isNotEmpty(user.getPassword())){
			user = userService.login(user);
			if(user!=null){
				request.getSession().setAttribute("user", user);
				mv.setViewName("redirect:demo.html");
			}else{
				mv.addObject("msg", "用户名或密码不正确");
				mv.setViewName("/imgComposite/login");
			}
		}else{
			mv.setViewName("/imgComposite/login");
		}
		return mv;
	}

	/**
	 * 跳转到图片组合页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/demo.html")
	public ModelAndView toCompositePage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Object sessionObj = request.getSession().getAttribute("user");
		// 如果Session为空，则跳转到指定页面
		if (sessionObj == null) {
			mv.setViewName("/imgComposite/login");
		}else{
			mv.setViewName("/imgComposite/imgComposite");
		}

		return mv;
	}

	/**
	 * 跳转到图片组合页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/demo1.html")
	public ModelAndView toCompositePage1(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Object sessionObj = request.getSession().getAttribute("user");
		// 如果Session为空，则跳转到指定页面
		if (sessionObj == null) {
			mv.setViewName("/imgComposite/login");
		}else{
			mv.setViewName("/imgComposite/img");
		}
		return mv;
	}
	
	@RequestMapping(value = "/img/composite/up.html", method = RequestMethod.POST)
    public void uploadImg(@RequestParam("imageFile") MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception {
		log.debug(">>>>> invoke upload img request");
        String filename = file.getOriginalFilename();
        
        if (!FileUtil.isPic(filename)) {
            throw new BadRequestException("图片格式错误");
        }
        //获取绝对路径
        String uploadDir = request.getSession().getServletContext().getRealPath("/");
        
        String filePath =HttpUtil.fileUploadImage(file,uploadDir);
		String orginFile = uploadDir+filePath;
		int[] widthAndHeigh = Im4JavaUtils.getWidthAndHeigh(orginFile);
		if(widthAndHeigh[0]>600){
			String fileType = filePath.substring(filePath.lastIndexOf("."));
			String newFilePath = filePath.substring(0,filePath.lastIndexOf("."))+"_zoom"+System.currentTimeMillis()+fileType;
			float op = (float) (600.0/(float)widthAndHeigh[0]);
			int height = (int) (op*widthAndHeigh[1]);
			Im4JavaUtils.zoomImage(orginFile,uploadDir+newFilePath,600,height);
			filePath = newFilePath;
		}


        log.debug(" filePath    >>>>> "+filePath);
        AjaxWrite.writeText(response, filePath);
    }
	
	 @RequestMapping(value = "/img/composite/do.html",method = RequestMethod.POST)
		public void composite(HttpServletRequest request, 
				            HttpServletResponse response,
				            @RequestParam("imgUrl") String imgUrl,//图片
				            @RequestParam("markUrl") String markUrl,//水印图片
				            @RequestParam(defaultValue = "0",required = false) Integer x,//相对于左上角偏移量
				            @RequestParam(defaultValue = "0",required = false) Integer y,
				            @RequestParam(defaultValue = "10",required = false) Integer width,//页面图片宽
				            @RequestParam(defaultValue = "10",required = false) Integer height,
				            @RequestParam(defaultValue = "250",required = false) Integer wmWith,//水印图宽
				            @RequestParam(defaultValue = "250",required = false) Integer wmHeight,
							  @RequestParam(defaultValue = "1",required = false) float wmOpacity)
				throws Exception {
		        log.debug(">>>>> invoke  img composite  request");
		//获取绝对路径
		 String uploadDir = request.getSession().getServletContext().getRealPath("/");

		 imgUrl = imgCompositeService.watermark(uploadDir+imgUrl,uploadDir+markUrl,wmWith,wmHeight,x,y ,wmOpacity);
	    
		        log.debug(">>>>> invoke  img composite  response");
	    	AjaxWrite.writeText(response, imgUrl);
	    	
	    }
	
	
	

}
