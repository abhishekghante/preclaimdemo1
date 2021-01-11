package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.User_Role;

public interface UserDAO {
	
	public List<User_Role> role_lists();
	public String create_user();

}
