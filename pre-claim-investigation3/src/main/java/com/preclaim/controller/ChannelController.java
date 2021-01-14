package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.ChannelDao;
import com.preclaim.models.Channel;
import com.preclaim.models.ChannelList;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/channel")
public class ChannelController {

	@Autowired
	private ChannelDao channelDao;

	@RequestMapping(value = "/add_channel", method = RequestMethod.GET)
	public String add_channel(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../channel/add_channel.jsp");
		details.setScreen_title("Add Channel");
		details.setMain_menu("Channels");
		details.setSub_menu1("Add Channel");
		details.setSub_menu2("Manage Channels");
		details.setSub_menu2_path("/channel/pending_channel");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}

	@RequestMapping(value = "/pending_channel", method = RequestMethod.GET)
	public String pending_channel(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../channel/pending_channel.jsp");
		details.setScreen_title("Pending Channels");
		details.setMain_menu("Channels");
		details.setSub_menu1("Pending Channels");
		session.setAttribute("ScreenDetails", details);
		List<ChannelList> pending_list= channelDao.channel_list(0);
    	session.setAttribute("pending_channel", pending_list);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/pending_channel/{channel_name}/{channelCode}",method = RequestMethod.GET)
	public String pending_group(@PathVariable("channel_name") String channel_name, 
			@PathVariable("channelCode") String channelCode, HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../group/pending_group.jsp");
		details.setScreen_title("Pending Group");
		details.setMain_menu("Channel Lists");
		details.setSub_menu1("Pending Channels");
		session.setAttribute("ScreenDetails", details);
		List<ChannelList> pending_channel = channelDao.channel_list(0);
		session.setAttribute("pending_channel", pending_channel);
		ChannelList channel = new ChannelList();
		channel.setChannelCode(channelCode);
		channel.setChannelName(channel_name);
		session.setAttribute("channel", channel);		
		return "common/templatecontent";
	}

	@RequestMapping(value = "/active_channel", method = RequestMethod.GET)
	public String active_channel(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../channel/active_channel.jsp");
		details.setScreen_title("Active Channels");
		details.setMain_menu("Channels");
		details.setSub_menu1("Active Channels");
		session.setAttribute("ScreenDetails", details);
		List<ChannelList> pending_list= channelDao.channel_list(0);
    	session.setAttribute("pending_channel", pending_list);		
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/addChannel",method = RequestMethod.POST)
	public @ResponseBody String addChannel(HttpServletRequest request) 
	{	
		String ChannelName = request.getParameter("channelName");
		String ChannelCode=request.getParameter("channelCode");
		Channel channel=new Channel();
		channel.setChannelName(ChannelName);;
		channel.setChannelCode(ChannelCode);
		String message =channelDao.create_channel(channel);		
		return message;
	}

	@RequestMapping(value = "/deleteChannel", method = RequestMethod.POST)
	public @ResponseBody String deleteChannel(HttpServletRequest request)
	{
		String channelCode = request.getParameter("GroupId");
		String message = channelDao.deleteChannel(channelCode);
		return message;
	}
	
	@RequestMapping(value = "/updateChannel",method = RequestMethod.POST)
	public @ResponseBody String updateChannel(HttpServletRequest request) 
	{	
		String channelCode = request.getParameter("channelCode");		
		String channelName = request.getParameter("channelName");
		String message = channelDao.updateChannel(channelName, channelCode);		
		return message;
	}
}
