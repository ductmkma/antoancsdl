package com.zent.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zent.dao.IUserDAO;
import com.zent.entity.Category;
import com.zent.entity.User;
import com.zent.json.UserJsonObject;
import com.zent.utils.Constant;
import com.zent.utils.JsonResponse;
import com.zent.utils.VerifyUtils;
import com.zent.validator.LoginValidator;

@Controller
public class UserController {
	private IUserDAO userDAO;
	private LoginValidator loginValidator;

	public LoginValidator getLoginValidator() {
		return loginValidator;
	}

	public void setLoginValidator(LoginValidator loginValidator) {
		this.loginValidator = loginValidator;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		model.addAttribute("user", new User());
		return "login";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index1(Model model, HttpSession session) {
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			model.addAttribute("user", new User());
			return "index";
		}else {
			return "redirect:/login";
		}
		
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("fullname");
		return "redirect:/login";
	}


	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(loginValidator);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginsubmit(@RequestParam("g-recaptcha-response") String recapchaResponse,@ModelAttribute("user") @Validated User user, BindingResult result, Model model,
			HttpSession session) {
		if(recapchaResponse!=null&&recapchaResponse!="") {
			if(new VerifyUtils().verify(recapchaResponse)) {
				if (result.hasErrors()) {
					return "login";
				}
				if (user != null && userDAO.checkLogin(user)) {
					session.setAttribute("fullname", userDAO.getFullName(user));
					session.setAttribute("userId", userDAO.getUserId(user));
					return "redirect:index";
				}else {
					model.addAttribute("err","Email hoặc mật khẩu không đúng.");
				}
			}
		}else {
			model.addAttribute("err","Capcha chưa đúng.");
		}
		
		return null;

	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			model.addAttribute("activeMenuUser", "active");
			return "usermanager";
		}else {
			return "redirect:/login";
		}
		

	}

	@RequestMapping(value = "/admin/add", method = RequestMethod.GET)
	public String add(Model model, HttpSession session) {
		if(session.getAttribute("fullname")!=null&&session.getAttribute("fullname")!="") {
			return "adduser";
		}else{
			return "redirect:/login";
		}
		

	}

	@RequestMapping(value = "/listuser", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
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
		List<User> listUser = new ArrayList<User>();
		User user = new User();
		user.setFullname(searchParameter);
		user.setEmail(searchParameter);
		listUser = userDAO.search(user, page);
		
		UserJsonObject personJsonObject = new UserJsonObject();
		// Set Total display record
		if (searchParameter.equals("")) {
			personJsonObject.setiTotalDisplayRecords(userDAO.getAll().size());
			// Set Total record
			personJsonObject.setiTotalRecords(userDAO.getAll().size());
		} else {
			personJsonObject.setiTotalDisplayRecords(listUser.size());
			// Set Total record
			personJsonObject.setiTotalRecords(listUser.size());
		}
		personJsonObject.setAaData(listUser);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(personJsonObject);
		// System.out.println(json2);
		return json2;
	}

	String imageName = "";

	@PostMapping("/upload")
	public @ResponseBody String fileUpload(@RequestParam("file") MultipartFile file) throws IOException {

		// Save file on system
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(
					new File(Constant.PATH, file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
			imageName = file.getOriginalFilename();
			return "uploaded";
		}
		return "";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody JsonResponse add(@ModelAttribute(value = "user") User user, BindingResult result,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String action = request.getParameter("action");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		ObjectMapper mapper = new ObjectMapper();
		JsonResponse res = new JsonResponse();
		if (action.equals("edit")) {
			try {
				ValidationUtils.rejectIfEmpty(result, "fullname", "Họ tên không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "email", "Địa chỉ email không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "phone", "Số điện thoại không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "groupId", "Nhóm không được để trống.");
				if (!(user.getEmail().equals(""))) {
					Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
							Pattern.CASE_INSENSITIVE);
					if (!(pattern.matcher(user.getEmail()).matches())) {
						result.rejectValue("email", "Email phải đúng định dạng abc@domain.xy");
					}
				}
				if (!(user.getPhone().equals(""))) {
					Pattern pattern1 = Pattern.compile("^(01[2689]|09)[0-9]{8}$", Pattern.CASE_INSENSITIVE);
					if (!(pattern1.matcher(user.getPhone()).matches())) {
						result.rejectValue("phone", "Số điện thoại chưa đúng định dạng.");
					}
				}
				if (!result.hasErrors()) {
					user.setAvatar(imageName);
					userDAO.update(user);
					res.setStatus("SUCCESS");
					res.setResult(new Boolean(true));
				} else {
					res.setStatus("FAIL");
					res.setResult(result.getAllErrors());
				}
				return res;

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} else if (action.equals("add")) {
			try {
				ValidationUtils.rejectIfEmpty(result, "fullname", "Họ tên không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "email", "Địa chỉ email không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "phone", "Số điện thoại không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "groupId", "Nhóm không được để trống.");
				if (!(user.getEmail().equals(""))) {
					Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
							Pattern.CASE_INSENSITIVE);
					if (!(pattern.matcher(user.getEmail()).matches())) {
						result.rejectValue("email", "Email phải đúng định dạng abc@domain.xy");
					}
				}
				if (!(user.getPhone().equals(""))) {
					Pattern pattern1 = Pattern.compile("^(01[2689]|09)[0-9]{8}$", Pattern.CASE_INSENSITIVE);
					if (!(pattern1.matcher(user.getPhone()).matches())) {
						result.rejectValue("phone", "Số điện thoại chưa đúng định dạng.");
					}
				}
				if (!result.hasErrors()) {
					user.setAvatar(imageName);
					userDAO.insert(user);
					res.setStatus("SUCCESS");
					res.setResult(new Boolean(true));
				} else {
					res.setStatus("FAIL");
					res.setResult(result.getAllErrors());
				}
				return res;

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		} else if (action.equals("delete")) {
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				userDAO.delete(user);
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
	@RequestMapping(value="/displayimage/{id}",method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response,@PathVariable("id") Integer id) throws IOException {
		  String name = userDAO.getPathAvata(id);
		  File file = new File(Constant.PATH+name);
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
	
	
}
