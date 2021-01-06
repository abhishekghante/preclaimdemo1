package com.preclaim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.LoginDAO;
import com.preclaim.models.Login;
import com.preclaim.models.UserDetails;

@Controller
public class LoginController {

	@Autowired
	LoginDAO dao;
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login() {
        return "common/login";
    }
    
    @RequestMapping(value = "/login_validate", method = RequestMethod.POST)
    public @ResponseBody String loginprocess(HttpServletRequest request, HttpServletResponse response)
    {
    	System.out.println("Entered");
    	System.out.println("Username:" + request.getParameter("username"));
    	System.out.println("Password:" + request.getParameter("password"));
    	Login login = new Login();
    	login.setUsername("admin");
    	login.setPassword("admin@123");
    	UserDetails user = dao.validateUser(login);
    	if(user != null)
    		return "****";
    	else
    		return "Invalid Username or Password";
    }
}
