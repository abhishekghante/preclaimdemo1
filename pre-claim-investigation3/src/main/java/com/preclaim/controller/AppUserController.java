package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/app_user")
public class AppUserController {


	
	@RequestMapping(value = "/app_user")
	public String appuser(HttpSession session)
	{
		session.removeAttribute("Screen_detail");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/app_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>x");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Groups");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
}
