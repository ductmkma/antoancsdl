package com.zent.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zent.entity.ActivityLogs;


public interface IActivityLogs {
	public List<ActivityLogs> getAll();
	public List<ActivityLogs> search(ActivityLogs al, Integer page);
	public void insert(ActivityLogs al);
	public String getMethod(HttpServletRequest request);
	public String getDataBaseName();
	public String getBrowser(HttpServletRequest request);
	public String getOs(HttpServletRequest request);
	public String getServerHost();
	public String getHostName();
	public String getMachineConnect();
	public String getIpAddress();
	public String getLink(HttpServletRequest request);
	public String getAccount();
	
}
