package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Channel;
import com.preclaim.models.Group;
import com.preclaim.models.MessageList;
import com.preclaim.models.Region;

public class MessageDaoImpl implements MessageDao {

	@Autowired
	DataSource datasource;
	
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<Group> getActiveGrouplist() {
		try {
			String sql = "SELECT * FROM group_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Group group = new Group();
						group.setGroup_id(rs.getInt("groupId"));
						group.setGroupName(rs.getString("groupName"));
						group.setStatus(1);
						return group;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Region> getActiveRegionlist() {
		try {
			String sql = "SELECT * FROM region_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Region region = new Region();
						region.setRegionId(rs.getInt("regionId"));
						region.setRegionName(rs.getString("regionName"));
						region.setStatus(1);
						return region;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Channel> getActiveChannellist() {
		try {
			String sql = "SELECT * FROM channel_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Channel channel = new Channel();
						channel.setChannelCode(rs.getString("channelCode"));
						channel.setChannelName(rs.getString("channelName"));
						return channel;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Channel> getCategoryChannellist() {
		try {
			String sql = "SELECT * FROM category_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Channel channel = new Channel();
						return channel;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<MessageList> getMessageList(int status) {
		try
		{
			String sql = "SELECT * FROM message_list where status = " + status;
			List<MessageList> messagelist = template.query(sql, 
					(ResultSet rs, int rowCount) -> {
						MessageList message = new MessageList();
						message.setSrNo(rowCount + 1);
						message.setMsgID(rs.getInt("msgId"));
						message.setGroupId(rs.getInt("msgGroup"));
						message.setRegionId(rs.getInt("msgRegion"));
						message.setChannelId(rs.getInt("msgChannel"));
						message.setCategoryId(rs.getInt("msgCategory"));
						message.setMsgTitleEng(rs.getString("msgTitleEn"));
						message.setMsgTitleHin(rs.getString("msgTitleThai"));
						message.setCreatedDate(rs.getString("createdDate"));
						message.setExpiryDate(rs.getString("msgExpiryDate"));
						message.setStatus(rs.getInt("status"));
						return message;
					}					
					);
			return messagelist;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			return null;
		}

	}

}
