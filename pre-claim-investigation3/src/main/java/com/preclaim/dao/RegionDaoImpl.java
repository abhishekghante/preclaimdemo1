package com.preclaim.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.preclaim.models.Region;
import com.preclaim.models.RegionList;

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

	@Override
	public List<RegionList> pending_region() {
		String query="select * from region_lists";
		return this.template.query(query, new RowMapper<RegionList>() {

			@Override
			public RegionList mapRow(ResultSet rs, int rowNum) throws SQLException {
				RegionList regionList=new RegionList();
				regionList.setSrNo(rowNum);
				regionList.setRegionName(rs.getString("regionName"));
				regionList.setCreatedDate(rs.getString("createdDate"));
				regionList.setStatus(rs.getInt("status"));
				return regionList;
			}
			
		});
	}
	
	@Override
	public List<RegionList> active_region() {
		String query="select * from region_lists";
		return this.template.query(query, new RowMapper<RegionList>() {

			@Override
			public RegionList mapRow(ResultSet rs, int rowNum) throws SQLException {
				RegionList regionList=new RegionList();
				regionList.setSrNo(rowNum);
				regionList.setRegionName(rs.getString("regionName"));
				regionList.setCreatedDate(rs.getString("createdDate"));
				regionList.setStatus(rs.getInt("status"));
				return regionList;
			}
			
		});
	}


	

}
