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
			String query = "insert into region_lists(regionName,createdBy,createdDate,updatedDate,updatedBy,status) values(?,?,?,?,?,?)";
			int region_status = this.template.update(query, region.getRegionName(), region.getCreatedBy(),
					           region.getCreatedDate(), region.getUpdatedDate(), region.getUpdatedBy(), region.getStatus());

		} catch (Exception e) {

			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding region";
		}

		return "****";
	}

	@Override
	public List<RegionList> region_list(int status) {
		String query = "select * from region_lists where status=" + status;
		return this.template.query(query, new RowMapper<RegionList>() {

			@Override
			public RegionList mapRow(ResultSet rs, int rowNum) throws SQLException {
				RegionList regionList = new RegionList();
				regionList.setRegionId(rs.getInt("regionId"));
				regionList.setSrNo(rowNum);
				regionList.setRegionName(rs.getString("regionName"));
				regionList.setCreatedDate(rs.getString("createdDate"));
				regionList.setStatus(rs.getInt("status"));
				return regionList;
			}

		});
	}

	@Override
	public String deleteRegion(int regionId) {
		try {

			String query = "DELETE FROM region_lists where regionId= ?";
			int message = this.template.update(query, regionId);

		} catch (Exception e) {

			System.out.println("Deletion" + e.getMessage());
			e.printStackTrace();
			return "Error deleting region. Kindly contact system administrator";
		}
		return "Region deleted successfully";
	}

}
