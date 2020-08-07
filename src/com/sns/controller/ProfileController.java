package com.sns.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.ProfileService;

@WebServlet({"/profileWrite","/profileDetail","/profileUpdateForm","/profileUpdate"})
public class ProfileController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String uri=req.getRequestURI();
		String path=req.getContextPath();
		String reqAddr=uri.substring(path.length());
		
		ProfileService service=new ProfileService(req,resp);
		
		switch(reqAddr) {
			case "/profileWrite":
				req.setCharacterEncoding("UTF-8");
				
				String id=(String) req.getSession().getAttribute("id");//id는 로그인 세션에 저장된 값을 가져옴
				System.out.println("세션에 저장된 아이디: "+id);
				String nickname=req.getParameter("nickname");
				String myBirth=req.getParameter("myBirth");
				String blood=req.getParameter("blood");
				String addr=req.getParameter("addr");
				String major=req.getParameter("major");
				String seduWay=req.getParameter("seduWay");
				String motto=req.getParameter("motto");
				String fMovie=req.getParameter("fMovie");
				
				boolean success=service.profileWrite(id,nickname,myBirth,blood,addr,major,seduWay,motto,fMovie);
				if(success) {
					resp.sendRedirect("Profile.jsp");
				}else {
					resp.sendRedirect("ProfileWrite.jsp");
				}
				break;
			
			case "/profileDetail":
				service.profileDetail();
				break;
				
			case "/profileUpdateForm":
				service.profileUpdateForm();
				break;
				
			case "/profileUpdate":
				service.profileUpdate();
				break;
		}
	}

}
