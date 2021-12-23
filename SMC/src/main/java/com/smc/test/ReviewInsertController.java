package com.smc.test;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewInsertController {
	@RequestMapping(value = "/CReview.chic" , method = RequestMethod.GET)
	public String view(HttpServletRequest request ,Model model) {
		String result = "CReview";
			return result;

	}
}
