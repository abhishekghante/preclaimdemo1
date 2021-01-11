package com.preclaim.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

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
		Base64.Encoder encoder = Base64.getEncoder();    
		String password = encoder.encodeToString(login.getPassword().getBytes());  
		String sql = "select * from admin_user where username = '" + login.getUsername() + "' and password = '" 
				+ login.getPassword() + "'";
		System.out.println(sql);
		List<UserDetails> user_list = template.query(sql,new UserMapper()); 
		return user_list.size() > 0 ? user_list.get(0) : null ;
	  }

}

class UserMapper implements RowMapper<UserDetails> 
{	  
	public UserDetails mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		UserDetails login_user = new UserDetails();
		login_user.setUsername(rs.getString("username"));
		login_user.setPassword(rs.getString("password"));
		login_user.setFull_name(rs.getString("full_name"));
		return login_user;	  
	}
}


