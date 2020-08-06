package com.sns.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.dao.DiaryDAO;


	
public class DiaryService {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	 
	
	public DiaryService(HttpServletRequest req,HttpServletResponse resp) {
		this.req= req; //이거랑 저거랑 연결시켜준다는 의미로 보자//컨트롤러는 서비스한테 일을 시켜야하는데 컨트롤러에서만 상속을 받았기때문에 
		this.resp= resp;
	}

	//다이어리 쓰기 
	public void write() throws Exception {
		
		//서비스는 DB를 사용할지 생각한다.
		//다이어리는 파라미터를 입력받아서 DB에 넣어야하기때문에 DB를 연결해야한다.
		DiaryDAO dao = new DiaryDAO();//dao객체화
		req.setCharacterEncoding("utf-8");
		String subject = req.getParameter("subject");//넣는애들만 넣을거고 sql에서 자동으로 들어가는 부분따로 그리고 걔네 다 채워서 나중에 글에 다 띄워준다.
		String content = req.getParameter("content");
		String page = "diarylist.jsp";//성공해도 실패해도 여기로간다.
		String msg ="게시글 작성에 실패하였습니다.";
		if(dao.write(subject,content)) {//1.dao에게 일시키기//2. 받아온값이 true면 
			
			msg="게시글작성에 성공하였습니다.";
		}
		req.setAttribute("msg", msg);//msg변수에 msg내용을 실어 보낸다.
		RequestDispatcher dis =  req.getRequestDispatcher(page);
		dis.forward(req, resp);//dis에게 담아보낸다.
	}
	
	
	
	
	
	

}
