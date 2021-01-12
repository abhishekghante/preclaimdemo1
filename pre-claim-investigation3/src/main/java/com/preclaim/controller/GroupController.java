package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.dao.GroupDao;
import com.preclaim.models.Group;
import com.preclaim.models.GroupList;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/group")
public class GroupController {
	
    @Autowired
	private GroupDao groupDao;

    @RequestMapping(value = "/add_group", method = RequestMethod.GET)
    public String add_group(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../group/add_group.jsp");
    	details.setScreen_title("Add Group");
    	details.setMain_menu("Groups");
    	details.setSub_menu1("Add Groups");
    	details.setSub_menu2("Manage Groups");
    	details.setSub_menu2_path("/group/pending_group");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/create_group", method = RequestMethod.POST)
    public String create_group(HttpSession session,@ModelAttribute Group group) {
    	String message = groupDao.add_group(group);
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../group/add_group.jsp");
    	details.setScreen_title("Add Group");
    	details.setMain_menu("Groups");
    	details.setSub_menu1("Add Group");
    	details.setSub_menu2("Manage Groups");
    	details.setSub_menu2_path("/group/pending_group");
    	if(message.equals("****"))
    		details.setSuccess_message1("Group added succesfully");
    	else
    		details.setError_message1(message);
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
   
    
    @RequestMapping(value = "/pending_group",method = RequestMethod.GET)
    public String pending_group(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../group/pending_group.jsp");
    	details.setScreen_title("Groups Lists");
    	details.setMain_menu("Groups");
    	details.setSub_menu1("Pending Groups");
    	session.setAttribute("ScreenDetails", details);
    	List<GroupList> pending_list=groupDao.pending_list();
    	session.setAttribute("pending_list", pending_list);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value="/active_group",method = RequestMethod.GET)
    public String active_group(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../group/active_group.jsp");;
    	details.setScreen_title("Active Group");
    	details.setMain_menu("Groups");
    	details.setSub_menu1("Active Groups");
    	session.setAttribute("ScreenDetails", details);
    	List<GroupList> active_list=groupDao.active_list();
    	session.setAttribute("active_list", active_list);
    	return "common/templatecontent";
    }
}
