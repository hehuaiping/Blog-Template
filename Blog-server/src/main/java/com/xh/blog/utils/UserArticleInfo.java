package com.xh.blog.utils;

import java.io.Serializable;
import java.util.List;

import com.xh.blog.entity.Article;

public class UserArticleInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	//总共写过多少博文
	private Integer countAte;
	//最近写的博文
	private List<Article> recentlyAte;
	//阅读最多的博文
	private List<Article> readMostAte;
	
	public Integer getCountAte() {
		return countAte;
	}
	public void setCountAte(Integer countAte) {
		this.countAte = countAte;
	}
	public List<Article> getRecentlyAte() {
		return recentlyAte;
	}
	public void setRecentlyAte(List<Article> recentlyAte) {
		this.recentlyAte = recentlyAte;
	}
	public List<Article> getReadMostAte() {
		return readMostAte;
	}
	public void setReadMostAte(List<Article> readMostAte) {
		this.readMostAte = readMostAte;
	}
	
	
}
