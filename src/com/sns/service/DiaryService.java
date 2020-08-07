package com.sns.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.dao.DiaryDAO;
import com.sns.dto.DiaryDTO;

import sun.rmi.server.Dispatcher;


	
public class DiaryService {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	 
	
	public DiaryService(HttpServletRequest req,HttpServletResponse resp) {
		this.req= req; //이거랑 저거랑 연결시켜준다는 의미로 보자//컨트롤러는 서비스한테 일을 시켜야하는데 컨트롤러에서만 상속을 받았기때문에 
		this.resp= resp;
	}
			DiaryDAO dao = new DiaryDAO();//dao객체화,전역변수
	//다이어리 쓰기 
	public void write() throws Exception {
		
		//서비스는 DB를 사용할지 생각한다.
		//다이어리는 파라미터를 입력받아서 DB에 넣어야하기때문에 DB를 연결해야한다.
		
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

	public void list() throws ServletException, IOException {
		//DB를 사용할지
		//데이터를 넣는게아니라 불러오는 부분이라 파라미터를 보낼 필요가 없다.
		ArrayList<DiaryDTO> list = dao.list();//1.db에 일 시키기 2. dao에서 컨트롤러로 보낸 list 받기
		req.setAttribute("list", list);//변수 list에 받은 list값을 넣어준다.
		RequestDispatcher dis = req.getRequestDispatcher("diarylist.jsp");//어딜 목표로 갈건지. dispatcher은 항해자라는 뜻  
		dis.forward(req, resp);//list라는 정보를 붙여서 보냈다. 그럼이제 그걸 띄워줘야함.
		
		
		
	}
	
	//글 상세보기
	public void detail() throws ServletException, IOException {
		//DB에서 값을 가져온다. 
		//1.db가 필요한 일인지 생각해본다.2. 파라미터를 받아서 보내야하는지 생각해본다. 
		String idx = req.getParameter("idx");//값자체를 주지를 않았는데 어떻게 파라미터를 불러오지...? sql문 ?대응 idx값.. 이걸 불러와서 dao한테 준비물줘야되는데.
		System.out.println("불러온 파라미터:"+idx);
		DiaryDAO dao = new DiaryDAO();//다이어리객체화
		req.setAttribute("diary", dao.detail(idx));//1.dao한테 보낸다. 2. 얘네를 담아서 view에 보낸다.-> view는 뽑아서 띄워준다.
		RequestDispatcher dis = req.getRequestDispatcher("diaryDetail.jsp");//여기로보낼거야
		dis.forward(req, resp);
		
		
		
		
		
	}

	
}
