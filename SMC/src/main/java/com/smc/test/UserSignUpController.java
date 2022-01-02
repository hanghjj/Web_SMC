package com.smc.test;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserSignUpController {
	
	@RequestMapping(value = "/SignUp.chic" , method = {RequestMethod.GET, RequestMethod.POST})
	public String view(HttpServletRequest request ,Model model) {
		String result = "SignUp";
			return result;

	}
}
