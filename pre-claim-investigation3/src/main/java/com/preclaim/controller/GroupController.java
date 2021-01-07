package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/group")
public class GroupController {

    @RequestMapping(value = "/add_group", method = RequestMethod.GET)
    public String dashboard(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../group/add_group.jsp");
    	details.setScreen_title("Add Group");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/pending_group",method = RequestMethod.GET)
    public String pending_group(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../group/pending_group.jsp");
    	details.setScreen_title("Groups Lists");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value="/active_group",method = RequestMethod.GET)
    public String active_group(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../group/active_group.jsp");;
    	details.setScreen_title("Active Group");
    	details.setUser_id("");
    	details.setUser_name("admin");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
}
