package com.preclaim.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.preclaim.config.Config;
import com.preclaim.dao.CaseDao;
import com.preclaim.dao.InvestigationTypeDao;
import com.preclaim.dao.MessageDao;
import com.preclaim.models.CaseDetails;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/message")
public class CaseController {

	@Autowired
	CaseDao caseDao;
	
	@Autowired
	MessageDao messageDao;
	
	@Autowired
	InvestigationTypeDao investigationDao;
	
    @RequestMapping(value = "/import_case", method = RequestMethod.GET)
    public String import_case(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/import_case.jsp");
    	details.setScreen_title("Import Case");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Bulk case uploads");
    	details.setSub_menu2("App Users");
    	details.setSub_menu2_path("/app_user/app_user");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
    @RequestMapping(value = "/add_message", method = RequestMethod.GET)
    public String add_message(HttpSession session, HttpServletRequest request) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/add_message.jsp");
    	details.setScreen_title("Add Cases");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Create Case");
    	details.setSub_menu2("Manage Cases");
    	details.setSub_menu2_path("../message/pending_message.jsp");
    	session.setAttribute("ScreenDetails", details);    	
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/pending_message", method = RequestMethod.GET)
    public String pending_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/pending_message.jsp");
    	details.setScreen_title("Pending Cases Lists");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Pending Cases");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
  
    @RequestMapping(value = "/active_message", method = RequestMethod.GET)
    public String active_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/active_message.jsp");
    	details.setScreen_title("<li class = \"active\">Active Cases Lists</li>");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Active Cases");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
    @RequestMapping(value = "/assigned_message", method = RequestMethod.GET)
    public String assigned_message(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/assigned_message.jsp");
    	details.setScreen_title("<li class = \"active\">Assigned Cases Lists</li>");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Assigned Cases");
    	session.setAttribute("ScreenDetails", details);
        return "common/templatecontent";
    }
    
    @RequestMapping(value = "/importData", method = RequestMethod.POST)
	public String importData(@RequestParam CommonsMultipartFile userfile,HttpSession session, HttpServletRequest request)
	{
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../message/import_case.jsp");
    	details.setScreen_title("Import Case");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Bulk case uploads");
    	details.setSub_menu2("App Users");
    	details.setSub_menu2_path("/app_user/app_user");
    	session.setAttribute("ScreenDetails", details);
				
		//File Uploading Routine
		if(userfile != null)
		{
			try 
			{
	    		byte[] temp = userfile.getBytes();
	    		String filename = userfile.getOriginalFilename();
	    		filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-SS")) + "_" + filename;
	    		Path path = Paths.get(Config.upload_directory + filename);
	    		System.out.println("Entered");
				Files.write(path, temp);
				caseDao.addBulkUpload(filename);
				details.setSuccess_message1("File uploaded successfully");		    	
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				details.setError_message1("File Uploading failed");
			}    	
		}
			
		return "common/templatecontent";
	}
    
    @RequestMapping(value = "/addMessage",method = RequestMethod.POST)
   	public @ResponseBody String addMessage(HttpSession session, HttpServletRequest request) 
   	{			
       	String policyNumber = request.getParameter("policyNumber");
       	String insuredName = request.getParameter("insuredName");
       	String claimantCity = request.getParameter("claimantCity");
       	String claimantState = request.getParameter("claimantState");
       	String claimantZone = request.getParameter("claimantZone");
       	String typeOfInvestigation = request.getParameter("msgCategory");
       	int sumAssured = Integer.parseInt(request.getParameter("sumAssured"));
       
       	UserDetails user = (UserDetails) session.getAttribute("User_Login");
       	CaseDetails caseDetail=new CaseDetails();
       	caseDetail.setPolicyNumber(policyNumber);
       	caseDetail.setInsuredName(insuredName);
       	caseDetail.setClaimantCity(claimantCity);
       	caseDetail.setClaimantState(claimantState);
       	caseDetail.setClaimantZone(claimantZone);
       	caseDetail.setInvestigationCategory(typeOfInvestigation);
       	caseDetail.setSumAssured(sumAssured);
       	caseDetail.setCreatedBy(user.getUserID());
       	String message= messageDao.addcase(caseDetail);
   		return message;
   	}
    
}
