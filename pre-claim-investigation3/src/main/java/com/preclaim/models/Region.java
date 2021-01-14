package com.preclaim.models;

public class Region {

	private String regionName;
	private int createdBy;
	private int updatedBy;
	private int status;
	
	
	public Region() {
		this.regionName = "";
		this.createdBy = 0;
		this.updatedBy = 0;
		this.status = 1;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Region [regionName=" + regionName + ", createdBy=" + createdBy + ", updatedBy=" + updatedBy
				+ ", status=" + status + "]";
	}
	
	
	
	
}
