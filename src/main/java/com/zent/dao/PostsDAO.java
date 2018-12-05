package com.zent.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entity.Posts;
import com.zent.mapper.PostsMapper;
import com.zent.utils.Constant;
public class PostsDAO implements IPostsDAO {
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
	public List<Posts> getAll() {
		String sql = "select p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id and c.status = 1 order by p.id asc";
		List<Posts> listPost = jdbcTemplateObject.query(sql,new PostsMapper());
		return listPost;
	}

	public List<Posts> search(Posts post, Integer page) {
		String sql = "select * from (select a.*, ROWNUM rnum from (select p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id and c.status = 1 order by p.id asc) a where rownum <= "+(((page-1)*Constant.PAGE_SIZE_ADMIN)+Constant.PAGE_SIZE_ADMIN);
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		Integer count = -1;
		if (post.getTitle() != "") {
			count++;
			map.put(count, "%" + post.getTitle() + "%");
			sql += " AND ( title LIKE ? ";
		}
		if (post.getCategoriesName() != "") {
			count++;
			map.put(count, "%" + post.getCategoriesName() + "%");
			sql += " OR name LIKE ? ) ";
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
		List<Posts> listPost = jdbcTemplateObject.query(sql, args, new PostsMapper());
		return listPost;
	}
	public List<Posts> searchShow(Posts post, Integer page) {
		String sql = "select * from (select a.*, ROWNUM rnum from (select p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id and c.status = 1 order by p.id asc) a where rownum <= "+(((page-1)*Constant.PAGE_SIZE)+Constant.PAGE_SIZE);
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		Integer count = -1;
		if (post.getTitle() != "") {
			count++;
			map.put(count, "%" + post.getTitle() + "%");
			sql += " AND title LIKE ? ";
		}
		Object[] args = new Object[count + 1];

		if (count < 0)
			args = new Object[] {};
		else {
			for (Integer key : map.keySet()) {
				args[key] = map.get(key);
			}
		}
		sql += " ) WHERE rnum >= "+ ((page-1)*Constant.PAGE_SIZE+1);
		List<Posts> listPost = jdbcTemplateObject.query(sql, args, new PostsMapper());
		return listPost;
	}
	
	public void insert(Posts post) {
		Object[] obj = new Object[9];
		obj[0] = post.getTitle();
		obj[1] = post.getSlug();
		obj[2] = post.getNameThumbnail();
		obj[3] = post.getDescription();
		obj[4] = post.getContent();
		obj[5] = post.getStatus();
		obj[6] = post.getUserId();
		obj[7] = post.getCategoriesId();
		obj[8] = 0; //view count
		String sql  = "INSERT INTO MINHDUC.posts(title,slug,thumbnail,description,content,status,user_id,categories_id,view_count,created_at) values (?,?,?,?,?,?,?,?,?,SYSDATE + interval '14' MINUTE)";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void update(Posts post) {
		Object[] obj = new Object[9];
		obj[0] = post.getTitle();
		obj[1] = post.getSlug();
		obj[2] = post.getNameThumbnail();
		obj[3] = post.getDescription();
		obj[4] = post.getContent();
		obj[5] = post.getStatus();
		obj[6] = post.getCategoriesId();
		obj[7] = post.getViewCount();
		obj[8] = post.getId();
		String sql = "UPDATE MINHDUC.posts SET TITLE=?,SLUG=?,THUMBNAIL=?,DESCRIPTION=?,CONTENT=?,STATUS=?,CATEGORIES_ID=?,VIEW_COUNT=?,CREATED_AT=SYSDATE + interval '14' MINUTE  WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void deleteTemp(Posts post) {
		Object[] obj = new Object[1];
		obj[0] = post.getId();
		String sql = "UPDATE MINHDUC.posts SET DELETED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public void deleted(Posts post) {
		// TODO Auto-generated method stub
		
	}

	public String getPathThumbnail(Integer id) {
		Object[] args = new Object[1];
		args[0] = id;
		String sql = "SELECT thumbnail FROM MINHDUC.posts WHERE id=?";
		String filename = (String) jdbcTemplateObject.queryForObject(sql, args, String.class);
		return filename;
		
	}

	public int getMaxId() {
		String sql = "SELECT max(id) FROM MINHDUC.posts";
		Integer maxId = (Integer) jdbcTemplateObject.queryForObject(sql, Integer.class);
		return maxId;
	}

	public Posts getPostById(Integer id) {
		Object[] args = new Object[1];
		args[0] = id;
		String sql = "SELECT p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id and p.id=?";
		Posts posts = (Posts) jdbcTemplateObject.queryForObject(sql,args, new PostsMapper());
		return posts;
	}

	public Long getCount(String keyWord) {
		String sql = "SELECT COUNT(*) FROM MINHDUC.posts WHERE title LIKE '%"+keyWord+"%'";
		Long count = (Long)jdbcTemplateObject.queryForObject(sql, Long.class);
		return count;
	}

	public Posts getPost(String slug) {
		Object[] args = new Object[1];
		args[0] = slug;
		String sql = "SELECT p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id and p.slug = ?";
		Posts posts = (Posts) jdbcTemplateObject.queryForObject(sql,args, new PostsMapper());
		return posts;
	}

	public Integer getIdBySlug(String slug) {
		String sql = "SELECT id FROM MINHDUC.posts WHERE deleted_at is null and slug ="+slug;
		Integer id = (Integer)jdbcTemplateObject.queryForObject(sql, Integer.class);
		return id;
	}

	public void updateView(Integer view, Integer id) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[2];
		obj[0] = view;
		obj[1] = id;
		String sql = "UPDATE MINHDUC.posts SET VIEW_COUNT=?,UPDATED_AT= SYSDATE + interval '14' MINUTE WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	public List<Posts> topView() {
		String sql = "SELECT * FROM (SELECT p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id ORDER BY p.view_count) where ROWNUM <= 5 ";
		List<Posts> listPost = jdbcTemplateObject.query(sql,new PostsMapper());
		return listPost;
	}

	public List<Posts> lastedPost() {
		String sql = "SELECT * FROM (SELECT p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id ORDER BY p.created_at ) where ROWNUM <= 4";
		List<Posts> listPost = jdbcTemplateObject.query(sql,new PostsMapper());
		return listPost;
	}

	public List<Posts> getPostByCategory(String slug) {
		String sql = "SELECT p.id,p.title,p.slug,p.thumbnail,p.description,p.status,p.content,p.view_count,c.name,c.id as categories_id,u.id as user_id,u.fullname,p.created_at FROM MINHDUC.posts p,MINHDUC.categories c, MINHDUC.users u WHERE p.categories_id = c.id and p.deleted_at is null and p.user_id = u.id and p.categories_id = c.id and c.slug ='"+slug+"'";
		List<Posts> listPost = jdbcTemplateObject.query(sql,new PostsMapper());
		return listPost;
	}

	public Long getCountAuthor(Integer id) {
		String sql = "select count(user_id) FROM MINHDUC.posts WHERE deleted_at is null and user_id ="+id;
		Long count = (Long)jdbcTemplateObject.queryForObject(sql, Long.class);
		return count;
	}
	
	
}
