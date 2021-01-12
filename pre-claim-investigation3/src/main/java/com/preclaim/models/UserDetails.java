package com.preclaim.models;

import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Base64.Decoder;

public class UserDetails {
	private String full_name;  
	private String username;
	private String user_email;	
	private String password;
	private String account_type;
	private int status;
	private String userimage;
	private int userID;
	
	public UserDetails() {
		this.full_name = "";
		this.username = "";
		this.password = "";
		this.user_email = "";
		this.account_type = "";
		this.status = 0;
		this.userimage = "";
		this.userID = 0;
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
		Encoder encoder = Base64.getEncoder();
		this.password = encoder.encodeToString(password.getBytes());
	}
	public String getAccount_type() {
		return account_type;
	}
	public void setAccount_type(String account_type) {
		this.account_type = account_type;
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
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "UserDetails [full_name=" + full_name + ", username=" + username + ", user_email=" + user_email
				+ ", password=" + password + ", account_type=" + account_type + ", status=" + status + ", userimage="
				+ userimage + ", userID=" + userID + "]";
	}
	
	public void decodePassword(String encodedPassword)
	{
		Decoder decoder = Base64.getDecoder();
		this.password = new String(decoder.decode(encodedPassword));
	}
	
}
