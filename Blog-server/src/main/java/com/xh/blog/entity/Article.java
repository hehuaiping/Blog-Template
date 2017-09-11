package com.xh.blog.entity;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String article_id;
	//文章标题
	private String title;
	//文章内容
	private String context;
	//作者  外键
	private User auth;
	//创建时间
	private Date create_time;
	private String imgs;
	//文章状态
	private Integer state;
	//浏览次数
	private Integer views;
	//文章分类
	private Category category;
	
	
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public User getAuth() {
		return auth;
	}
	public void setAuth(User auth) {
		this.auth = auth;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	
}
