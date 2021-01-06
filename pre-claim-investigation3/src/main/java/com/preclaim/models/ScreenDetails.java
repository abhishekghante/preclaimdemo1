package com.preclaim.models;

public class ScreenDetails {

	private String screen_name;
	private String screen_title;
	private String user_id;
	private String user_name;
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getScreen_title() {
		return screen_title;
	}
	public void setScreen_title(String screen_title) {
		this.screen_title = screen_title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "ScreenDetails [screen_name=" + screen_name + ", screen_title=" + screen_title + ", user_id=" + user_id
				+ ", user_name=" + user_name + "]";
	}
	
	
}
