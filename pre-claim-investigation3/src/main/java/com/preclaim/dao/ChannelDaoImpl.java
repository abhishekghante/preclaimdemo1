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
		
		try {
			String query="insert into channel_lists(channelName,channelCode,level,createdBy,createdDate,updatedDate,updatedBy,status) values(?,?,?,?,?,?,?,?)";
			int channel_status=this.template.update(query,channel.getChannelName(),channel.getChannelCode(),channel.getLevel(),channel.getCreatedBy(),channel.getCreatedDate(),channel.getUpdatedDate(),channel.getUpdatedBy(),channel.getStatus());
			
		}catch(Exception e) {
	
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding channel";
		}
		
		return "****";
	}

}
