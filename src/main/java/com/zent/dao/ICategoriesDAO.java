package com.zent.dao;

import java.util.List;

import com.zent.entity.Category;

public interface ICategoriesDAO {
	public List<Category> getAll();
	public List<Category> search(Category cate,Integer page);
	public void insert(Category cate);
	public void update(Category cate);
	public void delete(Category cate);
	public Category getCategory(Integer id);
	public List<Category> getMostUserCate();
	public Category getCategoryBySlug(String slug);
	
	
}
