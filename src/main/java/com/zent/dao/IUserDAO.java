package com.zent.dao;

import java.util.List;

import com.zent.entity.User;

public interface IUserDAO {
	public List<User> getAll();
	public List<User> search(User user,Integer page);
	public void insert(User user);
	public void update(User user);
	public void delete(User user);
	public boolean checkLogin(User user);
	public String getFullName(User user);
	public int getUserId(User user);
	public String getPathAvata(Integer id);
	public List<User> getAuthor();
	
}
