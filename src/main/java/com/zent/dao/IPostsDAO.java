package com.zent.dao;

import java.util.List;

import com.zent.entity.Posts;

public interface IPostsDAO {
	public List<Posts> getAll();
	public List<Posts> search(Posts post,Integer page);
	public void insert(Posts post);
	public void update(Posts post);
	public void deleteTemp(Posts post);
	public void deleted(Posts post);
	public String getPathThumbnail(Integer id);
	public int getMaxId();
	public Posts getPostById(Integer id);
	public Long getCount(String keyWord);
	public Posts getPost(String slug);
	public Integer getIdBySlug(String slug);
	public void updateView(Integer view, Integer id);
	public List<Posts> topView();
	public List<Posts> lastedPost();
	public List<Posts> searchShow(Posts post,Integer page);
	public List<Posts> getPostByCategory(String slug);
	public Long getCountAuthor(Integer id);
	
	
}
