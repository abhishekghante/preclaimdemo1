package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Group;
import com.preclaim.models.GroupList;

public interface GroupDao {
	
	String add_group(Group group);
	List<GroupList> group_list(int status);
	String deleteGroup(int groupId);
	String updateGroup(int groupId, String group_name);
	String updateGroupStatus(int groupId,int status);
}
