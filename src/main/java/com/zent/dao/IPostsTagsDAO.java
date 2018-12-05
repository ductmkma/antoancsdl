package com.zent.dao;

import java.util.List;

import com.zent.entity.PostsTags;

public interface IPostsTagsDAO {
	public void insert(PostsTags postsTags);
	public List<PostsTags> getAllTagsByPostId(Integer id);
	public void deletePostsTags(PostsTags postsTags);
}
