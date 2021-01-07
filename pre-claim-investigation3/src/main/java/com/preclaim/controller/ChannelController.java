package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import com.preclaim.models.ScreenDetails;
@Controller
@RequestMapping(value="/channel")
public class ChannelController {

	 @RequestMapping(value = "/add_channel", method = RequestMethod.GET)
	    public String add_channel(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../channel/add_channel.jsp");
	    	details.setScreen_title("Add Channel");
	    	details.setUser_id("");
	    	details.setUser_name("admin");
	    	session.setAttribute("ScreenDetails", details);
	    	return "common/templatecontent";
	    }
	 
	 @RequestMapping(value = "/pending_channel",method = RequestMethod.GET)
	   public String pending_channel(HttpSession session) {
		   session.removeAttribute("ScreenDetails");
		   ScreenDetails details=new ScreenDetails();
		   details.setScreen_name("../channel/pending_channel.jsp");
		   details.setScreen_title("Pending Channels");
		   details.setUser_id("");
		   details.setUser_name("admin");
		   session.setAttribute("ScreenDetails", details);
		   return "common/templatecontent";
		   
	   }
	 
	 @RequestMapping(value= "/active_channel",method = RequestMethod.GET)
	 public String active_channel(HttpSession session) {
		 session.removeAttribute("ScreenDetails");
		 ScreenDetails details=new ScreenDetails();
		 details.setScreen_name("../channel/active_channel.jsp");
		 details.setScreen_title("Active Channels");
		 details.setUser_id("");
		 details.setUser_name("admin");
		 session.setAttribute("ScreenDetails", details);
		 return "common/templatecontent";
	 }
	 
	 
	
	
}
