package com.preclaim.models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Channel {

	private String channelName;
	private String channelCode;
	private int level;
	private String createdBy;
	private String createdDate;
	private String updatedDate;
	private int updatedBy;
	private int status;
	
	
	public Channel() {
	
		this.channelName="";
		this.channelCode="";
		this.level=3;
		this.createdBy="1";
		this.createdDate=LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.updatedDate=LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.updatedBy=1;
		this.status=0;
	}


	public String getChannelName() {
		return channelName;
	}


	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}


	public String getChannelCode() {
		return channelCode;
	}


	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}


	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(String createdBy) {
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
	
	
	
	
}
