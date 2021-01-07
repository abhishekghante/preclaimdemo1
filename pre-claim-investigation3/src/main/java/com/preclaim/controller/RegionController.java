package com.preclaim.controller;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/region")
public class RegionController{

	@RequestMapping(value = "/add_region",method = RequestMethod.GET)
	public String add_region(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/add_region.jsp");
		details.setScreen_title("Add Region");
		details.setUser_id("");
		details.setUser_name("admin");
		details.setMain_menu("Regions");
		details.setSub_menu("Add Region");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/pending_region",method = RequestMethod.GET)
	public String pending_region(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/pending_region.jsp");
		details.setScreen_title("Pending Region");
		details.setUser_id("");
		details.setUser_name("admin");
		details.setMain_menu("Regions");
		details.setSub_menu("Pending Regions");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	@RequestMapping(value = "/active_region",method = RequestMethod.GET)
	public String active_region(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/active_region.jsp");
		details.setScreen_title("Active Region");
		details.setUser_id("");
		details.setUser_name("admin");
		details.setMain_menu("Regions");
		details.setSub_menu("Active Regions");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	
}


