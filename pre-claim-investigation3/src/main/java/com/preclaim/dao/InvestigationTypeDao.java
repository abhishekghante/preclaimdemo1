package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.InvestigationType;
import com.preclaim.models.InvestigationTypeList;

public interface InvestigationTypeDao {
	
	String add_InvestigationType(InvestigationType investigationType, int userId);
	String updateInvestigationType(String investigationType, int userId, int investigationId);	
	List<InvestigationTypeList> InvestigationType_list(int status);
    String updateInvestigationTypeStatus(int status, int userId, int investigationId);
    String deleteInvestigationType(int investigationId);
    
}
