package com.preclaim.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.preclaim.models.Group;
import com.preclaim.models.GroupList;

public class GroupDaoImpl implements GroupDao {

	
	@Autowired
	DataSource datasource;
	
	private JdbcTemplate template;	
	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String add_group(Group group) {
		try {
		System.out.println(group.toString());
		String query = "insert into group_lists(groupName, createdBy, createdDate, updatedDate, updatedBy, status) values(?,?,?,?,?,?)";
		int group_status=this.template.update(query, group.getGroupName(), group.getCreatedBy(),group.getCreatedDate(),group.getUpdatedDate(),group.getUpdatedBy(), 
				group.getStatus());
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding group";
		}
		return "****";  
		}

	@Override
	public List<GroupList> group_list(int status) {
		String query="select * from group_lists where status= " +status;
		return this.template.query(query,new RowMapper<GroupList>() {

			@Override
			public GroupList mapRow(ResultSet rs, int rowNum) throws SQLException {
				GroupList groupList=new GroupList();
				groupList.setGroupId(rs.getInt("GroupId"));
				groupList.setSrNo(rowNum);
				groupList.setGroupName(rs.getString("groupName"));
				groupList.setCreatedDate(rs.getString("createdDate"));
				groupList.setStatus(rs.getInt("status"));		          
				return groupList;
			}
			
		});
		
		
	}
	@Override
	public String deleteGroup(int groupId) {
		try
		{
		String query="DELETE FROM group_lists where groupId = ?";
		int message=this.template.update(query, groupId);
		
		System.out.println("Deletion" + message);	
		}
		catch(Exception e)
		{
			System.out.println("Error in deleteGroup() method" + e.getMessage());
			e.printStackTrace();
			return "Error deleting group. Kindly contact system administrator";
		}
		return "Group deleted successfully";
	}

}
