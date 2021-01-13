package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

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
		String query = "INSERT INTO group_lists(groupName, createdBy, createdDate, updatedDate, updatedBy, "
				+ "status) values(?,?,?,?,?,?)";
		template.update(query, group.getGroupName(), group.getCreatedBy(), group.getCreatedDate(), 
				group.getUpdatedDate(), group.getUpdatedBy(), group.getStatus());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding group";
		}
		return "****";  
		}

	@Override
	public List<GroupList> group_list(int status) {
		String query="select * from group_lists where status= " + status;
		return this.template.query(query,
			(ResultSet rs, int rowNum) -> 
			{
				GroupList groupList=new GroupList();
				groupList.setGroupId(rs.getInt("GroupId"));
				groupList.setSrNo(rowNum + 1);
				groupList.setGroupName(rs.getString("groupName"));
				groupList.setCreatedDate(rs.getString("createdDate"));
				groupList.setStatus(rs.getInt("status"));		          
				return groupList;
			});
	}
	
	@Override
	public String deleteGroup(int groupId) {
		try
		{
			String query="DELETE FROM group_lists where groupId = ?";
			template.update(query, groupId);
					}
		catch(Exception e)
		{
			System.out.println("Error in deleteGroup() method" + e.getMessage());
			e.printStackTrace();
			return "Error deleting group. Kindly contact system administrator";
		}
		return "Group deleted successfully";
	}

	@Override
	public String updateGroup(int groupId, String group_name) {
		try
		{
			String sql = "UPDATE group_lists SET groupName = ? , updatedDate = now() where groupId =?";
			template.update(sql, group_name, groupId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error updating region. Kindly contact system administrator";
		}
		return "****";
	}
	
}
