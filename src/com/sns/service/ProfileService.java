package com.sns.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.dao.ProfileDAO;

public class ProfileService {
	
	HttpServletRequest req=null;
	HttpServletResponse resp=null;
	public ProfileService(HttpServletRequest req, HttpServletResponse resp) {
		this.req=req;
		this.resp=resp;
	}

	public void profileWrite() throws IOException {
		ProfileDAO dao=new ProfileDAO();
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
		
		String page="ProfileWrite.jsp";
		if(dao.profileWrite(id,nickname,myBirth,blood,addr,major,seduWay,motto,fMovie)) {
			page="Profile.jsp";
		}		
		resp.sendRedirect(page);
		System.out.println(page);
		
	}

}
