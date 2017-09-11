package com.xh.blog.entity;

import java.io.Serializable;

public class Category implements Serializable {

	private static final long serialVersionUID = 1681084671929094507L;
	// 分类ID
	private Integer category_id;
	// 分类代码
	private Integer category_code;
	// 分类名称
	private String category_name;

	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public Integer getCategory_code() {
		return category_code;
	}

	public void setCategory_code(Integer category_code) {
		this.category_code = category_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public Category() {
	}
}
