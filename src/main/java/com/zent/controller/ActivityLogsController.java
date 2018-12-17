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
import com.zent.json.ActivityLogsJsonObject;
import com.zent.json.TagsJsonObject;
import com.zent.utils.Constant;
import com.zent.utils.JsonResponse;

@Controller
public class ActivityLogsController {
	private IActivityLogs activityDAO;

	public IActivityLogs getActivityDAO() {
		return activityDAO;
	}

	public void setActivityDAO(IActivityLogs activityDAO) {
		this.activityDAO = activityDAO;
	}

	@RequestMapping(value = "/activitylogs", method = RequestMethod.GET)
	public String index(Model model, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("fullname") != null && session.getAttribute("fullname") != "") {
			model.addAttribute("activeMenuActivity", "active");
			ActivityLogs al = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(),
					activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request),
					activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(),
					activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
			activityDAO.insert(al);
			return "activityhistory";
		} else {
			return "redirect:/login";
		}

	}

	// show list
	@RequestMapping(value = "/listactivitylogs", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String springPaginationDataTables(HttpServletRequest request, HttpSession session)
			throws IOException {

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
		List<ActivityLogs> listal = new ArrayList<ActivityLogs>();
		ActivityLogs al = new ActivityLogs();
		al.setUsername(searchParameter);
		al.setIpaddress(searchParameter);
		listal = activityDAO.search(al, page);

		// Here is server side pagination logic. Based on the page number you
		// could make
		// call
		// to the data base create new list and send back to the client. For
		// demo I am
		// shuffling
		// the same list to show data randoml

		ActivityLogsJsonObject ActivityLogsJsonObject = new ActivityLogsJsonObject();
		// Set Total display record
		if (searchParameter.equals("")) {
			ActivityLogsJsonObject.setiTotalDisplayRecords(activityDAO.getAll().size());
			// Set Total record
			ActivityLogsJsonObject.setiTotalRecords(activityDAO.getAll().size());
		} else {
			ActivityLogsJsonObject.setiTotalDisplayRecords(listal.size());
			// Set Total record
			ActivityLogsJsonObject.setiTotalRecords(listal.size());
		}
		ActivityLogsJsonObject.setAaData(listal);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(ActivityLogsJsonObject);
		ActivityLogs al1 = new ActivityLogs(activityDAO.getMethod(request), activityDAO.getIpAddress(),
				activityDAO.getDataBaseName(), activityDAO.getBrowser(request), activityDAO.getOs(request),
				activityDAO.getServerHost(), activityDAO.getHostName(), activityDAO.getMachineConnect(),
				activityDAO.getLink(request), String.valueOf(session.getAttribute("fullname")),activityDAO.getAccount());
		activityDAO.insert(al1);
		return json2;
	}
}
