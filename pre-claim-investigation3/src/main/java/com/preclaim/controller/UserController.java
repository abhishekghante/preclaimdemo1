package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.dao.UserDAO;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.User_Role;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	UserDAO dao;
	
	@RequestMapping(value = "/add_user", method = RequestMethod.GET)
	public String add_user(HttpSession session,Model m)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/add_user.jsp");
    	details.setScreen_title("Manage User");
    	details.setMain_menu("Users");
    	details.setSub_menu1("Add User");
    	details.setSub_menu2("Manage Users");
    	details.setSub_menu2_path("/user/user_list");
    	session.setAttribute("ScreenDetails", details);
    	
    	List<User_Role> role = dao.role_lists();
    	m.addAttribute("role_list", role);
    	
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/create_user", method = RequestMethod.POST)
	public String create_user(HttpSession session,Model m)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/user_list.jsp");
    	details.setScreen_title("User LIst");
    	details.setMain_menu("Users");
    	details.setSub_menu1("User Lists");
    	session.setAttribute("ScreenDetails", details);
		
		return "common/templatecontent";
	}
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String user_list(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/user_list.jsp");
    	details.setScreen_title("User LIst");
    	details.setMain_menu("Users");
    	details.setSub_menu1("User Lists");
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
    	details.setMain_menu("Users");
    	details.setSub_menu1("User Role");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
}
