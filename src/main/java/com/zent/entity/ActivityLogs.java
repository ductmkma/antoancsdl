package com.zent.entity;

import java.util.Date;

public class ActivityLogs {
	private int id;
	private String method;
	private String ipaddress;
	private String databaseName;
	private String browser;
	private String os;
	private String serverHost;
	private String hostName;
	private String machineConnect;
	private String link;
	private String username;
	private String account;
	private Date createdAt;
	private Date updatedAt;
	private Date deletedAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public String getDatabaseName() {
		return databaseName;
	}
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getServerHost() {
		return serverHost;
	}
	public void setServerHost(String serverHost) {
		this.serverHost = serverHost;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getMachineConnect() {
		return machineConnect;
	}
	public void setMachineConnect(String machineConnect) {
		this.machineConnect = machineConnect;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Date getDeletedAt() {
		return deletedAt;
	}
	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public ActivityLogs(int id, String method, String ipaddress, String databaseName, String browser, String os,
			String serverHost, String hostName, String machineConnect, String link, String username, String account,
			Date createdAt, Date updatedAt, Date deletedAt) {
		super();
		this.id = id;
		this.method = method;
		this.ipaddress = ipaddress;
		this.databaseName = databaseName;
		this.browser = browser;
		this.os = os;
		this.serverHost = serverHost;
		this.hostName = hostName;
		this.machineConnect = machineConnect;
		this.link = link;
		this.username = username;
		this.account = account;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
	}
	public ActivityLogs() {
		super();
	}
	public ActivityLogs(String method, String ipaddress, String databaseName, String browser, String os,
			String serverHost, String hostName, String machineConnect, String link, String username, String account) {
		super();
		this.method = method;
		this.ipaddress = ipaddress;
		this.databaseName = databaseName;
		this.browser = browser;
		this.os = os;
		this.serverHost = serverHost;
		this.hostName = hostName;
		this.machineConnect = machineConnect;
		this.link = link;
		this.username = username;
		this.account = account;
	}
	
	
	
	
}
