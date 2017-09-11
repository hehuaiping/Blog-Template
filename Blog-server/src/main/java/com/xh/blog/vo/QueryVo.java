package com.xh.blog.vo;

import java.io.Serializable;

public class QueryVo implements Serializable{
	//当前页
	private Integer currentPage;
	//每页显示多少条
	private Integer pageSize;
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
