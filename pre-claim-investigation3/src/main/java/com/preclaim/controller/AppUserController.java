package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/app_user")
public class AppUserController {

	@RequestMapping(value = "/app_user", method = RequestMethod.GET)
	public String appuser(HttpSession session)
	{
		session.removeAttribute("screen_name");
    	session.setAttribute("screen_name", "../app_user/app_user.jsp");
		return "common/templatecontent";
	}
	
}
