package com.sns.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		AlbumDAO dao = new AlbumDAO();
		
		String msg = "";
		String page = "";

		switch(url) {
			//사진 업로드
			case "/albumupload":

			msg = "저장 실패";
			page = "Albumlist.jsp";
			dao = new AlbumDAO();
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
				System.out.println("replyList 요청");
				page = "AlbumReply.jsp";
				dto = new AlbumDTO();
				dto.setAlbumidx(Integer.parseInt(req.getParameter("albumIdx")));
				
				ArrayList<AlbumDTO> replyList = dao.replyList(dto);
				System.out.println(replyList);
				req.setAttribute("replyList", replyList);
				
				// 댓글 보여줄 페이지에서 사용할 앨범 idx 정보 같이 넘겨줌
				req.setAttribute("albumIdx", dto.getReplyIdx());
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
				break;

			//사진첩 댓글달기
			case "/albumReply":
				System.out.println("albumReply 요청");
				msg = "저장 실패";
				page = "AlbumReply.jsp";
				dto = service.reply();
				if(dto == null) {
					msg = "에러 발생";
				} else {
					if (dao.replyWrite(dto)) {
						msg = "저장 성공";
					}
				}
				System.out.println("[댓글 작성 " + msg + "] " + dto);
				
				// 댓글 보여줄 페이지에서 사용할 앨범 idx 정보 같이 넘겨줌
				req.setAttribute("albumIdx", dto.getReplyIdx());
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
				break;
				
			//사진첩 댓글 삭제
			case "/replyDel":
				System.out.println("replyDel 요청");
				msg = "삭제 실패";
				page = "AlbumReply.jsp";
				dto = new AlbumDTO();
				dto.setReplyIdx(Integer.parseInt(req.getParameter("replyIdx")));
				if (dao.replyDelete(dto)) {
					msg = "삭제 성공";
				}
				
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
				break;
				
			//사진첩 댓글 수정
			case "/replyUpdate":
				break;
			}
	}
	
}
