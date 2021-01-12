package com.preclaim.models;

public class RegionList {

	private int srNo;
	private String regionName;
	private String createdDate;
	private int status;
	
	
	public RegionList() {
	
		this.srNo=0;
		this.regionName="";
		this.createdDate="";
		this.status=1;
	}


	public int getSrNo() {
		return srNo;
	}


	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}


	public String getRegionName() {
		return regionName;
	}


	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}


	public String getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
	
}
