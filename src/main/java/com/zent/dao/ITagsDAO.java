package com.zent.dao;

import java.util.List;

import com.zent.entity.Tags;

public interface ITagsDAO {
	public List<Tags> getAll();
	public List<Tags> searchTags(Tags tag, Integer page);
	public void insert(Tags tag);
	public void update(Tags tag);
	public void delete(Tags tag);
	public int getMaxIdTag();
	public int getIdBySlug(String slug);
	public List<Tags> getTagsByPost(Integer id);
}
