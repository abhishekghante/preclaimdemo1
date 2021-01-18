package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.preclaim.models.Category;
import com.preclaim.models.CategoryList;
import com.preclaim.models.ChannelList;

public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String add_category(Category category) {

		try {
			String sql = "insert into category_lists(categoryNameEn,categoryNameThai,categoryImgEn,categoryImgThai,isEnImageSame,"
					+ "createdBy,createdDate,UpdatedDate,updatedBy,orderNo,status) values(?,?,?,?,?,?,now(),now(),?,?,?)";
			this.template.update(sql, category.getCategoryNameEn(), category.getCategoryNameHin(),
					category.getImgCatEng(), category.getImgCatHin(), category.getIsEnImageSame(),
					category.getCreatedBy(), category.getUpdatedBy(), category.getOrderNo(), category.getStatus());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error adding investigation");
		}

		return "****";
	}

	@Override
	public List<CategoryList> category_list(int status) {
		String query = "";
		if (status == 0)
			query = "SELECT * FROM category_lists WHERE status=" + status;
		else
			query = "select * from category_lists where status = 1 or status = 2";
		return template.query(query, (ResultSet rs, int rowNum) -> {
			CategoryList categoryList = new CategoryList();
			categoryList.setSrNo(rowNum + 1);
			categoryList.setCategoryId(rs.getInt("categoryId"));
			categoryList.setCategoryNameEn(rs.getString("CategoryNameEn"));
			categoryList.setImgCatEng("categoryImgEn");
			categoryList.setCategoryNameHin(rs.getString("categoryNameThai"));
			categoryList.setImgCatHin("categoryImgThai");
			categoryList.setStatus(rs.getInt("status"));
			return categoryList;
		});
	}

	public String updateCategoryStatus(int categoryId, int status) {
		try 
		{
			String sql = "update category_lists set status=? where categoryId=?";
			this.template.update(sql, categoryId, status);
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("Error status update");
	    }
		return "****";
	}

	@Override
	public String deleteCategory(int category_id) {
		try 
		{
			String sql="delete from category_lists where categoryId=?";
			this.template.update(sql,category_id);
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("error category delete");	
		}
		return "delete category sucessfully";	
		}
	
	@Override
	public String updateCategory(String categoryNameEn, String categoryNameThai,String categoryImgEn,String categoryImgThai,int categoryId) {
		try
		{
			String sql = "UPDATE category_lists SET categoryNameEn = ?, categoryNameThai = ?,categoryImgEn = ?,categoryImgThai = ? where categoryId = ?";
			template.update(sql, categoryNameEn, categoryNameThai, categoryId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error updating category";
		}
		return "****";
	}
	
}
