package com.smc.test;

import vo.Chicken;
import service.ChickenInsertService;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ChickenInsertController {
	 ChickenInsertService chickeninsertservice = new  ChickenInsertService();
	
	
	
	@RequestMapping(value = "/CInsert.chic" , method = RequestMethod.GET)
	public String view(HttpServletRequest request ,Model model) {
		String result = "CInsert";
			return result;

	}
}
