package com.zent.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Posts {
	private int id;
	private String title;
	private String slug;
	private MultipartFile thumbnail;
	private String nameThumbnail;
	private String description;
	private String content;
	private int status;
	private int userId;
	private String username;
	private int categoriesId;
	private String categoriesName;
	private int viewCount;
	private Date createdAt;
	private Date updatedAt;
	private Date deletedAt;
	private String tags;
	
	public Posts() {
		super();
	}
	public Posts(int id, String title, String slug, MultipartFile thumbnail, String nameThumbnail, String description,
			String content, int status, int userId, String username, int categoriesId, String categoriesName,
			int viewCount, Date createdAt, Date updatedAt, Date deletedAt, String tags) {
		super();
		this.id = id;
		this.title = title;
		this.slug = slug;
		this.thumbnail = thumbnail;
		this.nameThumbnail = nameThumbnail;
		this.description = description;
		this.content = content;
		this.status = status;
		this.userId = userId;
		this.username = username;
		this.categoriesId = categoriesId;
		this.categoriesName = categoriesName;
		this.viewCount = viewCount;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
		this.tags = tags;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSlug() {
		return slug;
	}
	public void setSlug(String slug) {
		this.slug = slug;
	}
	public MultipartFile getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getNameThumbnail() {
		return nameThumbnail;
	}
	public void setNameThumbnail(String nameThumbnail) {
		this.nameThumbnail = nameThumbnail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getCategoriesId() {
		return categoriesId;
	}
	public void setCategoriesId(int categoriesId) {
		this.categoriesId = categoriesId;
	}
	public String getCategoriesName() {
		return categoriesName;
	}
	public void setCategoriesName(String categoriesName) {
		this.categoriesName = categoriesName;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	
	
	
	
	
	
	
	
}
