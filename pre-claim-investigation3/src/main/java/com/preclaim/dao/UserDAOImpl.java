package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.preclaim.models.UserDetails;
import com.preclaim.models.User_Role;

public class UserDAOImpl implements UserDAO{

	@Autowired
	DataSource datasource;
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	@Override
	public List<User_Role> role_lists() {
		String sql = "select * from user_role where status = 1";
		return template.query(sql, new RowMapper<User_Role>(){			
			public User_Role mapRow(ResultSet rs, int row) throws SQLException
			{
				User_Role role = new User_Role();
				role.setRoleId(rs.getInt(1));
				role.setRole(rs.getString(2));
				role.setRole_code(rs.getString(3));
				role.setStatus(rs.getInt(4));
				return role;
			}
		});
	}

	@Override
	public String create_user(UserDetails user) {
		String created_date = LocalDateTime.now().format(format);
		String sql = "INSERT INTO admin_user(full_name, account_type, username, user_email, "
				+ "contact_number, password, address, permissions, status, user_image, createdon, "
				+ "web_active, last_login) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println(user.getPassword());
		try {
			template.update(sql, user.getFull_name(),user.getUsertype(),user.getUsername(),user.getUser_email(),
					"",user.getPassword(),"","",user.getStatus(),"",created_date,
					1,created_date);
		}
		catch(Exception e)
		{
			return "Error in adding user";
		}
		return "****";
	}
	
}
