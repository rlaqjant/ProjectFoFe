package com.sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.FollowService;


@WebServlet({"/memberSearch", "/loadFollowList", "/follow", "/unFollow" })
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
			
			case "/loadFollowList":
			System.out.println("팔로우 목록 가져오기");
			followService.loadFollowList();
			break;
			
			case "/follow":
			System.out.println("팔로우 요청");
			followService.follow();
			break;
			
			case "/unFollow":
			System.out.println("언팔로우 요청");
			followService.unFollow();
			break;
			
			
		}
	}

}