package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    	
    	List<UserList> user_list = dao.user_list();
    	session.setAttribute("user_list",user_list);
    	List<UserRole> role = dao.role_lists();
    	session.setAttribute("role_list", role);  	
    	
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
	
	@RequestMapping(value = "/updateUserStatus", method = RequestMethod.POST)
	public @ResponseBody String updateUserStatus(HttpServletRequest request)
	{
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int user_status = Integer.parseInt(request.getParameter("status"));
		System.out.println("User ID:" + user_id + " User_Status:" + user_status);
		String message = dao.updateUserStatus(user_id, user_status);
		return message;
	}
	
	@RequestMapping(value = "/deleteAdminUser", method = RequestMethod.POST)
	public @ResponseBody String deleteAdminUser(HttpServletRequest request)
	{
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		System.out.println("User ID:" + user_id);
		String message = dao.deleteAdminUser(user_id);
		return message;
	}
	
	@RequestMapping(value = "/edit/{UserID}", method = RequestMethod.GET)
	public String edit(@PathVariable("UserID") int UserID, HttpSession session, Model m)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../user/edit_user.jsp");
    	details.setScreen_title("Manage User");
    	details.setMain_menu("Users");
    	details.setSub_menu1("Add User");
    	details.setSub_menu2("Edit Account");
    	details.setSub_menu2_path("/user/user_list");
    	session.setAttribute("ScreenDetails", details);    	
    	List<UserRole> role = dao.role_lists();
    	session.setAttribute("role_list", role);
    	UserDetails user_details = dao.getUserDetails(UserID);
    	session.setAttribute("user_details",user_details);
    	return "common/templatecontent";
	}
	
	@RequestMapping(value = "/updateUserDetails", method = RequestMethod.POST)
	public @ResponseBody String updateUserDetails(HttpServletRequest request)
	{
		UserDetails user_details = new UserDetails();
		user_details.setUserID(Integer.parseInt(request.getParameter("user_id")));
		user_details.setFull_name(request.getParameter("full_name"));
		user_details.setAccount_type(request.getParameter("account_type"));
		user_details.setPassword(request.getParameter("password"));
		user_details.setStatus(Integer.parseInt(request.getParameter("status")));
		user_details.setUser_email(request.getParameter("user_email"));
		user_details.setUsername(request.getParameter("username"));
		user_details.setUserimage(request.getParameter("account_img"));		
		System.out.println(user_details.toString());
		return dao.updateUserDetails(user_details);
	}
	
}
