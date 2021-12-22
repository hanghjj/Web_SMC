package com.smc.test;

import vo.Chicken;

import service.ChickenListService;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ChickenListController {
	@Autowired
	private ChickenListService chickenListService;
	
	@RequestMapping("/CList.chic")
	public ModelAndView view(HttpServletRequest request) {
			
			ArrayList<Chicken> temp = chickenListService.getChickenList();
			try {
				request.setAttribute("chic", temp);
			}catch(Exception e) {
				e.printStackTrace();
			}
			ModelAndView mav = new ModelAndView();
			mav.addObject("clist",temp);
			mav.setViewName("/CList");
			return mav;
	}
}
