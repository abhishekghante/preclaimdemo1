package com.preclaim.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.CategoryDao;
import com.preclaim.models.Category;
import com.preclaim.models.CategoryList;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {
     
	@Autowired
	 private CategoryDao categorydao;
	 
	 @RequestMapping(value = "/add_category", method = RequestMethod.GET)
	    public String add_category(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../category/add_category.jsp");
	    	details.setScreen_title("Add Category");
	    	details.setMain_menu("Type of Investigations");
	    	details.setSub_menu1("Add Investigation");
	    	details.setSub_menu2("Manage Category");
	    	details.setSub_menu2_path("/category/pending_category");
	    	session.setAttribute("ScreenDetails", details);
	    	return "common/templatecontent";
	    }
	 
	 
	 @RequestMapping(value = "/pending_category", method = RequestMethod.GET)
	    public String pending_category(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../category/pending_category.jsp");
	    	details.setScreen_title("Category Lists");
	    	details.setMain_menu("Type of Investigations");
	    	details.setSub_menu1("Pending Investigations");
	    	session.setAttribute("ScreenDetails", details);
	    	List<CategoryList> pending_category=categorydao.category_list(0);
	    	session.setAttribute("pending_category", pending_category);
	    	return "common/templatecontent";
	    }
	 @RequestMapping(value = "/active_category", method = RequestMethod.GET)
	    public String active_category(HttpSession session) {
	    	session.removeAttribute("ScreenDetails");
	    	ScreenDetails details = new ScreenDetails();
	    	details.setScreen_name("../category/active_category.jsp");
	    	details.setScreen_title("Category Lists");
	    	details.setMain_menu("Type of Investigations");
	    	details.setSub_menu1("Active investigations");
	    	session.setAttribute("ScreenDetails", details);
	    	List<CategoryList> activeList =categorydao.category_list(1);
	    	session.setAttribute("active_list", activeList);
	    	return "common/templatecontent";
	    }
	 
		
		  @RequestMapping(value = "/addCategory",method = RequestMethod.POST) 
		  public @ResponseBody String addCategory(HttpServletRequest request) 
		  { String categoryNameEn =
		  request.getParameter("categoryNameEn"); String imgCAtEng=
		  request.getParameter("imgCatEng"); String categoryNameHin=
		  request.getParameter("categoryNameHin"); String imgCatHin=
		  request.getParameter("imgCatHin"); int isEnImageSame=
		  Integer.parseInt(request.getParameter("isEnImageSame")); Category
		  category=new Category(); category.setCategoryNameEn(categoryNameEn);
		  category.setImgCatEng(imgCAtEng);
		  category.setCategoryNameHin(categoryNameHin);
		  category.setImgCatEng(imgCAtEng); category.setIsEnImageSame(isEnImageSame);
		  return categorydao.add_category(category);
		  }
		 
}
