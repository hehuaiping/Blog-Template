package com.xh.blog.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	// 用户id
	private Long user_id;
	// 用户名
	private String user_name;
	// 用户密码
	private String user_password;
	// 用户邮箱
	private String user_email;
	// 用户生日
	private String user_birthday;
	// 用户昵称
	private String user_nick;
	// 用户创建时间
	private Timestamp user_create_time;
	// 用户手机号码
	private String user_phone;
	// 用户地址
	private String user_address;
	// 用户描述
	private String description;
	// 用户头像
	private String head_photo;
	// 最后登录时间
	private Date last_time;
	// 最后登录IP
	private String last_ip;
	//用户状态
	private Integer user_state;
		


	public Integer getUser_state() {
		return user_state;
	}

	public void setUser_state(Integer user_state) {
		this.user_state = user_state;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public Timestamp getUser_create_time() {
		return user_create_time;
	}

	public void setUser_create_time(Timestamp user_create_time) {
		this.user_create_time = user_create_time;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHead_photo() {
		return head_photo;
	}

	public void setHead_photo(String head_photo) {
		this.head_photo = head_photo;
	}

	public Date getLast_time() {
		return last_time;
	}

	public void setLast_time(Date last_time) {
		this.last_time = last_time;
	}

	public String getLast_ip() {
		return last_ip;
	}

	public void setLast_ip(String last_ip) {
		this.last_ip = last_ip;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_email=" + user_email + ", user_birthday=" + user_birthday + ", user_nick=" + user_nick
				+ ", user_create_time=" + user_create_time + ", user_phone=" + user_phone + ", user_address="
				+ user_address + ", description=" + description + ", head_photo=" + head_photo + ", last_time="
				+ last_time + ", last_ip=" + last_ip + "]";
	}
	
	
}
