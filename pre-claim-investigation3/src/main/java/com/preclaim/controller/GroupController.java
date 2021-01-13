 package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
   
    @RequestMapping(value = "/pending_group",method = RequestMethod.GET)
    public String pending_group(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../group/pending_group.jsp");
    	details.setScreen_title("Groups Lists");
    	details.setMain_menu("Groups");
    	details.setSub_menu1("Pending Groups");
    	session.setAttribute("ScreenDetails", details);
    	List<GroupList> pending_list= groupDao.group_list(0);
    	session.setAttribute("pending_group", pending_list);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/pending_group/{group_name}/{groupId}",method = RequestMethod.GET)
	public String pending_group(@PathVariable("group_name") String group_name, 
			@PathVariable("groupId") String groupId, HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../group/pending_group.jsp");
		details.setScreen_title("Pending Group");
		details.setMain_menu("Groups Lists");
		details.setSub_menu1("Pending Groups");
		session.setAttribute("ScreenDetails", details);
		List<GroupList> pending_group = groupDao.group_list(0);
		session.setAttribute("pending_group", pending_group);
		GroupList group = new GroupList();
		group.setGroupId(Integer.parseInt(groupId));
		group.setGroupName(group_name);
		session.setAttribute("group", group);		
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
    	List<GroupList> active_list = groupDao.group_list(1);
    	session.setAttribute("active_list", active_list);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/deleteGroup", method = RequestMethod.POST)
	public @ResponseBody String deleteGroup(HttpServletRequest request)
	{
		int GroupId = Integer.parseInt(request.getParameter("GroupId"));
		System.out.println("User ID:" + GroupId);
		String message = groupDao.deleteGroup(GroupId);
		return message;
	}
    
    @RequestMapping(value = "/addGroup",method = RequestMethod.POST)
	public @ResponseBody String addGroup(HttpServletRequest request) 
	{	
		String GroupName = request.getParameter("groupName");
		Group group = new Group();
		group.setGroupName(GroupName);
		String message = groupDao.add_group(group);		
		return message;
	}
	
	@RequestMapping(value = "/updateGroup",method = RequestMethod.POST)
	public @ResponseBody String updateGroup(HttpServletRequest request) 
	{	
		int GroupId=Integer.parseInt(request.getParameter("groupId"));		
		String GroupName = request.getParameter("groupName");
		System.out.println("GroupId : "+ GroupId);
		String message = groupDao.updateGroup(GroupId, GroupName);		
		return message;
	}
}
