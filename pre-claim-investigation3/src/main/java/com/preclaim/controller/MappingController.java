package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping("mapping")
public class MappingController{
	
	@RequestMapping(value = "/add_mapping",method = RequestMethod.GET)
	public String add_mapping(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../mapping/add_mapping.jsp");
		details.setScreen_title("");
		details.setUser_id("");
		details.setUser_name("admin");
		details.setMain_menu("Mapping");
		details.setSub_menu("Add Mapping");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";

	}
	
	@RequestMapping(value = "/mapping_list",method = RequestMethod.GET)
	public String mapping_list(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../mapping/mapping_list.jsp");
		details.setScreen_title("Mapping Lists");
		details.setUser_id("");
		details.setUser_name("admin");
		details.setMain_menu("Mapping");
		details.setSub_menu("Mapping List");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	
	
	
}