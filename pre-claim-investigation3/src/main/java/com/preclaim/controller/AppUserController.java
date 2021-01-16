package com.preclaim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.AppUserDao;
import com.preclaim.dao.MessageDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/app_user")
public class AppUserController {
	
	@Autowired
	AppUserDao appuserDao;
	
	@Autowired
	MessageDao messageDao;
	
	@Autowired
	UserDAO userDao;
	
	@RequestMapping(value = "/app_user")
	public String app_user(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/app_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
    	session.setAttribute("AppUserList", appuserDao.getAppuserList());
    	session.setAttribute("region_list", messageDao.getActiveRegionlist());
    	session.setAttribute("channel_list", messageDao.getActiveChannellist());
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/import")
	public String import_user(HttpSession session)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/import_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/updateAppUserStatus",method = RequestMethod.POST)
	public @ResponseBody String updateAppUserStatus(HttpServletRequest request)
	{
		int appUserId = Integer.parseInt(request.getParameter("appUserId"));
		int appUserStatus = Integer.parseInt(request.getParameter("status"));
	    String message = appuserDao.updateAppUserStatus(appUserId, appUserStatus); 
	    userDao.activity_log("APP USER", appUserId, appUserStatus == 1 ? "ACTIVE" : "DEACTIVE", 
	    		0,request.getRemoteAddr());
		return message;
    }
	
	@RequestMapping(value = "/deleteAppUser",method = RequestMethod.POST)
	public @ResponseBody String deleteAppUser(HttpServletRequest request) {
	
		int appUserId = Integer.parseInt(request.getParameter("appUserId"));
		String message = appuserDao.deleteAppUser(appUserId);
		userDao.activity_log("APPUSER", appUserId, "DELETE", 0, request.getRemoteAddr());
		return message;
	}
}
