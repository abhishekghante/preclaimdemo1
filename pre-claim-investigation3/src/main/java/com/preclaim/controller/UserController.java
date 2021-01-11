package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.UserDAO;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

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
    	List<UserRole> role = dao.role_lists();
    	m.addAttribute("role_list", role);
    	
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/create_user", method = RequestMethod.POST)
	public String create_user(@ModelAttribute("user_details") UserDetails user, HttpSession session)
	{
		System.out.println(user.toString());
		String message = dao.create_user(user);
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/user_list.jsp");
    	details.setScreen_title("User List");
    	details.setMain_menu("Users");
    	details.setSub_menu1("User Lists");
    	if(message.equals("****"))
    		details.setSuccess_message1("User created successfully");
    	else
    		details.setError_message1(message);
    	session.setAttribute("ScreenDetails", details);
		
		return "common/templatecontent";
	}
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String user_list(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/user_list.jsp");
    	details.setScreen_title("User List");
    	details.setMain_menu("Users");
    	details.setSub_menu1("User Lists");
    	session.setAttribute("ScreenDetails", details);
    	List<UserList> user_list = dao.user_list();
    	session.setAttribute("user_list",user_list);
    	List<UserRole> role = dao.role_lists();
    	session.setAttribute("role_list", role);  	
    	return "common/templatecontent";
	}
	
	@RequestMapping(value = "/role", method = RequestMethod.GET)
	public String role(HttpSession session, Model m)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/add_role.jsp");
    	details.setScreen_title("Role lists");
    	details.setMain_menu("Users");
    	details.setSub_menu1("User Role");
    	session.setAttribute("ScreenDetails", details);
    	List<UserRole> role = dao.role_lists();
    	m.addAttribute("role_list", role);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/addRole", method = RequestMethod.POST)
	public @ResponseBody String add_role(HttpServletRequest request)
	{
		UserRole role = new UserRole();
		role.setRole(request.getParameter("role"));
		role.setRole_code(request.getParameter("role_code"));
		role.setStatus(1);
		String message = dao.create_role(role);
		return message;
	}
	
	@RequestMapping(value = "/deleteRole", method = RequestMethod.POST)
	public @ResponseBody String delete_role(HttpServletRequest request)
	{
		UserRole role = new UserRole();
		role.setRoleId(Integer.parseInt(request.getParameter("roleId")));
		role.setStatus(0);
		System.out.println(role.toString());
		String message = dao.delete_role(role);
		return message;
	}
	
}
