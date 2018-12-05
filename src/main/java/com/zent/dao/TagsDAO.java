package com.zent.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entity.Category;
import com.zent.entity.Tags;
import com.zent.mapper.CategoriesMapper;
import com.zent.mapper.TagsMapper;
import com.zent.utils.Constant;
import com.zent.utils.Security;

public class TagsDAO implements ITagsDAO {
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

	public List<Tags> getAll() {
		String sql = "SELECT * FROM MINHDUC.tags where deleted_at is null";
		List<Tags> listTags = jdbcTemplateObject.query(sql,new TagsMapper());
		return listTags;
	}

	public List<Tags> searchTags(Tags tag, Integer page) {
		String sql = "select * from (select a.*, ROWNUM rnum from (select * from MINHDUC.TAGS order by id asc) a where rownum <= "+(((page-1)*Constant.PAGE_SIZE_ADMIN)+Constant.PAGE_SIZE_ADMIN)+" and deleted_at is null";
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		Integer count = -1;
		if (tag.getName() != "") {
			count++;
			map.put(count, "%" + tag.getName() + "%");
			sql += " AND (name LIKE ? ";
		}

		if (tag.getSlug() != null) {
			count++;
			map.put(count, "%" + tag.getSlug() + "%");
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
		List<Tags> listTags = jdbcTemplateObject.query(sql, args, new TagsMapper());
		return listTags;
	}

	public void insert(Tags tag) {
		Object[] obj = new Object[2];
		obj[0] = tag.getName();
		obj[1] = tag.getSlug();
		String sql  = "INSERT INTO MINHDUC.tags(name,slug,created_at) values (?,?,SYSDATE + interval '14' MINUTE)";
		jdbcTemplateObject.update(sql,obj);
	}

	public void update(Tags tag) {
		Object[] obj = new Object[3];
		obj[0] = tag.getName();
		obj[1] = tag.getSlug();
		obj[2] = tag.getId();
		String sql = "UPDATE MINHDUC.tags SET NAME = ?, SLUG = ?,UPDATED_AT=SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void delete(Tags tag) {
		Object[] obj = new Object[1];
		obj[0] = tag.getId();
		String sql = "UPDATE MINHDUC.tags SET DELETED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
	}

	public int getMaxIdTag() {
		String sql = "SELECT max(id) FROM MINHDUC.tags";
		Integer maxIdTag = (Integer) jdbcTemplateObject.queryForObject(sql, Integer.class);
		return maxIdTag;
	}

	public int getIdBySlug(String slug) {
		String sql = "SELECT id FROM MINHDUC.tags where slug='"+slug+"'";
		Integer idBySlug = (Integer) jdbcTemplateObject.queryForObject(sql, Integer.class);
		return idBySlug;
	}

	public List<Tags> getTagsByPost(Integer id) {
		String sql = "SELECT t.* FROM MINHDUC.posts p,MINHDUC.tags t,MINHDUC.posts_tags pt where p.id= pt.posts_id and t.id = pt.tags_id and pt.deleted_at is null and p.id = ?";
		Object[] obj = new Object[1];
		obj[0] = id;
		List<Tags> listTags = jdbcTemplateObject.query(sql, obj,new TagsMapper());
		return listTags;
	}

}
