package com.sns.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.service.MemberService;

@WebServlet({"/join","/login","/logout","/idCheck"})
public class MemberController extends HttpServlet {

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
		
		MemberService service=new MemberService();
		RequestDispatcher rd=null;
		
		switch(reqAddr) {
			case "/join":
				req.setCharacterEncoding("UTF-8");
				String id=req.getParameter("id");
				String pw=req.getParameter("pw");
				String name=req.getParameter("name");
				String email=req.getParameter("email");
				String phone=req.getParameter("phone");
				System.out.println(id+pw+name+email+phone);
				boolean success=service.join(id,pw,name,email,phone);
				if(success) {
					resp.sendRedirect("login.jsp");
				}else {
					resp.sendRedirect("joinForm.jsp");
				}
				break;
				
			case "/login":
				id=req.getParameter("id");
				pw=req.getParameter("pw");
				
				String page="login.jsp";
				String msg="아이디와 비밀번호를 확인해주세요.";
				if(service.login(id,pw)) {
					page="main.jsp";
					msg="로그인에 성공했습니다.";
					req.getSession().setAttribute("id", id);
				}
				req.setAttribute("loginId", id);
				req.setAttribute("msg", msg);
				rd=req.getRequestDispatcher(page);
				rd.forward(req, resp);
				break;
				
			case "/logout":
				req.getSession().removeAttribute("id");
				resp.sendRedirect("login.jsp");
				msg="로그아웃 성공했습니다.";
				break;
				
			case "/idCheck":
				id=req.getParameter("id");
				resp.getWriter().println(service.idCheck(id));
				break;
		}
	}

}
