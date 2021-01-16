package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.AppUserList;

public class AppUserDaoImpl implements AppUserDao {

	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<AppUserList> getAppuserList() {
		try
		{
			String sql = "SELECT * FROM app_users";
			List<AppUserList> appuserList = new ArrayList<AppUserList>();
			appuserList =  template.query(sql, 
					(ResultSet rs, int rowCount) -> {
						AppUserList appuser = new AppUserList();
						appuser.setSrno(rowCount + 1);
						appuser.setAppuserId(rs.getInt("appUserId"));
						appuser.setUsername(rs.getString("userName"));
						appuser.setAgentcode(rs.getString("agentCode"));
						appuser.setAgentname(rs.getString("agentName"));
						appuser.setChannelcode(rs.getString("channelCode_1"));
						appuser.setChannelname(rs.getString("channel_1"));
						appuser.setRegionId(rs.getInt("regionId"));
						appuser.setLatitude(rs.getString("lat"));
						appuser.setLongitude(rs.getString("lng"));
						appuser.setZipcode(rs.getInt("zipcode"));
						appuser.setPassword(rs.getString("password"));
						appuser.setStatus(rs.getInt("status"));
						return appuser;
					}
					
					);
			return appuserList;
		}
		catch(Exception e)
		{
			System.out.println("Error inside getAppuserList() " + e.getMessage());
			e.printStackTrace();
			return null;	
		}
	}
	
	@Override
	public String deleteAppUser(int appUserId) {
		try 
		{
			String query = "DELETE FROM app_users WHERE appUserId= ?";
			template.update(query, appUserId);
		} 
		catch (Exception e) 
		{
			System.out.println("Deletion" + e.getMessage());
			e.printStackTrace();
			return "Error deleting App User ID. Kindly contact system administrator";
		}
		return "App User deleted successfully";
	}
	
	@Override
	public String updateAppUserStatus(int appUserId, int status) {
		try {
			
			  String query="update app_users set status = ? updatedOn = now() where appUserId = ?";
              this.template.update(query,status,appUserId);	
		   }
	    catch(Exception e) 
		{
		     return "Error updating App User status. Kindly contact system administrator ";
	    }
		return "****";
	}

}
