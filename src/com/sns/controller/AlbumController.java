package com.sns.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.dao.AlbumDAO;
import com.sns.dto.AlbumDTO;
import com.sns.service.AlbumService;


@WebServlet({"/albumupload","/albumlist","/replyList","/albumReply","/replyDel","/replyUpdate"})
public class AlbumController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}


	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String url = uri.substring(ctx.length());
		
		RequestDispatcher dis = null;//민식이형 스톼일. 컨트롤러에서
		req.getSession().setAttribute("loginId", "tester");//로그인 구현한게 아니여서 임의로 넣어준 것. 세션에 저장
		req.setCharacterEncoding("UTF-8");
		
		AlbumService service = new AlbumService(req);

		switch(url) {
		//사진 업로드
		case "/albumupload":

			String msg = "저장 실패";
			String page = "Albumlist.jsp";
			AlbumDAO dao = new AlbumDAO();
			AlbumDTO dto = service.upload();
			if(dao.write(dto)) {
				msg = "저장 성공";
			}
			req.setAttribute("msg", msg);
			dis=req.getRequestDispatcher(page);
			dis.forward(req, resp);
			break;

		//사진첩 댓글 불러오기
		case "/replyList":
			break;
		
		//사진첩 댓글달기
		case "/albumReply":
			System.out.println("albumReply 요청");
			dao = new AlbumDAO();//객체만 미리 생성
			dto = service.reply();

//			dao.reply(dto);

			
			break;
						
		//사진첩 댓글 삭제
		case "/replyDel":
			break;
			
		//사진첩 댓글 수정
		case "/replyUpdate":

		case "/albumlist":
			String obj=service.list();
			resp.setContentType("text/html; charset=UTF-8"); 
			resp.getWriter().println(obj);

			break;
		}
	}
	
}
