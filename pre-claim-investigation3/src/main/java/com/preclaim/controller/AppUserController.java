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
	public String app_user(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/app_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/import")
	public String import_user(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/import_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>x");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
}
