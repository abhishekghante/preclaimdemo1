package com.preclaim.models;

public class GroupList {

	private int srNo;
	private String groupName;
	private String createdDate;
	private int status;

	public GroupList() {

		this.srNo = 0;
		this.groupName = "";
		this.createdDate = "";
		this.status = 0;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "GroupList [srNo=" + srNo + ", groupName=" + groupName + ", createdDate=" + createdDate + ", status="
				+ status + "]";
	}

}
