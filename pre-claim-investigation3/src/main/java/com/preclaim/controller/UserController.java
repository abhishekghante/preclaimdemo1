package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "user")
public class UserController {

	@RequestMapping(value = "/add_user", method = RequestMethod.GET)
	public String appuser(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/add_user.jsp");
    	details.setScreen_title("Manage User");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
}