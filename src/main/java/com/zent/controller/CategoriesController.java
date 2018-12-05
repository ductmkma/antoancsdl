package com.zent.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zent.dao.ICategoriesDAO;
import com.zent.entity.Category;
import com.zent.json.CategoriesJsonObject;
import com.zent.utils.Constant;
import com.zent.utils.JsonResponse;
import com.zent.validator.CategoryValidator;

@Controller
public class CategoriesController {
	private ICategoriesDAO categoriesDAO;
	private CategoryValidator categoryValidator;
	
	public CategoryValidator getCategoryValidator() {
		return categoryValidator;
	}

	public void setCategoryValidator(CategoryValidator categoryValidator) {
		this.categoryValidator = categoryValidator;
	}

	public ICategoriesDAO getCategoriesDAO() {
		return categoriesDAO;
	}

	public void setCategoriesDAO(ICategoriesDAO categoriesDAO) {
		this.categoriesDAO = categoriesDAO;
	}

	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			model.addAttribute("openMenuManagerPosts", "menu-open active");
			model.addAttribute("activeMenuCategories", "active");
			return "categoriesmanager";
		}else {
			return "redirect:/login";
		}
		

	}
	@RequestMapping(value = "categories/add", method = RequestMethod.GET)
	public String cate(Model model, HttpSession session) {
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			model.addAttribute("category", new Category());
			model.addAttribute("openMenuManagerPosts", "menu-open active");
			model.addAttribute("activeMenuCategories", "active");
			return "categoriesadd";
		}else {
			return "redirect:/login";
		}
		

	}
	//Thêm  mới danh mục
	 @InitBinder
	   protected void initBinder(WebDataBinder binder) {
	      binder.addValidators(categoryValidator);
	 }
	@RequestMapping(value = "categories/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("category") @Validated Category cate,BindingResult result, Model model ,HttpSession session) {
		if(result.hasErrors()) {
			return "categoriesadd";
		}else if(cate!=null) {
			categoriesDAO.insert(cate);
			return "redirect:/categories";
		}
		return null;

	}
	//Edit categories
	@RequestMapping(value = "categories/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Integer id,Model model, HttpSession session) {
		Category cate = new Category();
		cate = categoriesDAO.getCategory(id);
		model.addAttribute("category", cate);
		model.addAttribute("openMenuManagerPosts", "menu-open active");
		model.addAttribute("activeMenuCategories", "active");
		return "categoriesedit";
	}
	@RequestMapping(value = "categories/edit/{id}", method = RequestMethod.POST)
	public String editsubmit(@ModelAttribute("category") @Validated Category cate,BindingResult result, Model model ,HttpSession session) {
		if(result.hasErrors()) {
			return "categoriesedit";
		}else if(cate!=null) {
			categoriesDAO.update(cate);
			return "redirect:/categories";
		}
		return null;
	}
	
	//Delete categories
	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody JsonResponse add(@ModelAttribute(value = "category") Category cate, BindingResult result,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String action = request.getParameter("action");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		JsonResponse res = new JsonResponse();
		if (action.equals("delete")) {
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				categoriesDAO.delete(cate);
				if (!result.hasErrors()) {
					res.setStatus("SUCCESS");
					res.setResult(new Boolean(true));
				} else {
					res.setStatus("FAIL");
					res.setResult(result.getAllErrors());
				}
				return res;
			} catch (Exception e1) { // TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return null;
	}
	//show list
	@RequestMapping(value = "/listcate", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
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
		List<Category> listCate = new ArrayList<Category>();
		Category cate = new Category();
		cate.setName(searchParameter);
		listCate = categoriesDAO.search(cate, page);

		// Here is server side pagination logic. Based on the page number you could make
		// call
		// to the data base create new list and send back to the client. For demo I am
		// shuffling
		// the same list to show data randoml

		CategoriesJsonObject CateJsonObject = new CategoriesJsonObject();
		// Set Total display record
		if (searchParameter.equals("")) {
			CateJsonObject.setiTotalDisplayRecords(categoriesDAO.getAll().size());
			// Set Total record
			CateJsonObject.setiTotalRecords(categoriesDAO.getAll().size());
		} else {
			CateJsonObject.setiTotalDisplayRecords(listCate.size());
			// Set Total record
			CateJsonObject.setiTotalRecords(listCate.size());
		}
		CateJsonObject.setAaData(listCate);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(CateJsonObject);
		// System.out.println(json2);
		return json2;
	}
}
