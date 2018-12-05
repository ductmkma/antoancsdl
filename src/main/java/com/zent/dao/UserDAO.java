package com.zent.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entity.User;
import com.zent.mapper.UserMapper;
import com.zent.utils.Constant;
import com.zent.utils.Security;


public class UserDAO implements IUserDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	
	

	public DataSource getDataSoure() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}



	public JdbcTemplate getJdbcTemplateObject() {
		return jdbcTemplateObject;
	}



	public void setJdbcTemplateObject(JdbcTemplate jdbcTemplateObject) {
		this.jdbcTemplateObject = jdbcTemplateObject;
	}

	public List<User> getAll() {
		String sql = "SELECT * FROM MINHDUC.users";
		List<User> listUser = jdbcTemplateObject.query(sql,new UserMapper());
		return listUser;
	}

	public List<User> search(User user, Integer page) {
// and email like '%%' and fullname like '%%' ) where rnum >= 1 

		String sql = "select * from (select a.*, ROWNUM rnum from (select * from MINHDUC.USERS order by id asc) a where rownum <= "+(((page-1)*Constant.PAGE_SIZE_ADMIN)+Constant.PAGE_SIZE_ADMIN)+" and deleted_at is null";
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		Integer count = -1;
		if (user.getFullname() != "") {
			count++;
			map.put(count, "%" + user.getFullname() + "%");
			sql += " AND (FULLNAME LIKE ? ";
		}

		if (user.getEmail() != "") {
			count++;
			map.put(count, "%" + user.getEmail() + "%");
			sql += " OR email LIKE ? ) ";
		}

		Object[] args = new Object[count + 1];

		if (count < 0)
			args = new Object[] {};
		else {
			for (Integer key : map.keySet()) {
				args[key] = map.get(key);
			}
		}
		
		sql+= " ) WHERE rnum >= "+ ((page-1)*Constant.PAGE_SIZE_ADMIN+1);
		List<User> users = jdbcTemplateObject.query(sql, args, new UserMapper());
		return users;
	}

	public void insert(User user) {
		Object[] obj = new Object[7];
		obj[0] = user.getFullname();
		obj[1] = user.getEmail();
		String email = user.getEmail();
		String arr[] = email.split("\\@");
		obj[2] = new Security().md5(arr[0]);
		obj[3] = user.getGroupId();
		obj[4] = 1;//status
		obj[5] = user.getPhone();
		obj[6] = user.getAvatar();
		String sql  = "INSERT INTO MINHDUC.users(fullname,email,password,group_id,status,phone,avatar,created_at) values (?,?,?,?,?,?,?,SYSDATE + interval '14' MINUTE)";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void update(User user) {
		Object[] obj = new Object[6];
		obj[0] = user.getFullname();
		obj[1] = user.getEmail();
		String email = user.getEmail();
		obj[2] = user.getGroupId();
		obj[3] = user.getPhone();
		obj[4] = user.getAvatar();
		obj[5] = user.getId();
		String sql = "UPDATE MINHDUC.users SET FULLNAME = ?,EMAIL=?,GROUP_ID=?,PHONE=?,AVATAR=?,UPDATED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void delete(User user) {
		Object[] obj = new Object[1];
		obj[0] = user.getId();
		String sql = "UPDATE MINHDUC.users SET DELETED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}
	public boolean checkLogin(User user) {
		Object[] args = new Object[2];
		args[0] = user.getEmail();
		args[1] = new Security().md5(user.getPassword());
		String sql = "SELECT * FROM MINHDUC.users WHERE group_id=1 and email=? and password=? ";
		List<User> users = jdbcTemplateObject.query(sql, args, new UserMapper());
		if (!users.isEmpty()) {
			return true; 
		}
		return false;
	}

	public String getFullName(User user) {
		Object[] args = new Object[2];
		args[0] = user.getEmail();
		args[1] = new Security().md5(user.getPassword());
		String sql = "SELECT fullname FROM MINHDUC.users WHERE email=? and password=?";
		String fullname = (String) jdbcTemplateObject.queryForObject(sql, args, String.class);
		return fullname;
	}

	public String getPathAvata(Integer id) {
		Object[] args = new Object[1];
		args[0] = id;
		String sql = "SELECT avatar FROM MINHDUC.users WHERE id=?";
		String filename = (String) jdbcTemplateObject.queryForObject(sql, args, String.class);
		return filename;
	}

	public int getUserId(User user) {
		Object[] args = new Object[2];
		args[0] = user.getEmail();
		args[1] = new Security().md5(user.getPassword());
		String sql = "SELECT id FROM MINHDUC.users WHERE email=? and password=?";
		Integer userId = (Integer) jdbcTemplateObject.queryForObject(sql, args, Integer.class);
		return userId;
	}

	public List<User> getAuthor() {
		String sql = "select * from MINHDUC.users where deleted_at is null and status =1 and group_id = 1";
		List<User> listUser = jdbcTemplateObject.query(sql,new UserMapper());
		return listUser;
	}

	
}
