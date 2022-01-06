package com.smc.test;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/home.chic")
	public ModelAndView home(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();;
		mav.setViewName("/");
		return mav;
	}
	
}
