package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Permission;
import com.preclaim.models.UserDetails;
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

public interface UserDAO {
	
	public String create_user(UserDetails user);
	public List<UserList> user_list();
	public String deleteAdminUser(int user_id);
	public String create_role(UserRole role);
	public List<UserRole> role_lists();
	public String updateUserRole(UserRole role);	
	public String delete_role(UserRole role);
	public String updateUserStatus(int user_id, int user_status);
	public UserDetails getUserDetails(int user_id);
	public String updateUserDetails(UserDetails user_details);
	public List<Permission>	retrievePermission(int roleID);
	public String addPermission(List<String> role_permission, int roleID);
	public String accountValidate(String username);
	public String updateProfile(UserDetails user_details);
}
