package com.preclaim.models;


public class UserDetails {
	private String full_name;  
	private String username;
	private String user_email;	
	private String password;
	private String usertype;
	private int status;
	private String userimage;
	
	
	public UserDetails() {
		this.full_name = "";
		this.username = "";
		this.password = "";
		this.user_email = "";
		this.usertype = "";
		this.status = 0;
		this.userimage = "";
	}
	
	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	@Override
	public String toString() {
		return "UserDetails [Full Name=" + full_name + ", username=" + username + ", email=" + user_email + ", password=" + password
				+ ", usertype=" + usertype + ", status=" + status + ", userimage=" + userimage + "]";
	}
	
}
