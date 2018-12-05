package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.PostsTags;

public class PostsTagsMapper implements RowMapper<PostsTags> {

	public PostsTags mapRow(ResultSet rs, int rowNum) throws SQLException {
		PostsTags postsTags = new PostsTags();
		postsTags.setPostsId(rs.getInt(2));
		postsTags.setTagsId(rs.getInt(3));
		postsTags.setCreatedAt(rs.getTimestamp(4));
		postsTags.setUpdatedAt(rs.getTimestamp(5));
		postsTags.setDeletedAt(rs.getTimestamp(6));
		return postsTags;
	}

}
