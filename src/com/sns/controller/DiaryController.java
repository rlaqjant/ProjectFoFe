package com.sns.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.DiaryService;

@WebServlet({"/diaryWrite","/diaryList","/diaryDetail","/diaryUpdate","/diaryDelete"})//글쓰기,목록,상세보기,글수정,삭제
public class DiaryController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			process(req,resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			process(req,resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

		//컨트롤러에서 해야 할 일
		//webservelet (v)
		//get/post방식 오버라이드 해오기. (v)
		//uri에서 contextpath빼고 Addr만들어서 
		//switch문에 넣어서 적용하기 
	
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uri = req.getRequestURI();//uri
		String ctx = req.getContextPath();//context
		String addr = uri.substring(ctx.length());//uri에서 ctx길이만큼 빼기 
		
		
		DiaryService service = new DiaryService(req, resp);//객체생성
		switch(addr) {
		case"/diaryWrite":
			System.out.println("다이어리쓰기");
			service.write();//서비스한테 일을 시킨다.
			break;
		case"/diaryList":
			
			break;
		case"/diaryDetail":
	
			break;
		case"/diaryUpdate":
	
			break;
		case"/diaryDelete":
	
			break;
	
		
		
		}
		
	}
		
	
	
	
}
