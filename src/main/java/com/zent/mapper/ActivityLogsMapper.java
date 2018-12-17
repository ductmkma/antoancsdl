package com.zent.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entity.ActivityLogs;

public class ActivityLogsMapper implements RowMapper<ActivityLogs> {

	@Override
	public ActivityLogs mapRow(ResultSet rs, int rowNum) throws SQLException {
		ActivityLogs al = new ActivityLogs();
		al.setId(rs.getInt(1));
		al.setMethod(rs.getString(2));
		al.setIpaddress(rs.getString(3));
		al.setDatabaseName(rs.getString(4));
		al.setBrowser(rs.getString(5));
		al.setOs(rs.getString(6));
		al.setServerHost(rs.getString(7));
		al.setHostName(rs.getString(8));
		al.setMachineConnect(rs.getString(9));
		al.setCreatedAt(rs.getTimestamp(10));
		al.setUpdatedAt(rs.getTimestamp(11));
		al.setDeletedAt(rs.getTimestamp(12));
		al.setUsername(rs.getString(13));
		al.setLink(rs.getString(14));
		al.setAccount(rs.getString(15));
		return al;
	}

}
