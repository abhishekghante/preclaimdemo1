package com.preclaim.dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Group;

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
		int group_status=this.template.update(query, group.getGroupName(), group.getCreatedBy(),group.getCreatedDate(),group.getUpdatedDate(),group.getUpdatedBy(), group.getStatus());
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding group";
		}
		return "****";  
		}

}
