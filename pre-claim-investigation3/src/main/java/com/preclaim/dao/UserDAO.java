package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.UserDetails;
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

public interface UserDAO {
	
	public List<UserRole> role_lists();
	public String create_user(UserDetails user);
	public String create_role(UserRole role);
	public String delete_role(UserRole role);
	public List<UserList> user_list();
}
