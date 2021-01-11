package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(HttpSession session) {
    	session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../profile/edit_profile.jsp");
    	details.setScreen_title("Edit Profile");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
    }    
}
