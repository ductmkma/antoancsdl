package com.zent.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entity.PostsTags;
import com.zent.entity.Tags;
import com.zent.mapper.PostsTagsMapper;
import com.zent.mapper.TagsMapper;

public class PostsTagsDAO implements IPostsTagsDAO{
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
	public void insert(PostsTags postsTags) {
		Object[] obj = new Object[2];
		obj[0] = postsTags.getPostsId();
		obj[1] = postsTags.getTagsId();
		String sql  = "INSERT INTO MINHDUC.posts_tags(posts_id,tags_id,created_at) values (?,?,SYSDATE + interval '14' MINUTE)";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public List<PostsTags> getAllTagsByPostId(Integer id) {
		String sql = "select * from MINHDUC.posts_tags where deleted_at is null and posts_id ="+id;
		List<PostsTags> listPostsTags = jdbcTemplateObject.query(sql,new PostsTagsMapper());
		return listPostsTags;
	}

	public void deletePostsTags(PostsTags postsTags) {
		Object[] obj = new Object[2];
		obj[0] = postsTags.getPostsId();
		obj[1] = postsTags.getTagsId();
		String sql = "UPDATE MINHDUC.posts_tags SET DELETED_AT= SYSDATE + interval '14' MINUTE WHERE posts_id = ? and tags_id=?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	
	
	
}
