package com.vatestar.cm.controller;

import com.vatestar.cm.entity.TbAccount;
import com.vatestar.cm.service.SampleService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Date;

/**
 * Created by dyl on 16/7/26.
 */
@Controller
@RequestMapping(value = "/sample")
public class SampleController {
    private static final Logger log = Logger.getLogger(SampleController.class);

    @Resource
    private SampleService sampleService;

    /**
     * 查询
     * @param company
     * @param map
     * @return
     */
    @RequestMapping(value = "/query",method = RequestMethod.GET)
    public ModelAndView query(@RequestParam(required = false) String company, ModelMap map) {
        TbAccount tb = new TbAccount();
        tb.setCompany(company);
        java.util.List abc = sampleService.findAccount(tb);
        map.addAttribute("accountList", abc);
        return new ModelAndView("/sample/query", map);
    }

    /**
     * 添加账户
     */
    @RequestMapping(value="add",method = RequestMethod.POST)
    public void addAccount(HttpServletRequest request){
        TbAccount tbAccount = new TbAccount();
        tbAccount.setCompany(request.getParameter("company"));
        tbAccount.setMoney(request.getParameter("money"));

        tbAccount.setRtime(new Date(System.currentTimeMillis()));
        sampleService.addAccount(tbAccount);
    }

}
