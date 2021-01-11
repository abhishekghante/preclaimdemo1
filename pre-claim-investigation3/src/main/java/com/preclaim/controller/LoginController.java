package com.preclaim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.LoginDAO;
import com.preclaim.models.Login;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
public class LoginController {

	@Autowired
	LoginDAO dao;
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login() {
    	return "common/login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login_method() {
    	return "common/login";
    }
    
    @RequestMapping(value = "/login_validate", method = RequestMethod.POST)
    public @ResponseBody String login_validate(HttpSession session,HttpServletRequest request, HttpServletResponse response)
    {
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	Login login = new Login(username, password);
    	System.out.println(login.toString());
    	UserDetails user = dao.validateUser(login);
    	if(user != null)
    	{
    		session.setAttribute("User_Login", user);
    		return "****";
    	}
    	else
    		return "Invalid Username or Password";
    }
    
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(HttpSession session) {
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("dashboard.jsp");
    	details.setScreen_title("Dashboard");
    	details.setMain_menu("Dashboard");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
}
