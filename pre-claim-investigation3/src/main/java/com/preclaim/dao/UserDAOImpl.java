package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.preclaim.models.User_Role;

public class UserDAOImpl implements UserDAO{

	@Autowired
	DataSource datasource;
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

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
	public String create_user() {
		
		return null;
	}
	
}
