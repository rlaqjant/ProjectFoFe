package com.sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.FollowService;


@WebServlet({"/memberSearch"})
public class FollowController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String reqAddr = uri.substring(context.length());
		
		FollowService followService = new FollowService(req,resp);
		
		switch (reqAddr) {
		case "/memberSearch":
			System.out.println("검색 요청");
			followService.memberSearch();
			break;

		}
	}

}
