package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {

	 @RequestMapping(value = "/add_category", method = RequestMethod.GET)
	    public String add_category(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../category/add_category.jsp");
	    	details.setScreen_title("Add Category");
	    	details.setUser_id("");
	    	details.setUser_name("admin");
	    	details.setMain_menu("Type of Investigations");
	    	details.setSub_menu("Add Investigation");
	    	session.setAttribute("ScreenDetails", details);
	    	return "common/templatecontent";
	    }
	 
	 
	 @RequestMapping(value = "/pending_category", method = RequestMethod.GET)
	    public String pending_category(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../category/pending_category.jsp");
	    	details.setScreen_title("Category Lists");
	    	details.setUser_id("");
	    	details.setUser_name("admin");
	    	details.setMain_menu("Type of Investigations");
	    	details.setSub_menu("Pending Investigations");
	    	session.setAttribute("ScreenDetails", details);
	    	return "common/templatecontent";
	    }
	 @RequestMapping(value = "/active_category", method = RequestMethod.GET)
	    public String active_category(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../category/active_category.jsp");
	    	details.setScreen_title("Category Lists");
	    	details.setUser_id("");
	    	details.setUser_name("admin");
	    	details.setMain_menu("Type of Investigations");
	    	details.setSub_menu("Active investigations");
	    	session.setAttribute("ScreenDetails", details);
	    	return "common/templatecontent";
	    }
}
