package com.smc.test;


import java.util.ArrayList;

import vo.Review;
import service.ReviewListService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewListController {
	@Autowired
	private ReviewListService rls;
	
	@RequestMapping("/Rlist.chic")
	public ModelAndView view(HttpServletRequest request) {
		ArrayList<Review> temp = rls.getRlist();
		try {
			request.setAttribute("review", temp);
		}catch(Exception e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Rlist");
		return mav;
	}
}
