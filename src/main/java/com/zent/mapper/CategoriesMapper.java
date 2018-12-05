package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.Category;

public class CategoriesMapper implements RowMapper<Category> {

	public Category mapRow(ResultSet rs, int numRow) throws SQLException {
		Category cate = new Category();
		cate.setId(rs.getInt(1));
		cate.setName(rs.getString(2));
		cate.setSlug(rs.getString(3));
		cate.setThumbnail(rs.getString(4));
		cate.setDescription(rs.getString(5));
		cate.setStatus(rs.getInt(6));
		cate.setCreatedAt(rs.getTimestamp(7));
		cate.setUpdatedAt(rs.getTimestamp(8));
		cate.setDeletedAt(rs.getTimestamp(9));
		return cate;
	}

}
