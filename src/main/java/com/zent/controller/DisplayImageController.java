package com.zent.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zent.dao.IUserDAO;
import com.zent.utils.Constant;

@Controller
public class DisplayImageController {
	private IUserDAO userDAO;
	
	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(value="/displaythumbnail/{id}",method = RequestMethod.GET)
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
