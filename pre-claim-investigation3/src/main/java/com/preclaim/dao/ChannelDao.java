package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Channel;
import com.preclaim.models.ChannelList;

public interface ChannelDao {

	public String create_channel(Channel channel);
	public List<ChannelList> channel_list(int status);
	public String deleteChannel(int channelId);
	public String updateChannel(String channelName, String channelCode);
	public String updateChannelStatus(int channelId,int status);
	
}
