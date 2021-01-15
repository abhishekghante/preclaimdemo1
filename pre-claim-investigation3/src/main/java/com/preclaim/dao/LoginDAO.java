package com.preclaim.dao;

import com.preclaim.models.Login;
import com.preclaim.models.UserDetails;

public interface LoginDAO 
{
	UserDetails validateUser(Login login);
	UserDetails checkUser(String username);
	String updatePassword(String username, String password);
}
