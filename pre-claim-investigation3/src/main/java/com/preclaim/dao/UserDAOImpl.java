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
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

public class UserDAOImpl implements UserDAO{

	@Autowired
	DataSource datasource;
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	@Override
	public List<UserRole> role_lists() {
		String sql = "select * from user_role where status = 1";
		return template.query(sql, new RowMapper<UserRole>(){			
			public UserRole mapRow(ResultSet rs, int row) throws SQLException
			{
				UserRole role = new UserRole();
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
			template.update(sql, user.getFull_name(),user.getAccount_type(),user.getUsername(),user.getUser_email(),
					"",user.getPassword(),"","",user.getStatus(),"",created_date,
					1,created_date);
		}
		catch(Exception e)
		{
			return "Error in adding user";
		}
		return "****";
	}

	@Override
	public String create_role(UserRole role) {
		try
		{
			String sql = "INSERT INTO user_role(role,role_code,status,created_on,updated_on) VALUES(?,?,?,?,?)";
			this.template.update(sql,role.getRole(),role.getRole_code(),role.getStatus(),role.getCreated_on(),
				role.getUpdated_on());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error adding role. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String delete_role(UserRole role) {
		try
		{
			String sql = "UPDATE user_role SET status = ? where roleId = ?";
			this.template.update(sql,role.getStatus(),role.getRoleId());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error deleting role. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public List<UserList> user_list() {
		try
		{
			String sql = "select * from admin_user a, user_role b where a.account_type = b.roleId";			
			List<UserList> user_list = this.template.query(sql, 
					(ResultSet rs, int count) -> {
						UserList user = new UserList();
						user.setSrno(count);
						user.setUser_id(rs.getInt("user_id"));
						user.setFull_name(rs.getString("full_name"));
						user.setAccount_type(rs.getString("role"));
						user.setAccount_code(rs.getString("roleId"));
						user.setUsername(rs.getString("username"));
						user.setUser_email(rs.getString("user_email"));
						user.decodePassword(rs.getString("password"));
						user.setUser_status(rs.getInt("status"));
						return user;
					});
			return user_list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public String deleteAdminUser(int user_id) {
		try
		{
			String sql = "DELETE FROM admin_user where user_id = ?";
			int message = this.template.update(sql, user_id);
			System.out.println("Deletion" + message);	
		}
		catch(Exception e)
		{
			System.out.println("Error in deleteAdminUser() method" + e.getMessage());
			e.printStackTrace();
			return "Error deleting user. Kindly contact system administrator";
		}
		return "User deleted successfully";
	}

	@Override
	public String updateUserStatus(int user_id, int user_status) {
		try
		{
			String sql = "UPDATE admin_user SET status = ? where user_id = ?";
			int message = this.template.update(sql, user_status,user_id);
			System.out.println("Update Status" + message);	
		}
		catch(Exception e)
		{
			System.out.println("Error in updateUserStatus() method" + e.getMessage());
			e.printStackTrace();
			return "Error updating user status. Kindly contact system administrator";
		}
		return "User status updated successfully";
	}

	@Override
	public UserDetails getUserDetails(int user_id) {
		try
		{
			String sql = "SELECT * FROM admin_user where user_id = ?";
			List<UserDetails> user =  this.template.query(sql, new Object[] {user_id}, 
					(ResultSet rs, int rowCount) -> 
					{
						UserDetails details = new UserDetails();
						details.setFull_name(rs.getString("full_name"));
						details.decodePassword(rs.getString("password"));
						details.setStatus(rs.getInt("status"));
						details.setUser_email(rs.getString("user_email"));
						details.setUserimage(rs.getString("user_image"));
						details.setAccount_type(rs.getString("account_type"));
						details.setUsername(rs.getString("username"));
						details.setUserID(rs.getInt("user_id"));
						return details;
					}
					);
			return user.get(0);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String updateUserDetails(UserDetails user_details) {
		try
		{
			String sql = "UPDATE admin_user SET full_name = ?, account_type = ?, username = ?,"
					+ "user_email = ?, password = ?, status = ?, user_image = ? where "
					+ "user_id = ?";
			this.template.update(sql, user_details.getFull_name(), user_details.getAccount_type(),
					user_details.getUsername(), user_details.getUser_email(), user_details.getPassword(),
					user_details.getStatus(), user_details.getUserimage(), user_details.getUserID());
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Failed updating user ID";
		}
		return "****";
	}

	@Override
	public String updateUserRole(UserRole role) {
		try
		{
			String sql = "UPDATE user_role SET role = ?, role_code = ?, updated_on = ? where roleId = ?";
			this.template.update(sql, role.getRole(), role.getRole_code(), 
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")),
					role.getRoleId());
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Failed updating user ID";
		}
		return "****";
	}
	
	
}
