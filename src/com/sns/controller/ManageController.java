package com.sns.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.ManageService;

@WebServlet("/manageUpload")
public class ManageController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ManageService service = new ManageService();
		String uploadpath = service.upload(req);
		req.setAttribute("path", uploadpath);
		RequestDispatcher dis = req.getRequestDispatcher("manage.jsp");
		dis.forward(req, resp);
		
	}
			
	
	
		
	}

	
	
	
