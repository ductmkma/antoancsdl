package com.zent.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entity.Category;
import com.zent.entity.User;
import com.zent.mapper.CategoriesMapper;
import com.zent.mapper.CategoriesMostUsedMapper;
import com.zent.mapper.UserMapper;
import com.zent.utils.Constant;
import com.zent.utils.Security;

public class CategoriesDAO implements ICategoriesDAO {
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

	public List<Category> getAll() {
		String sql = "SELECT * FROM MINHDUC.categories where deleted_at is null and status=1";
		List<Category> listCate = jdbcTemplateObject.query(sql,new CategoriesMapper());
		return listCate;
	}

	public List<Category> search(Category cate, Integer page) {
		String sql = "select * from (select a.*, ROWNUM rnum from (select * from MINHDUC.CATEGORIES order by id asc) a where rownum <= "+(((page-1)*Constant.PAGE_SIZE_ADMIN)+Constant.PAGE_SIZE_ADMIN)+" and deleted_at is null";
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		Integer count = -1;
		if (cate.getName() != "") {
			count++;
			map.put(count, "%" + cate.getName() + "%");
			sql += " AND (name LIKE ? ";
		}

		if (cate.getSlug() != null) {
			count++;
			map.put(count, "%" + cate.getSlug() + "%");
			sql += " OR slug LIKE ? ) ";
		}

		Object[] args = new Object[count + 1];

		if (count < 0)
			args = new Object[] {};
		else {
			for (Integer key : map.keySet()) {
				args[key] = map.get(key);
			}
		}

		sql += " ) WHERE rnum >= "+ ((page-1)*Constant.PAGE_SIZE_ADMIN+1);
		List<Category> listCate = jdbcTemplateObject.query(sql, args, new CategoriesMapper());
		return listCate;
	}

	public void insert(Category cate) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[4];
		obj[0] = cate.getName();
		obj[1] = cate.getSlug();
		obj[2] = cate.getDescription();
		obj[3] = cate.getStatus();
		String sql  = "INSERT INTO MINHDUC.categories(name,slug,description,status,created_at) values (?,?,?,?,SYSDATE + interval '14' MINUTE)";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void update(Category cate) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[5];
		obj[0] = cate.getName();
		obj[1] = cate.getSlug();
		obj[2] = cate.getDescription();
		obj[3] = cate.getStatus();
		obj[4] = cate.getId();
		String sql = "UPDATE MINHDUC.categories SET NAME = ?,SLUG=?,DESCRIPTION=?,STATUS=?,UPDATED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void delete(Category cate) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[1];
		obj[0] = cate.getId();
		String sql = "UPDATE MINHDUC.categories SET DELETED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public Category getCategory(Integer id) {
		Category cate = new Category();
		Object[] obj = new Object[1];
		obj[0] = id;
		String sql = "SELECT * FROM MINHDUC.categories WHERE ID = ?";
		cate = jdbcTemplateObject.queryForObject(sql, new CategoriesMapper(), obj);
		return cate;
	}

	public List<Category> getMostUserCate() {
		//String sql = "SELECT c.id,c.name,count(c.id) dem FROM MINHDUC.posts p, MINHDUC.categories c where p.categories_id = c.id GROUP BY c.id HAVING dem>5";
		String sql = "SELECT c.id,c.name FROM MINHDUC.posts p, MINHDUC.categories c where p.categories_id = c.id";
		List<Category> listCate = jdbcTemplateObject.query(sql,new CategoriesMostUsedMapper());
		return listCate;
	}
	public Category getCategoryBySlug(String slug) {
		Category cate = new Category();
		Object[] obj = new Object[1];
		obj[0] = slug;
		String sql = "SELECT * FROM MINHDUC.categories WHERE slug = ?";
		cate = jdbcTemplateObject.queryForObject(sql, new CategoriesMapper(), obj);
		return cate;
	}
}
