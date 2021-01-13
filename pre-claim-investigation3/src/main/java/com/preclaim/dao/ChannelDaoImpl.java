package com.preclaim.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Channel;

public class ChannelDaoImpl implements ChannelDao {
	
    @Autowired
	DataSource datasource;
	
	private JdbcTemplate template;
	
	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String create_channel(Channel channel) {	
		try 
		{
			String channelCheck="select count(*) from channel_lists where channelName='"+channel.getChannelName()+"'";
			 int channelCount=this.template.queryForObject(channelCheck, Integer.class);
			 if(channelCount==0) 
			 {
				 String query="INSERT INTO channel_lists(channelName, channelCode, level, createdBy, "
						 	+ "createdDate, updatedDate, updatedBy, status) values(?,?,?,?,?,?,?,?)";
				 template.update(query,channel.getChannelName(),channel.getChannelCode(),
						 		channel.getLevel(),channel.getCreatedBy(),channel.getCreatedDate(),
						 		channel.getUpdatedDate(),channel.getUpdatedBy(),channel.getStatus());
			
			 }else {
			         return "Channel name already exists";
		     	   }
    	}
		catch(Exception e) 
		{	
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding channel";
		}
		
		return "****";
	}

}
