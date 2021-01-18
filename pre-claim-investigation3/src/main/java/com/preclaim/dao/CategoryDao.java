package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Category;
import com.preclaim.models.CategoryList;

public interface CategoryDao {
	
	public String add_category(Category category);
	public List<CategoryList> category_list(int status);
    public String updateCategoryStatus(int status,int categoryId);
    public String deleteCategory(int category_id);
    String updateCategory(String categoryNameEn, String categoryNameThai,String categoryImgEn,String categoryImgThai,int categoryId);
}
