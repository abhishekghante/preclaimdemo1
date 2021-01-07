package com.preclaim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.config.Config;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/message")
public class MessageController {

    @RequestMapping(value = "/import_case", method = RequestMethod.GET)
    public String import_case(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/import_case.jsp");
    	details.setScreen_title(
    			"<li><a href=\"/appUsers\">App Users</a>"
    			+ "<i class=\"fa fa-circle\"></i></li>" 
				+ "<li class=\"active\"><span>Import User</span></li>");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Groups");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
    @RequestMapping(value = "/add_message", method = RequestMethod.GET)
    public String add_message(HttpSession session, HttpServletRequest request) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/add_message.jsp");
    	details.setScreen_title(
    			"<li><a href=\"" + Config.base_url + "/pending_message\">Manage Cases</a>"
    	    			+ "<i class=\"fa fa-circle\"></i></li>" 
    					+ "<li class=\"active\"><span>Add Cases</span></li>");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Groups");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
    @RequestMapping(value = "/pending_message", method = RequestMethod.GET)
    public String pending_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/pending_message.jsp");
    	details.setScreen_title("<li class = \"active\">Pending Cases Lists</li>");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Groups");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
  
    @RequestMapping(value = "/active_message", method = RequestMethod.GET)
    public String active_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/active_message.jsp");
    	details.setScreen_title("<li class = \"active\">Active Cases Lists</li>");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Groups");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
    @RequestMapping(value = "/assigned_message", method = RequestMethod.GET)
    public String assigned_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/assigned_message.jsp");
    	details.setScreen_title("<li class = \"active\">Assigned Cases Lists</li>");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	details.setMain_menu("Groups");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
}
