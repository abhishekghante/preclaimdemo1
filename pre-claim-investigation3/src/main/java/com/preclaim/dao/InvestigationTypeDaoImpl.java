package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.InvestigationType;
import com.preclaim.models.InvestigationTypeList;

public class InvestigationTypeDaoImpl implements InvestigationTypeDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String add_InvestigationType(InvestigationType investigationType, int userId) {

		try {
			String sql = "INSERT INTO InvestigationType_lists(investigationType, createdBy, createdDate"
					+ ", updatedDate, updatedBy, status) values(?,?,now(),now(),?,?)";
			this.template.update(sql,investigationType.getInvestigationType(), userId, 0, 0);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return "Error adding investigation. Kindly contact system administrator";
		}

		return "****";
	}

	@Override
	public List<InvestigationTypeList> InvestigationType_list(int status) {
		String query = "";
		if (status == 0)
			query = "SELECT * FROM investigation_type WHERE status = " + status;
		else
			query = "select * from investigation_type where status = 1 or status = 2";
		return template.query(query, (ResultSet rs, int rowNum) -> {
			InvestigationTypeList investigationTypeList = new InvestigationTypeList();
			investigationTypeList.setSrNo(rowNum + 1);
			investigationTypeList.setInvestigationId(rs.getInt("investigationId"));
			investigationTypeList.setInvestigationType(rs.getString("invesstigationType"));
			return investigationTypeList;
		});
	}

	public String updateInvestigationTypeStatus(int investigationId, int userId, int status) 
	{
		try 
		{
			String sql = "UPDATE investigation_type SET status = ?, updatedDate = now(),"
					+ " updatedBy = ? where InvestigationTypeId = ?";
			this.template.update(sql, investigationId, status);
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("Error updating Investigation status. Kindly contact system administrator");
	    }
		return "****";
	}

	@Override
	public String deleteInvestigationType(int investigationId) {
		try 
		{
			String sql = "DELETE FROM investigation_type WHERE InvestigationTypeId = ?";
			this.template.update(sql,investigationId);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "Error deleting Investigation Type. Kindly contact system administrator";	
		}
		return "****";	
		}
	
	@Override
	public String updateInvestigationType(String investigationType, int userId, int investigationId) 
	{
		try
		{
			String sql = "UPDATE investigation_type SET investigationType = ?, updatedDate = now(), "
					+ "updatedBy = ? where investigationId = ?";
			template.update(sql, investigationType, userId, investigationId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error updating Investigation Type. Kindly contact system administrator";
		}
		return "****";
	}
	
}
