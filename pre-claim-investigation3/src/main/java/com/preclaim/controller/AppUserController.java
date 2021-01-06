package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/app_user")
public class AppUserController {

	@RequestMapping(value = "/app_user", method = RequestMethod.GET)
	public String appuser(HttpSession session)
	{
		session.removeAttribute("screen_name");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/app_user.jsp");
    	details.setScreen_title("App User Management");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
}
