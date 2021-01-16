package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Channel;
import com.preclaim.models.Group;
import com.preclaim.models.MessageList;
import com.preclaim.models.Region;

public interface MessageDao {
	
	List<Group> getActiveGrouplist();
	List<Region> getActiveRegionlist();
	List<Channel> getActiveChannellist();
	List<Channel> getCategoryChannellist();
	List<MessageList> getMessageList(int status);

}
