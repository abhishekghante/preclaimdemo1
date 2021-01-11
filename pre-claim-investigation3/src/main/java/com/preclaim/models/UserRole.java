package com.preclaim.models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
public class UserRole {

	private int roleId;
	private String role;
	private String role_code;
	private int status;
	private String created_on;
	private String updated_on;
	public UserRole()
	{
		this.roleId = 0;
		this.role = "";
		this.role_code = "";
		this.status = 0;
		this.created_on = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.updated_on = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}
	public String getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(String updated_on) {
		this.updated_on = updated_on;
	}
	@Override
	public String toString() {
		return "User_Role [roleId=" + roleId + ", role=" + role + ", role_code=" + role_code + ", status=" + status
				+ ", created_on=" + created_on + ", updated_on=" + updated_on + "]";
	}
	

	
}
