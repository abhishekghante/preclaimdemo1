package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.CategoryDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.Category;
import com.preclaim.models.CategoryList;
import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {

	@Autowired
	private CategoryDao categorydao;
	
	@Autowired
	private UserDAO userDao;

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
	public String pending_category(HttpSession session,HttpServletRequest request) {
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../category/pending_category.jsp");
		details.setScreen_title("Category Lists");
		details.setMain_menu("Type of Investigations");
		details.setSub_menu1("Pending Investigations");
		session.setAttribute("ScreenDetails", details);
		List<CategoryList> pending_category = categorydao.category_list(0);
		session.setAttribute("pending_category", pending_category);
		
		if(request.getParameter("categoryId")!=null) {
		Category category=new Category();
		category.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		category.setCategoryNameEn(request.getParameter("imgCatEng"));
		category.setImgCatEng(request.getParameter("categoryImgEn"));
		category.setCategoryNameHin(request.getParameter("categoryNameHin"));
		category.setImgCatHin(request.getParameter("delImgMsgHin"));
		category.setIsEnImageSame(Integer.parseInt(request.getParameter("isEnImageSame")));		
		session.setAttribute("category", category);
		}
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
		List<CategoryList> activeList = categorydao.category_list(1);
		session.setAttribute("active_list", activeList);
		return "common/templatecontent";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public @ResponseBody String addCategory(HttpServletRequest request) {
		String categoryNameEn = request.getParameter("categoryNameEn");
		String imgCAtEng = request.getParameter("categoryImgEn");
		String categoryNameHin = request.getParameter("categoryNameHin");
		String imgCatHin = request.getParameter("categoryImgHin");
		int isEnImageSame = Integer.parseInt(request.getParameter("isEnImageSame"));
		Category category = new Category();
		category.setCategoryNameEn(categoryNameEn);
		category.setImgCatEng(imgCAtEng);
		category.setCategoryNameHin(categoryNameHin);
		category.setImgCatEng(imgCAtEng);
		category.setIsEnImageSame(isEnImageSame);
		userDao.activity_log("CATEGORY", 0, "ADD", 0, request.getRemoteAddr());
		return categorydao.add_category(category);
	}
	
	@RequestMapping(value ="/updateCategory",method = RequestMethod.POST )
    public @ResponseBody String updatetCategory(HttpServletRequest request) {
	 int categoryId=Integer.parseInt(request.getParameter("categoryId"));
	 String categoryNameEn=request.getParameter("categoryNameEn");
	 String categoryNameThai=request.getParameter("categoryNameHin");
	 String categoryImgEn=request.getParameter("categoryImgEn");
	 String categoryImgThai=request.getParameter("categoryImgHin"); 
     String message=categorydao.updateCategory(categoryNameEn, categoryNameThai, categoryImgEn, categoryImgThai,categoryId);	
     userDao.activity_log("CATEGORY", categoryId, "Update", 0, request.getRemoteAddr());
	 return message;
	}
	
	@RequestMapping(value ="/deleteCategory",method = RequestMethod.POST )
    public @ResponseBody String deleteCategory(HttpServletRequest request) {
	 int categoryId=Integer.parseInt(request.getParameter("categoryId"));	
     String message=categorydao.deleteCategory(categoryId);	
     userDao.activity_log("CATEGORY", categoryId, "DELETE", 0, request.getRemoteAddr());
	 return message;
	}
	
	@RequestMapping(value = "/updateCategoryStatus",method = RequestMethod.POST)
	public @ResponseBody String updateCategoryStatus(HttpServletRequest request) {
		int status=Integer.parseInt(request.getParameter("status"));
		int categoryId=Integer.parseInt(request.getParameter("categoryId"));
		String message=categorydao.updateCategoryStatus(status, categoryId);
		userDao.activity_log("CATEGORY", categoryId, status == 1 ? "ACTIVE" : "DEACTIVE", 0, request.getRemoteAddr());
		return message;
	}
	  
   
}
