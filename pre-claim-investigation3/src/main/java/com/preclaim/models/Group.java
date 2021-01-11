package com.preclaim.models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Group {

	private String groupName;
	private int createdBy;
	private String createdDate;
	private String updatedDate;
	private int updatedBy;
	private int status;
	
	public Group() {
		this.groupName="";
		this.createdBy=0;
		this.createdDate=LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.updatedDate=LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.updatedBy=0;
		this.status=0;
		
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
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
		return "Group [groupName=" + groupName + ", createdBy=" + createdBy + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", updatedBy=" + updatedBy + ", status=" + status + "]";
	}

	
}
