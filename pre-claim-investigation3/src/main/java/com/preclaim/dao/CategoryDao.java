package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Category;
import com.preclaim.models.CategoryList;

public interface CategoryDao {
	
	public String add_category(Category category);
	public List<CategoryList> category_list(int status);

}
