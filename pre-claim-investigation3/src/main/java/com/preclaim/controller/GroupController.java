 package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.GroupDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.Group;
import com.preclaim.models.GroupList;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/group")
public class GroupController {
	
    @Autowired
	private GroupDao groupDao;
    
    @Autowired
    private UserDAO userDao;

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
    public String pending_group(HttpSession session, HttpServletRequest request) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../group/pending_group.jsp");
    	details.setScreen_title("Groups Lists");
    	details.setMain_menu("Groups");
    	details.setSub_menu1("Pending Groups");
    	session.setAttribute("ScreenDetails", details);
    	List<GroupList> pending_list= groupDao.group_list(0);
    	session.setAttribute("pending_group", pending_list);
    	
    	if(request.getParameter("groupName")!= null && request.getParameter("groupId") != null)
    	{
    		GroupList group = new GroupList();
    		group.setGroupId(Integer.parseInt(request.getParameter("groupId")));
    		group.setGroupName(request.getParameter("groupName"));
    		session.setAttribute("group", group);
    	}
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
		userDao.activity_log("GROUP", GroupId, "DELETE", 0, request.getRemoteAddr());
		return message;
	}
    
    @RequestMapping(value = "/addGroup",method = RequestMethod.POST)
	public @ResponseBody String addGroup(HttpServletRequest request) 
	{	
		String GroupName = request.getParameter("groupName");
		Group group = new Group();
		group.setGroupName(GroupName);
		String message = groupDao.add_group(group);
		userDao.activity_log("GROUP", 0, "ADD", 0, request.getRemoteAddr());
		return message;
	}
	
	@RequestMapping(value = "/updateGroup",method = RequestMethod.POST)
	public @ResponseBody String updateGroup(HttpServletRequest request) 
	{	
		int GroupId=Integer.parseInt(request.getParameter("groupId"));		
		String GroupName = request.getParameter("groupName");
		System.out.println("GroupId : "+ GroupId);
		String message = groupDao.updateGroup(GroupId, GroupName);
		userDao.activity_log("GROUP", GroupId, "UPDATE", 0, request.getRemoteAddr());
		return message;
	}
	
	@RequestMapping(value = "/updateGroupStatus",method = RequestMethod.POST)
	public @ResponseBody String updateGroupStatus(HttpServletRequest request) 
	{	
		int GroupId=Integer.parseInt(request.getParameter("groupId"));	
		int status=Integer.parseInt(request.getParameter("status"));
		String message = groupDao.updateGroupStatus(GroupId, status);
		userDao.activity_log("GROUP", GroupId, status == 1 ? "ACTIVE" : "DEACTIVE", 0, request.getRemoteAddr());
		return message;
	}
	
}
