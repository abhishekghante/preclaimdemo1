package com.preclaim.models;

public class Group {

	private String groupName;
	private int createdBy;
	private int updatedBy;
	private int status;
	private int group_id;
	
	public Group() {
		this.groupName = "";
		this.createdBy = 0;
		this.updatedBy = 0;
		this.status = 0;
		this.group_id = 0;
		
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
	
	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}

	@Override
	public String toString() {
		return "Group [groupName=" + groupName + ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + ", status="
				+ status + ", group_id=" + group_id + "]";
	}

	

	
}
