package com.preclaim.dao;

import com.preclaim.models.CaseDetails;

public interface CaseDao {
	
	String addBulkUpload(String filename);
	String addcase(CaseDetails casedetail);

}
