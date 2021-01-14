package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Channel;
import com.preclaim.models.ChannelList;

public class ChannelDaoImpl implements ChannelDao {
	
    @Autowired
	DataSource datasource;
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String create_channel(Channel channel) {	
		try 
		{
			String channelCheck = "SELECT count(*) FROM channel_lists WHERE channelCode='" + 
					channel.getChannelCode()+"'";
			 int channelCount = this.template.queryForObject(channelCheck, Integer.class);
			 if(channelCount == 0) 
			 {
				 String query="INSERT INTO channel_lists(channelName, channelCode, level, createdBy, "
						 	+ "createdDate, updatedDate, updatedBy, status) values(?,?,?,?,now(),now(),?,?)";
				 template.update(query, channel.getChannelName(), channel.getChannelCode(), channel.getLevel(),
						 		channel.getCreatedBy(), channel.getUpdatedBy(), channel.getStatus());			
			 }
			 else 
			         return "Channel name already exists";
    	}
		catch(Exception e) 
		{	
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding channel";
		}
		
		return "****";
	}

	@Override
	public List<ChannelList> channel_list(int status) {
		String query = "SELECT * FROM channel_lists WHERE status=" + status;
		return template.query(query, (ResultSet rs, int rowNum) -> {
			ChannelList channelList = new ChannelList();
			channelList.setSrNo(rowNum + 1);
			channelList.setChannelName(rs.getString("channelName"));
			channelList.setChannelCode(rs.getString("channelCode"));
			channelList.setCreatedDate(rs.getString("createdDate"));
			channelList.setStatus(rs.getInt("status"));
			return channelList;
		});
		
	}

	@Override
	public String deleteChannel(String channelCode) {
		try
		{
			String sql = "DELETE FROM channel_lists where channelCode = ?";
			template.update(sql, channelCode);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error deleting channel. Kindly contact system administrator";
		}

		return "Channel deleted successfully";
	}

	@Override
	public String updateChannel(String channelName, String channelCode) {
		try
		{
			String sql = "UPDATE channel_lists SET channelName = ?, updatedDate = now() where channelCode = ?";
			template.update(sql, channelName, channelCode);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error updating channel. Kindly contact system administrator";
		}
		return "Channel updated successfully";
	}
}
