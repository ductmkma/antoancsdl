package com.zent.entity;

import java.util.Date;

public class PostsTags {
	private int postsId;
	private int tagsId;
	private Date createdAt;
	private Date deletedAt;
	private Date updatedAt;
	
	public PostsTags() {
		super();
	}

	public PostsTags(int postsId, int tagsId, Date createdAt, Date deletedAt, Date updatedAt) {
		super();
		this.postsId = postsId;
		this.tagsId = tagsId;
		this.createdAt = createdAt;
		this.deletedAt = deletedAt;
		this.updatedAt = updatedAt;
	}

	public int getPostsId() {
		return postsId;
	}

	public void setPostsId(int postsId) {
		this.postsId = postsId;
	}

	public int getTagsId() {
		return tagsId;
	}

	public void setTagsId(int tagsId) {
		this.tagsId = tagsId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
