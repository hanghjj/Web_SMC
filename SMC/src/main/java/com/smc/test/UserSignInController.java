package com.smc.test;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSignInController {
	@RequestMapping("/SignIn.chic")
	public String view(HttpServletRequest request ,Model model) {
		String result = "SignIn";
			return result;
	}
}
