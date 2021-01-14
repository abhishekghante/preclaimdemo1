package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Login;
import com.preclaim.models.UserDetails;

public class LoginDAOImpl implements LoginDAO {
	
	@Autowired  
	DataSource datasource;
	  
	private JdbcTemplate template;
	  
	public void setTemplate(JdbcTemplate template) 
	{  
      this.template = template;    
	}
	
	public UserDetails validateUser(Login login)	  
	{	
		String sql = "select * from admin_user where username = ? and password = ?";
		List<UserDetails> user_list = template.query(sql, 
				new Object[] {login.getUsername(),login.getPassword()},
				(ResultSet rs, int arg1) ->{
					UserDetails login_user = new UserDetails();
					login_user.setUserID(rs.getInt("user_id"));
					login_user.setUsername(rs.getString("username"));
					login_user.decodePassword(rs.getString("password"));
					login_user.setFull_name(rs.getString("full_name"));
					login_user.setStatus(rs.getInt("status"));
					login_user.setUser_email(rs.getString("user_email"));
					return login_user;
				});
		return user_list.size() > 0 ? user_list.get(0) : null ;
	  }

}

