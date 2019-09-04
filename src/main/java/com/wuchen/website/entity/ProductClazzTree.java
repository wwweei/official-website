package com.wuchen.website.entity;

import java.util.List;

public class ProductClazzTree {
	private String id;
	private String text;
	private String parentId;
	private List<ProductClazzTree> children;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<ProductClazzTree> getChildren() {

		return children;
	}
	public void setChildren(List<ProductClazzTree> children) {
		this.children = children;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	
}
