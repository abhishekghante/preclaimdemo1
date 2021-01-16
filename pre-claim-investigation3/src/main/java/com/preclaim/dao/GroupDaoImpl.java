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

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String add_group(Group group) {
		try {
			String GroupCheck = "select count(*) from group_lists where groupName='" + group.getGroupName() + "'";
			int groupCount = this.template.queryForObject(GroupCheck, Integer.class);
			System.out.println(group.toString());
			if (groupCount == 0) {
				String query = "INSERT INTO group_lists(groupName, createdBy, createdDate, updatedDate, "
						+ "updatedBy, status) values(?,?,now(),now(),?,?)";
				template.update(query, group.getGroupName(), group.getCreatedBy(), group.getUpdatedBy(),
						group.getStatus());
			} else
				return "Group already exists";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding group";
		}
		return "****";
	}

	@Override
	public List<GroupList> group_list(int status) {
		String query = "";		
		if(status==0) 
			query = "select * from group_lists where status= " + status;
		else 
			query = "select * from group_lists where status = 1 or status = 2";
		return this.template.query(query, (ResultSet rs, int rowNum) -> {
			GroupList groupList = new GroupList();
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
		try {
			String query = "DELETE FROM group_lists where groupId = ?";
			template.update(query, groupId);
		} catch (Exception e) {
			System.out.println("Error in deleteGroup() method" + e.getMessage());
			e.printStackTrace();
			return "Error deleting group. Kindly contact system administrator";
		}
		return "Group deleted successfully";
	}

	@Override
	public String updateGroup(int groupId, String group_name) {
		try {
			String sql = "UPDATE group_lists SET groupName = ? , updatedDate = now() where groupId =?";
			template.update(sql, group_name, groupId);
		} catch (Exception e) {
			e.printStackTrace();
			return "Error updating region. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String updateGroupStatus(int groupId, int status) {
		try {
		String sql=" update group_lists set status=?,updatedDate=now() where groupId=?";
	           template.update(sql,status,groupId);	
	           return  "****";
		}catch(Exception e){
			return "Error updating Group status";
		}
		
	

}}
