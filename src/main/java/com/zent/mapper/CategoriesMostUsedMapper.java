package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.Category;

public class CategoriesMostUsedMapper implements RowMapper<Category> {

	public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
		Category cate = new Category();
		cate.setId(rs.getInt("id"));
		cate.setName(rs.getString("name"));
		return cate;
	}

}
