package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.Posts;

public class PostsMapper implements RowMapper<Posts>{

	public Posts mapRow(ResultSet rs, int numRow) throws SQLException {
		Posts post = new Posts();
		post.setId(rs.getInt("id"));
		post.setTitle(rs.getString("title"));
		post.setSlug(rs.getString("slug"));
		post.setNameThumbnail(rs.getString("thumbnail"));
		post.setDescription(rs.getString("description"));
		post.setContent(rs.getString("content"));
		post.setStatus(rs.getInt("status"));
		post.setUserId(rs.getInt("user_id"));
		post.setUsername(rs.getString("fullname"));
		post.setCategoriesId(rs.getInt("categories_id"));
		post.setCategoriesName(rs.getString("name"));
		post.setViewCount(rs.getInt("view_count"));
		post.setCreatedAt(rs.getTimestamp("created_at"));
		return post;
	}

}
