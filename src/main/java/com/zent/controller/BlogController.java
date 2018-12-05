package com.zent.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zent.dao.ICategoriesDAO;
import com.zent.dao.IPostsDAO;
import com.zent.dao.ITagsDAO;
import com.zent.dao.IUserDAO;
import com.zent.entity.Posts;
import com.zent.utils.Constant;

@Controller
public class BlogController {
	private IUserDAO userDAO;
	private IPostsDAO postsDAO;
	private ITagsDAO tagsDAO;
	private ICategoriesDAO categoriesDAO;
	
	
	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public ICategoriesDAO getCategoriesDAO() {
		return categoriesDAO;
	}

	public void setCategoriesDAO(ICategoriesDAO categoriesDAO) {
		this.categoriesDAO = categoriesDAO;
	}

	public ITagsDAO getTagsDAO() {
		return tagsDAO;
	}

	public void setTagsDAO(ITagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	public IPostsDAO getPostsDAO() {
		return postsDAO;
	}

	public void setPostsDAO(IPostsDAO postsDAO) {
		this.postsDAO = postsDAO;
	}
	@RequestMapping(value = "/{slug}", method = RequestMethod.GET)
	public String index(@PathVariable("slug") String slug, Model model, HttpSession session,HttpServletRequest request) {
		Posts post = postsDAO.getPost(slug);
		postsDAO.updateView(post.getViewCount()+1, post.getId());
		model.addAttribute("listTag", tagsDAO.getTagsByPost(post.getId()));
		model.addAttribute("listCate", categoriesDAO.getAll());
		model.addAttribute("listTags", tagsDAO.getAll());
		model.addAttribute("listPost", postsDAO.getAll());
		model.addAttribute("topView",postsDAO.topView());
		model.addAttribute("lastestPost",postsDAO.lastedPost());
		model.addAttribute("author",userDAO.getAuthor());
		model.addAttribute("post",post);
		return "blogdetail";
	}
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String indexPost(Model model, HttpSession session,HttpServletRequest request) {
		String search = request.getParameter("search");
		Integer page = (request.getParameter("page")!=null?Integer.parseInt(request.getParameter("page")):1);
		List<Posts> listPost = new ArrayList<Posts>();
		Posts post = new Posts();
		post.setTitle("");
		Long count=0l;
		if (search == null||search.isEmpty()) {
			listPost = postsDAO.searchShow(post, page);
			count = postsDAO.getCount("");
		} else {
			post.setTitle(search);
			listPost = postsDAO.searchShow(post, page);
			count = postsDAO.getCount(search);
		}
		model.addAttribute("page", Math.ceil(Double.parseDouble(count.toString())/Constant.PAGE_SIZE));
		if(page!=null){
			int currentPage = page;
			model.addAttribute("currentPage", currentPage);
		}else if(page==null){
			model.addAttribute("defaultPage", 1);
		}
		model.addAttribute("listPosts", listPost);
		model.addAttribute("topView",postsDAO.topView());
		model.addAttribute("lastestPost",postsDAO.lastedPost());
		model.addAttribute("author",userDAO.getAuthor());
		return "blog";
	}
	@RequestMapping(value = "/categories/{slug}", method = RequestMethod.GET)
	public String indexCate(@PathVariable("slug") String slug,Model model, HttpSession session,HttpServletRequest request) {
		model.addAttribute("CategoriesName",categoriesDAO.getCategoryBySlug(slug));
		model.addAttribute("listPostByCategory",postsDAO.getPostByCategory(slug));
		model.addAttribute("topView",postsDAO.topView());
		model.addAttribute("lastestPost",postsDAO.lastedPost());
		model.addAttribute("author",userDAO.getAuthor());
		return "category";
	}
	@RequestMapping(value = "/author/{id}", method = RequestMethod.GET)
	public String indexAuthor(@PathVariable("id") Integer id,Model model, HttpSession session,HttpServletRequest request) {
		model.addAttribute("countPost",postsDAO.getCountAuthor(id));
		return "category";
	}
}
