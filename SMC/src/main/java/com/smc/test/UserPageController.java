package com.smc.test;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserPageController {
	@RequestMapping("/UserPage.chic")
	public String view(HttpServletRequest request ,Model model) {
		return "UserPage";
	}
}
