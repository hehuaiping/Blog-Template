package com.xh.blog.utils;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class UploadData implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String[] src;

	public String[] getSrc() {
		return src;
	}

	public void setSrc(String[] src) {
		this.src = src;
	}
	
}
