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

import com.preclaim.dao.RegionDao;
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
		List<RegionList> pending_region=regionDao.region_list(1);
		session.setAttribute("pending_region", pending_region);		
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/pending_region/{region_name}/{regionId}",method = RequestMethod.GET)
	public String pending_region(@PathVariable("region_name") String region_name, 
			@PathVariable("regionId") String regionId, HttpSession session) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/pending_region.jsp");
		details.setScreen_title("Pending Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Pending Regions");
		session.setAttribute("ScreenDetails", details);
		List<RegionList> pending_region=regionDao.region_list(1);
		session.setAttribute("pending_region", pending_region);
		RegionList region = new RegionList();
			region.setRegionId(Integer.parseInt(regionId));
			region.setRegionName(region_name);
			session.setAttribute("region", region);		
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
		List<RegionList> active_region=regionDao.region_list(4);
		session.setAttribute("active_region", active_region);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/deleteRegion",method = RequestMethod.POST)
	public @ResponseBody String deleteRegion(HttpServletRequest request) {
	
		int RegionId=Integer.parseInt(request.getParameter("RegionId"));
		System.out.println("RegionId :"+RegionId);
		String message=regionDao.deleteRegion(RegionId);
		
		return message;
	}
	
	@RequestMapping(value = "/addRegion",method = RequestMethod.POST)
	public @ResponseBody String addRegion(HttpServletRequest request) 
	{	
		String RegionName = request.getParameter("regionName");
		Region region = new Region();
		region.setRegionName(RegionName);
		String message=regionDao.create_region(region);		
		return message;
	}
	
	@RequestMapping(value = "/updateRegion",method = RequestMethod.POST)
	public @ResponseBody String updateRegion(HttpServletRequest request) 
	{	
		int RegionId=Integer.parseInt(request.getParameter("regionId"));		
		String RegionName = request.getParameter("regionName");
		System.out.println("RegionId :"+ RegionId);
		String message=regionDao.updateRegion(RegionId,RegionName);		
		return message;
	}
	
}


