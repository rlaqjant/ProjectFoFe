package com.sns.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.GuestBookService;

@WebServlet({"/guestBookList","/guestbookWright"})
public class GuestBookController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) {
		String uri = req.getRequestURI();//URI 가져오기 (URI는 URL상위 개념으로 해당파일의 위치를 알려줌. 여기서는 모든 디렉토리 나타남)
		String context = req.getContextPath();//context 가져오기
		String reqAddr = uri.substring(context.length());
		
		GuestBookService guestBookService = new GuestBookService();
		
		RequestDispatcher dis = null;
		
		switch (reqAddr) {
		case "/guestBookList":
			String homephost = req.getParameter("homephost");
			System.out.println("방명록 띄울 미니홈피 주인 아이디 : "+homephost);
			break;

		case "/guestbookWright":
			
			break;
		}
		
		
	}

}
