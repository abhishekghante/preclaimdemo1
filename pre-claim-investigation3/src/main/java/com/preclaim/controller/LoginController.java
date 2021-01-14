package com.preclaim.controller;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.preclaim.dao.LoginDAO;
import com.preclaim.models.Login;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;
import com.preclaim.config.Config;

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
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
    	session.removeAttribute("User_Login");
    	return "common/login";
    }
    
    @RequestMapping(value = "/login_validate", method = RequestMethod.POST)
    public @ResponseBody String login_validate(HttpSession session,HttpServletRequest request, HttpServletResponse response)
    {
    	String username = request.getParameter("username");
    	Base64.Encoder encoder = Base64.getEncoder();    
		String password = encoder.encodeToString(request.getParameter("password").getBytes());  		
    	
    	Login login = new Login(username, password);
    	System.out.println(login.toString());
    	UserDetails user = dao.validateUser(login);
    	if(user != null)
    	{
    		if(user.getStatus() == 0)
    			return "User ID disabled. Kindly contact system administrator";
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
    
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody String fileuploader(@RequestParam("file[]") ArrayList<MultipartFile> multipartFiles,HttpServletRequest request){
        String prefix = request.getParameter("prefix");
        for(MultipartFile item :multipartFiles)
    	{
    		try 
    		{
	    		byte[] temp = item.getBytes();
	    		String filename = item.getOriginalFilename();
	    		filename = prefix == null ? filename : prefix + "_" + filename;
	    		Path path = Paths.get(Config.upload_directory + filename);
	    		System.out.println("Entered");
				Files.write(path, temp);
			} 
    		catch (Exception e) 
    		{
				e.printStackTrace();
			}
    	}
    	
    	return "****";
    }
    
}
