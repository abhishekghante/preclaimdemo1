package com.preclaim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.preclaim.config.Config;
import com.preclaim.models.CaseDetails;

public class CaseDaoImpl implements CaseDao {

	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String addCase() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addBulkUpload(String filename) {
		
		String extension = StringUtils.getFilenameExtension(filename).toLowerCase();
		String error ="";
		if(extension.equals("xlsx"))
			error = readCasexlsx(filename);
		// TODO Auto-generated method stub
		return error;
	}
	

	@Transactional
	public String readCasexlsx(String filename) {
		try {
			File file = new File(Config.upload_directory + filename);
			//File not found error won't occur
			List<CaseDetails> caseList = new ArrayList<CaseDetails>();
			FileInputStream fis = new FileInputStream(file);
			XSSFWorkbook wb = new XSSFWorkbook(fis);   
			XSSFSheet sheet = wb.getSheetAt(0);
			Iterator<Row> itr = sheet.iterator();    //iterating over excel file  		
			itr.hasNext();
			itr.next();
			while (itr.hasNext())                 
			{  
				//Skipping Header String
				Row row = itr.next();
				Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
				CaseDetails caseDetails = new CaseDetails();
				Cell cell;
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setPolicyNumber(readCellStringValue(cell));
				}	
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setInsuredName(readCellStringValue(cell));
				}	
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setClaimantCity(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setClaimantZone(readCellStringValue(cell));;
				}				
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setClaimantState(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();
					caseDetails.setInvestigationCategory(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();
					caseDetails.setSumAssured(readCellIntValue(cell));
				}
				
				caseList.add(caseDetails);
			}
			wb.close();
			String sql = "INSERT INTO case_lists(policyNumber, insuredName, claimantCity, claimantZone, claimantState,"
					+ "status, substatus, investigationCategory, sumAssured, createdBy, createdDate, updatedDate, updatedBy) "
					+ "VALUES(?, ?, ?, ?, ?, 1, 1, ?, ?, ?, now(), '0000-00-00 00:00:00', 0)";
			
			template.batchUpdate(sql,caseList,5,
	                new ParameterizedPreparedStatementSetter<CaseDetails>() {
	                    public void setValues(PreparedStatement ps, CaseDetails caseDetails) throws SQLException          
	                    {
	                    	ps.setString(1, caseDetails.getPolicyNumber());
	                    	ps.setString(2, caseDetails.getInsuredName());
	                    	ps.setString(3, caseDetails.getClaimantCity());
	                    	ps.setString(4, caseDetails.getClaimantZone());
	                    	ps.setString(5, caseDetails.getClaimantState());
	                    	ps.setString(6, caseDetails.getInvestigationCategory());
	                    	ps.setInt(7, (int)caseDetails.getSumAssured());
	                    	ps.setInt(8, 0);	                    		 	
	                    }
	                });
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public String readCellStringValue(Cell cell)
	{
		switch (cell.getCellType())               
		{  
			case STRING:  
				return cell.getStringCellValue();  
			case NUMERIC:    //field that represents number cell type  
				return String.valueOf(cell.getNumericCellValue());
			default:
				return "";
		}
	}
	
	public int readCellIntValue(Cell cell)
	{
		switch (cell.getCellType())               
		{  
			case STRING:  
				return Integer.parseInt(cell.getStringCellValue());  
			case NUMERIC:    //field that represents number cell type  
				return (int)cell.getNumericCellValue();
			default:
				return 0;
		}
	}

}