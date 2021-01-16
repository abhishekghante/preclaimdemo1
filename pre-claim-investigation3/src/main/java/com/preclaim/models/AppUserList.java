package com.preclaim.models;

public class AppUserList {

	private int srno;
	private int appuserId;
	private String username;
	private String agentname;
	private String agentcode;
	private String channelcode;
	private String channelname;
	private int regionId;
	private String region;
	private String password;
	private String latitude;
	private String longitude;
	private int zipcode;
	private int status;
	public int getSrno() {
		return srno;
	}
	public void setSrno(int srno) {
		this.srno = srno;
	}
	public int getAppuserId() {
		return appuserId;
	}
	public void setAppuserId(int appuserId) {
		this.appuserId = appuserId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAgentname() {
		return agentname;
	}
	public void setAgentname(String agentname) {
		this.agentname = agentname;
	}
	public String getAgentcode() {
		return agentcode;
	}
	public void setAgentcode(String agentcode) {
		this.agentcode = agentcode;
	}
	public String getChannelcode() {
		return channelcode;
	}
	public void setChannelcode(String channelcode) {
		this.channelcode = channelcode;
	}
	public String getChannelname() {
		return channelname;
	}
	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}
	public int getRegionId() {
		return regionId;
	}
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AppUserList [srno=" + srno + ", appuserId=" + appuserId + ", username=" + username + ", agentname="
				+ agentname + ", agentcode=" + agentcode + ", channelcode=" + channelcode + ", channelname="
				+ channelname + ", regionId=" + regionId + ", region=" + region + ", password=" + password
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", zipcode=" + zipcode + ", status=" + status
				+ "]";
	}
	public AppUserList() {
		srno = 0;
		username = "";
		agentname = "";
		agentcode = "";
		channelcode = "";
		channelname = "";
		regionId = 0;
		region = "";
		password = "";
		latitude = "";
		longitude = "";
		zipcode = 0;
		status = 0;		
	}
}
