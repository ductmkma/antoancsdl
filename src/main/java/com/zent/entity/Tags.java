package com.zent.entity;

import java.util.Date;

public class Tags {
	private int id;
	private String name;
	private String slug;
	private int count;
	private Date createdAt;
	private Date updatedAt;
	private Date deletedAt;
	
	public Tags() {
		super();
	}

	public Tags(int id, String name, String slug, int count, Date createdAt, Date updatedAt, Date deletedAt) {
		super();
		this.id = id;
		this.name = name;
		this.slug = slug;
		this.count = count;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Date getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}
	
	
}
