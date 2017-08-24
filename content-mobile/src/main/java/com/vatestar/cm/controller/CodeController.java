package com.vatestar.cm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class CodeController {

	@RequestMapping(value = "/getCode")
	public String getCode(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr) throws ServletException, IOException {
		String ua = request.getHeader("user-agent");
		System.out.println("UserAgent:"+ua);
		String content = "";
		if (ua.indexOf("iPad") != -1) {
			content = "https://itunes.apple.com/cn/app/yun-pai/id550416295";
			attr.addAttribute("mt",8);  
		} else if (ua.indexOf("iPhone") != -1) {
			attr.addAttribute("mt",8);  
			content = "https://itunes.apple.com/cn/app/yun-pai/id550416295";
		} else if (ua.indexOf("Android") != -1) {
			content = "http://user.expai.com/adtive/down/yunpai.apk";
		} else {
			attr.addAttribute("mt",8);  
			content = "https://itunes.apple.com/cn/app/yun-pai/id550416295";
		}
		System.out.println("content:"+content);
//		content="https://itunes.apple.com/cn/app/yun-pai/id550416295";
//		content="https://www.baidu.com/";
		return "redirect:"+content;
	}
	@RequestMapping(value = "/getCode1")
	public void getCode1(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr) throws ServletException, IOException {
		String ua = request.getHeader("user-agent");
		System.out.println("UserAgent:"+ua);
		String content = "";
		if (ua.indexOf("iPad") != -1) {
			content = "https://itunes.apple.com/cn/app/yun-pai/id550416295";
			attr.addAttribute("mt",8);  
		} else if (ua.indexOf("iPhone") != -1) {
			attr.addAttribute("mt",8);  
			content = "https://itunes.apple.com/cn/app/yun-pai/id550416295";
		} else if (ua.indexOf("Android") != -1) {
			content = "http://user.expai.com/adtive/down/yunpai.apk";
		} else {
//			attr.addAttribute("mt",8);  
			content = "https://itunes.apple.com/cn/app/yun-pai/id550416295?mt=8";
		}
		System.out.println("content:"+content);
		response.addHeader("location", content);
		  response.setStatus(302);
	}
}
