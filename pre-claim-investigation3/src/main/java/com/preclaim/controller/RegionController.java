package com.preclaim.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.dao.RegionDao;
import com.preclaim.models.Group;
import com.preclaim.models.Region;
import com.preclaim.models.RegionList;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/region")
public class RegionController{

	@Autowired
	private RegionDao regionDao;
	
	@RequestMapping(value = "/add_region",method = RequestMethod.GET)
	public String add_region(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/add_region.jsp");
		details.setScreen_title("Add Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Add Region");
    	details.setSub_menu2("Manage Regions");
    	details.setSub_menu2_path("/region/pending_region");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/create_region",method = RequestMethod.POST)
	public String create_region(HttpSession session,@ModelAttribute Region region) {
		String message=regionDao.create_region(region);
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/add_region.jsp");
		details.setScreen_title("Add Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Add Region");
    	details.setSub_menu2("Manage Regions");
    	details.setSub_menu2_path("/region/pending_region");
		session.setAttribute("ScreenDetails", details);
	    if(message.equals("****")) {
	    	details.setSuccess_message1("Region added Successfully");
	    	
	    }else {
			details.setError_message1(message);
	    }
		
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/pending_region",method = RequestMethod.GET)
	public String pending_region(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/pending_region.jsp");
		details.setScreen_title("Pending Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Pending Regions");
		session.setAttribute("ScreenDetails", details);
		List<RegionList> pending_region=regionDao.pending_region();
		session.setAttribute("pending_region", pending_region);
		return "common/templatecontent";
	}
	@RequestMapping(value = "/active_region",method = RequestMethod.GET)
	public String active_region(HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/active_region.jsp");
		details.setScreen_title("Active Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Active Regions");
		session.setAttribute("ScreenDetails", details);
		List<RegionList> active_region=regionDao.active_region();
		session.setAttribute("active_region", active_region);
		return "common/templatecontent";
	}
	
	
}


