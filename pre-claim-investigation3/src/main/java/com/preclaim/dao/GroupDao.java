package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Group;
import com.preclaim.models.GroupList;

public interface GroupDao {
	
public String add_group(Group group);
public List<GroupList> group_list(int status);
public String deleteGroup(int groupId);
public String updateGroup(int groupId, String group_name);
}
