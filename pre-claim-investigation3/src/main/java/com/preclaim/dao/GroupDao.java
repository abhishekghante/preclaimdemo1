package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Group;
import com.preclaim.models.GroupList;

public interface GroupDao {
	
public String add_group(Group group);
public List<GroupList> pending_list();
public List<GroupList> active_list();

}
