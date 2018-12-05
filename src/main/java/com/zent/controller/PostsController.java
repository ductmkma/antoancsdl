package com.zent.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zent.dao.ICategoriesDAO;
import com.zent.dao.IPostsDAO;
import com.zent.dao.IPostsTagsDAO;
import com.zent.dao.ITagsDAO;
import com.zent.entity.Category;
import com.zent.entity.Posts;
import com.zent.entity.PostsTags;
import com.zent.entity.Tags;
import com.zent.entity.User;
import com.zent.json.PostsJsonObject;
import com.zent.utils.Constant;
import com.zent.utils.JsonResponse;
import com.zent.utils.ToSlug;
import com.zent.validator.PostsValidator;

@Controller
public class PostsController {
	private IPostsDAO postsDAO;
	private ICategoriesDAO categoriesDAO;
	private ITagsDAO tagsDAO;
	private IPostsTagsDAO postsTagsDAO;
	
	
	public IPostsTagsDAO getPostsTagsDAO() {
		return postsTagsDAO;
	}

	public void setPostsTagsDAO(IPostsTagsDAO postsTagsDAO) {
		this.postsTagsDAO = postsTagsDAO;
	}

	public ITagsDAO getTagsDAO() {
		return tagsDAO;
	}

	public void setTagsDAO(ITagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	private PostsValidator postsValidator;

	public PostsValidator getPostsValidator() {
		return postsValidator;
	}

	public void setPostsValidator(PostsValidator postsValidator) {
		this.postsValidator = postsValidator;
	}

	public ICategoriesDAO getCategoriesDAO() {
		return categoriesDAO;
	}

	public void setCategoriesDAO(ICategoriesDAO categoriesDAO) {
		this.categoriesDAO = categoriesDAO;
	}

	public IPostsDAO getPostsDAO() {
		return postsDAO;
	}

	public void setPostsDAO(IPostsDAO postsDAO) {
		this.postsDAO = postsDAO;
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String indexPost(Model model, HttpSession session) {
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			model.addAttribute("openMenuManagerPosts", "menu-open active");
			model.addAttribute("activeMenuPosts", "active");
			return "postmanager";
		}else {
			return "redirect:/login";
		}
		

	}

	// post add
	@RequestMapping(value = "/post/add", method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("userId")!=null&&session.getAttribute("userId")!="") {
			model.addAttribute("posts", new Posts());
			model.addAttribute("openMenuManagerPosts", "menu-open active");
			model.addAttribute("activeMenuPosts", "active");
			model.addAttribute("listCate", categoriesDAO.getAll());
			model.addAttribute("listUsed", categoriesDAO.getMostUserCate());
			return "postadd";
		}else {
			return "redirect:/login";
		}
		
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(postsValidator);
	}

	@RequestMapping(value = "/post/add", method = RequestMethod.POST)
	public String index1(@ModelAttribute @Validated Posts post, BindingResult result, ModelMap modelMap, Model model) {
		modelMap.addAttribute("formDataWithFile", post);
		if (result.hasErrors()) {
			model.addAttribute("listCate", categoriesDAO.getAll());
			model.addAttribute("listUsed", categoriesDAO.getMostUserCate());
			return "postadd";
		} else {
			if (post.getThumbnail().getOriginalFilename() != null && post.getThumbnail().getOriginalFilename() != ""
					&& post.getThumbnail().getSize() > 0) {
				post.setNameThumbnail(post.getThumbnail().getOriginalFilename());
				try {
					InputStream ip = post.getThumbnail().getInputStream();
					OutputStream outStream = new FileOutputStream(Constant.PATH + post.getNameThumbnail());
					byte[] buffer = new byte[8 * 1024];
					int bytesRead;
					while ((bytesRead = ip.read(buffer)) != -1) {
						outStream.write(buffer, 0, bytesRead);
					}
					outStream.close();
				} catch (Exception e) {
					e.getMessage();
				}
				postsDAO.insert(post);
				Integer maxIdPost = postsDAO.getMaxId();
				String tags = post.getTags();
				String tagsArray[] = tags.split(",");
				
				for (int i = 0; i < tagsArray.length; i++) {
					int dem=0;
					String slug = new ToSlug().toSlug(tagsArray[i]);
					for (int j = 0; j < tagsDAO.getAll().size(); j++) {
						 if(slug.equals(tagsDAO.getAll().get(j).getSlug())) {
							 dem++;
						 }
					}
					if(dem!=0) {
						 Integer idBySlugExist = tagsDAO.getIdBySlug(slug);
						 PostsTags postsTags = new PostsTags();
						 postsTags.setPostsId(maxIdPost);
						 postsTags.setTagsId(idBySlugExist);
						 postsTagsDAO.insert(postsTags);
					}else {
						 Tags tag = new Tags();
						 tag.setName(tagsArray[i]);
						 tag.setSlug(slug);
						 tagsDAO.insert(tag);
						 Integer maxIdTag = tagsDAO.getMaxIdTag();
						 PostsTags postsTags = new PostsTags();
						 postsTags.setPostsId(maxIdPost);
						 postsTags.setTagsId(maxIdTag);
						 postsTagsDAO.insert(postsTags);
					}
				}
				
				return "redirect:/post";
			}
		}
		return null;
	}

	
	//Edit
	@RequestMapping(value = "post/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Integer id,Model model, HttpSession session) {
		/*model.addAttribute("posts",new Posts());*/
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			model.addAttribute("openMenuManagerPosts", "menu-open active");
			model.addAttribute("activeMenuPosts", "active");
			Posts post = new Posts();
			post = postsDAO.getPostById(id);
			String tags="";
			for (int i = 0; i < tagsDAO.getTagsByPost(id).size(); i++) {
				tags+=tagsDAO.getTagsByPost(id).get(i).getName()+",";
			}
			post.setTags(tags);
			model.addAttribute("listCate", categoriesDAO.getAll());
			model.addAttribute("listUsed", categoriesDAO.getMostUserCate());
			model.addAttribute("posts", post);
			return "postedit";
		}else {
			return "redirect:/login";
		}
		
	}
	@RequestMapping(value = "post/edit/{id}", method = RequestMethod.POST)
	public String editsubmit(@ModelAttribute @Validated Posts post, BindingResult result,ModelMap modelMap,Model model) {
		modelMap.addAttribute("formDataWithFile", post);
		int bien = tagsDAO.getTagsByPost(post.getId()).size();
		if (result.hasErrors()) {
			model.addAttribute("listTags",tagsDAO.getTagsByPost(post.getId()));
			model.addAttribute("listCate", categoriesDAO.getAll());
			model.addAttribute("listUsed", categoriesDAO.getMostUserCate());
			Posts posts = postsDAO.getPostById(post.getId());
			model.addAttribute("postById", posts);
			return "postedit";
		} else {
			if (post.getThumbnail().getOriginalFilename() != null && post.getThumbnail().getOriginalFilename() != ""
					&& post.getThumbnail().getSize() > 0) {
				post.setNameThumbnail(post.getThumbnail().getOriginalFilename());
				try {
					InputStream ip = post.getThumbnail().getInputStream();
					OutputStream outStream = new FileOutputStream(Constant.PATH + post.getNameThumbnail());
					byte[] buffer = new byte[8 * 1024];
					int bytesRead;
					while ((bytesRead = ip.read(buffer)) != -1) {
						outStream.write(buffer, 0, bytesRead);
					}
					outStream.close();
				} catch (Exception e) {
					e.getMessage();
				}
				postsDAO.update(post);
				String tags = post.getTags();
				String tagsArray[] = tags.split(",");
				for (int i = 0; i < tagsArray.length; i++) {
					int dem=0;
					String slug = new ToSlug().toSlug(tagsArray[i]);
					List<Tags> listTags = tagsDAO.getAll();
					for (int j = 0; j < listTags.size(); j++) {
						 if(slug.equals(listTags.get(j).getSlug())) {
							 dem++;
						 }
					}
					if(dem!=0) {
						
					}else {
						 Tags tag = new Tags();
						 tag.setName(tagsArray[i]);
						 tag.setSlug(slug);
						 tagsDAO.insert(tag);
						 Integer maxIdTag = tagsDAO.getMaxIdTag();
						 PostsTags postsTags = new PostsTags();
						 postsTags.setPostsId(post.getId());
						 postsTags.setTagsId(maxIdTag);
						 postsTagsDAO.insert(postsTags);
					}
					int check=0;
					Integer idBySlug = tagsDAO.getIdBySlug(slug);
					List<Integer> list = new ArrayList<Integer>();
					for (int j = 0; j < postsTagsDAO.getAllTagsByPostId(post.getId()).size(); j++) {
						list.add(postsTagsDAO.getAllTagsByPostId(post.getId()).get(j).getTagsId());
					}
					int test=0;
					int test1=0;
					
					if(tagsArray.length < bien) {
						test1=0;
					}else if(tagsArray.length >= bien) {
						test1++;
					}
					
					for (int k = 0; k < list.size(); k++) {
						check=0;
						test=0;
						if(list.get(k).equals(idBySlug)&&test==0) {
							check++;
							test++;
						}else if(check==0&&test1!=0) {
							check=0;
						}
						if(check==0) {
							PostsTags deletePostsTags = new PostsTags();
							deletePostsTags.setPostsId(post.getId());
							deletePostsTags.setTagsId(postsTagsDAO.getAllTagsByPostId(post.getId()).get(k).getTagsId());
							postsTagsDAO.deletePostsTags(deletePostsTags);
						}
					}
					
				}
				
				return "redirect:/post";
			}
		}
		return null;
	}
	//Xóa post tạm thời
	@RequestMapping(value = "/post/delete", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody JsonResponse delete(HttpServletRequest request){
		String action = request.getParameter("action");
		JsonResponse res = new JsonResponse();
		if(action!=null&&action.equals("delete")) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			Posts post = new Posts();
			post.setId(id);
			postsDAO.deleteTemp(post);
			res.setStatus("SUCCESS");
			res.setResult(new Boolean(true));	
		}else {
			res.setStatus("FAIL");
		}
		return res;
	}
	//đọc thumbnail
	@RequestMapping(value = "/displaythumbnail/{id}", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @PathVariable("id") Integer id) throws IOException {
		String name = postsDAO.getPathThumbnail(id);
		File file = new File(Constant.PATH + name);
		response.setContentType("image/*");
		response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
		BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());

		byte[] buffer = new byte[1024];
		int bytesRead = 0;
		while ((bytesRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}
		outStream.flush();
		inStream.close();
	}
	// show list
		@RequestMapping(value = "/listposts", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
		public @ResponseBody String springPaginationDataTables(HttpServletRequest request) throws IOException {

			// Fetch the page number from client
			Integer pageNumber = 0;
			if (null != request.getParameter("iDisplayStart"))
				pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart")) / 10) + 1;

			// Fetch search parameter
			String searchParameter = request.getParameter("sSearch");

			// Fetch Page display length
			Integer pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
			Constant.pageSize = pageDisplayLength;
			Integer iDisplayStart = Integer.valueOf(request.getParameter("iDisplayStart"));
			Integer page = (iDisplayStart / pageDisplayLength) + 1;
			// Create page list data
			List<Posts> listPost = new ArrayList<Posts>();
			Posts post = new Posts();
			post.setTitle(searchParameter);
			post.setCategoriesName(searchParameter);
			listPost = postsDAO.search(post, page);

			// Here is server side pagination logic. Based on the page number you could make
			// call
			// to the data base create new list and send back to the client. For demo I am
			// shuffling
			// the same list to show data randoml

			PostsJsonObject postsJsonObject = new PostsJsonObject();
			// Set Total display record
			if (searchParameter.equals("")) {
				postsJsonObject.setiTotalDisplayRecords(postsDAO.getAll().size());
				// Set Total record
				postsJsonObject.setiTotalRecords(postsDAO.getAll().size());
			} else {
				postsJsonObject.setiTotalDisplayRecords(listPost.size());
				// Set Total record
				postsJsonObject.setiTotalRecords(listPost.size());
			}
			postsJsonObject.setAaData(listPost);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(postsJsonObject);
			// System.out.println(json2);
			return json2;
		}
}
