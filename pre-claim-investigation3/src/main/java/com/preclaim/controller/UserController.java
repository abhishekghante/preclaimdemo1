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
	public String add_user(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/add_user.jsp");
    	details.setScreen_title("Manage User");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Users");
    	details.setSub_menu("Add User");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/role", method = RequestMethod.GET)
	public String role(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/role.jsp");
    	details.setScreen_title("Role lists");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Users");
    	details.setSub_menu("User Role");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
}
