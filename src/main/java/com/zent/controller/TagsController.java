package com.zent.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zent.dao.IActivityLogs;
import com.zent.dao.ITagsDAO;
import com.zent.entity.ActivityLogs;
import com.zent.entity.Tags;
import com.zent.entity.User;
import com.zent.json.TagsJsonObject;
import com.zent.utils.Constant;
import com.zent.utils.JsonResponse;

@Controller
public class TagsController {
	private ITagsDAO tagsDAO;
	private IActivityLogs activityDAO;

	public IActivityLogs getActivityDAO() {
		return activityDAO;
	}

	public void setActivityDAO(IActivityLogs activityDAO) {
		this.activityDAO = activityDAO;
	}

	public ITagsDAO getTagsDAO() {
		return tagsDAO;
	}

	public void setTagsDAO(ITagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	@RequestMapping(value = "/tag", method = RequestMethod.GET)
	public String index(Model model, HttpSession session,HttpServletRequest request) {
		if (session.getAttribute("fullname") != null && session.getAttribute("fullname") != "") {
			model.addAttribute("openMenuManagerPosts", "menu-open active");
			model.addAttribute("activeMenuTags", "active");
			ActivityLogs al = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(), activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request), activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(), activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
			activityDAO.insert(al);
			return "tagsmanager";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = "/tag", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody JsonResponse add(@ModelAttribute(value = "tags") Tags tag, BindingResult result,
			HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String action = request.getParameter("action");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		JsonResponse res = new JsonResponse();
		if (action.equals("edit")) {
			try {
				ValidationUtils.rejectIfEmpty(result, "name", "Tags Name is required.");
				if (!result.hasErrors()) {
					tagsDAO.update(tag);
					ActivityLogs al = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(), activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request), activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(), activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
					activityDAO.insert(al);
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
				ValidationUtils.rejectIfEmpty(result, "name", "Tags Name is required.");
				if (!result.hasErrors()) {
					tagsDAO.insert(tag);
					ActivityLogs al = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(), activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request), activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(), activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
					activityDAO.insert(al);
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
				if (!result.hasErrors()) {
					tagsDAO.delete(tag);
					ActivityLogs al = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(), activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request), activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(), activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
					activityDAO.insert(al);
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

	// show list
	@RequestMapping(value = "/listtags", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String springPaginationDataTables(HttpServletRequest request,HttpSession session) throws IOException {

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
		List<Tags> listTags = new ArrayList<Tags>();
		Tags tag = new Tags();
		tag.setName(searchParameter);
		listTags = tagsDAO.searchTags(tag, page);

		// Here is server side pagination logic. Based on the page number you
		// could make
		// call
		// to the data base create new list and send back to the client. For
		// demo I am
		// shuffling
		// the same list to show data randoml

		TagsJsonObject tagsJsonObject = new TagsJsonObject();
		// Set Total display record
		if (searchParameter.equals("")) {
			tagsJsonObject.setiTotalDisplayRecords(tagsDAO.getAll().size());
			// Set Total record
			tagsJsonObject.setiTotalRecords(tagsDAO.getAll().size());
		} else {
			tagsJsonObject.setiTotalDisplayRecords(listTags.size());
			// Set Total record
			tagsJsonObject.setiTotalRecords(listTags.size());
		}
		tagsJsonObject.setAaData(listTags);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(tagsJsonObject);
		ActivityLogs al = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(), activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request), activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(), activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
		activityDAO.insert(al);
		return json2;
	}
}
