package com.vatestar.cm.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vatestar.cm.entity.TbAccount;
import com.vatestar.cm.entity.User;
import com.vatestar.cm.service.SampleService;

@Controller
@RequestMapping(value = "/test")
public class TestController {

	private static final Logger log = Logger.getLogger(TestController.class);

	@Resource
	private SampleService sampleService;

	@RequestMapping(value = "/show")
	public ModelAndView show(String type, User userEntity, ModelMap map) {
		ModelMap mm = new ModelMap();
		TbAccount tb = new TbAccount();
		tb.setId(1);
		java.util.List abc = sampleService.findAccount(tb);
		log.info("abc.size()------------" + abc.size());
		mm.addAttribute("name", "david");
		return new ModelAndView("/test", mm);
	}
}
