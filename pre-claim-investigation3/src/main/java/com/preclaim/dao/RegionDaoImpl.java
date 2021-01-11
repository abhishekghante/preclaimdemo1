package com.preclaim.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;



import com.preclaim.models.Region;

public class RegionDaoImpl implements RegionDao {
	
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
	public String create_region(Region region) {
		try {
			String query="insert into region_lists(regionName,createdBy,createdDate,updatedDate,updatedBy,status) values(?,?,?,?,?,?)";
			int region_status=this.template.update(query,region.getRegionName(),region.getCreatedBy(),region.getCreatedDate(),region.getUpdatedDate(),region.getUpdatedBy(),region.getStatus());
	
		}catch(Exception e) {
	
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding region";
		}
		
		return "****";
	}

	

}
