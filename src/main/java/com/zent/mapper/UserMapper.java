package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.User;

public class UserMapper implements RowMapper<User> {

	public User mapRow(ResultSet rs, int numRow) throws SQLException {
		User user  = new User();
		user.setId(rs.getInt(1));
		user.setFullname(rs.getString(2));
		user.setEmail(rs.getString(3));
		user.setPassword(rs.getString(4));
		user.setGroupId(rs.getInt(5));
		user.setStatus(rs.getInt(6));
		user.setPhone(rs.getString(7));
		user.setAvatar(rs.getString(8));
		user.setCreatedAt(rs.getTimestamp(9));
		user.setUpdatedAt(rs.getTimestamp(10));
		user.setDeletedAt(rs.getTimestamp(11));
		return user;
	}
	

}
