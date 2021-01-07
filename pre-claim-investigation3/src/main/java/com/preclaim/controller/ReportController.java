package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/report")
public class ReportController {

 
	@RequestMapping(value = "/messages_status", method = RequestMethod.GET)
    public String messages_status(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../report/messages_status.jsp");
    	details.setScreen_title("Cases Status Lists");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
    
	@RequestMapping(value = "/read_message", method = RequestMethod.GET)
    public String read_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../report/read_message.jsp");
    	details.setScreen_title("Cases Status Lists");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
	
	@RequestMapping(value = "/like_message", method = RequestMethod.GET)
    public String like_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../report/like_message.jsp");
    	details.setScreen_title("Like Cases Lists");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
	
	@RequestMapping(value = "/favourite_message", method = RequestMethod.GET)
    public String favourite_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../report/favourite_message.jsp");
    	details.setScreen_title("Favourite Cases Lists");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
	@RequestMapping(value = "/login_details", method = RequestMethod.GET)
    public String login_details(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../report/login_details.jsp");
    	details.setScreen_title("Login Details");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
}
