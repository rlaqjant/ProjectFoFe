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


@WebServlet({"/albumupload", "/albumlist"})

public class AlbumController extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String url = uri.substring(ctx.length());
		RequestDispatcher dis = null;
		req.setCharacterEncoding("UTF-8");
		
		AlbumService service = new AlbumService(req);
		
		switch(url) {
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
			
		case "/albumlist":
			String obj=service.list();
			resp.setContentType("text/html; charset=UTF-8"); 
			resp.getWriter().println(obj);
			break;
		}
	}
	
}
