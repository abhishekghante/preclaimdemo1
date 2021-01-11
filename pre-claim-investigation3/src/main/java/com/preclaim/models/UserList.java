package com.preclaim.models;

import java.util.Base64;
import java.util.Base64.Decoder;

public class UserList {

	private int srno;
	private String full_name;
	private String account_type;
	private String account_code;
	private String username;
	private String user_email;
	private String password;
	private String user_status;
	
	public UserList()
	{
		this.srno = 0;
		this.full_name = "";
		this.account_type = "";
		this.account_code = "";
		this.username = "";
		this.user_email = "";
		this.password = "";
		this.user_status = "";
	}
	
	public int getSrno() {
		return srno;
	}
	public void setSrno(int srno) {
		this.srno = srno;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getAccount_type() {
		return account_type;
	}
	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}
	public String getAccount_code() {
		return account_code;
	}
	public void setAccount_code(String account_code) {
		this.account_code = account_code;
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
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	@Override
	public String toString() {
		return "UserList [srno=" + srno + ", full_name=" + full_name + ", account_type=" + account_type
				+ ", account_code=" + account_code + ", username=" + username + ", user_email=" + user_email
				+ ", password=" + password + ", user_status=" + user_status + "]";
	}
	
	public void decodePassword(String password)
	{
		Decoder decoder = Base64.getDecoder();
		this.password = new String(decoder.decode(password));
	}
}
