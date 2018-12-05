package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.Tags;

public class TagsMapper implements RowMapper<Tags> {

	public Tags mapRow(ResultSet rs, int numRow) throws SQLException {
		Tags tag = new Tags();
		tag.setId(rs.getInt(1));
		tag.setName(rs.getString(2));
		tag.setSlug(rs.getString(3));
		tag.setCount(rs.getInt(4));
		tag.setCreatedAt(rs.getTimestamp(5));
		tag.setUpdatedAt(rs.getTimestamp(6));
		tag.setDeletedAt(rs.getTimestamp(7));
		return tag;
	}

}
