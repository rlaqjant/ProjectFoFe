package com.sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.ManageService;

@WebServlet("/upload")
public class ManageController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri  = req.getRequestURI();
		String ctx = req.getContextPath();
		String reqAddr = uri.substring(ctx.length());
		
		
		ManageService service = new ManageService();
		
		switch (reqAddr) {
		case "/upload":
			
			System.out.println("업로드 요청");
			service.upload(req);
			break;

		
		}
		
		
	}
	

	
}
