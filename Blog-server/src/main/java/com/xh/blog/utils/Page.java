package com.xh.blog.utils;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
	//当前页
	private Integer currentPage;
	//每页显示多少条数据
	private Integer pageSize;
	//上一页
	private Integer upPage;
	//下一页
	private Integer nextPage;
	//总共多少页
	private Integer countPage;
	//总共多少条数据
	private Integer countNum;
	//首页
	private Integer firstPage;
	//尾页
	private Integer lastPage;
	//数据集合
	private List<T> list = new ArrayList<T>();
	
	
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
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
	public Integer getUpPage() {
		return upPage;
	}
	public void setUpPage(Integer upPage) {
		this.upPage = upPage;
	}
	public Integer getNextPage() {
		return nextPage;
	}
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}
	public Integer getCountPage() {
		return countPage;
	}
	public void setCountPage(Integer countPage) {
		this.countPage = countPage;
	}
	public Integer getCountNum() {
		return countNum;
	}
	public void setCountNum(Integer countNum) {
		this.countNum = countNum;
	}
	public Integer getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(Integer firstPage) {
		this.firstPage = firstPage;
	}
	public Integer getLastPage() {
		return lastPage;
	}
	public void setLastPage(Integer lastPage) {
		this.lastPage = lastPage;
	}
	
	
}
