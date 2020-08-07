package com.sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sns.dao.ManageDAO;
import com.sns.dto.ManageDTO;
import com.sns.service.ManageService;

@WebServlet({"/manageUpload","/manageUpload1","/manageUpload2"})
public class ManageController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String url = uri.substring(ctx.length());
		RequestDispatcher dis = null;
		req.getSession().setAttribute("loginId", "tester");
		req.setCharacterEncoding("UTF-8");
		
		ManageService service = new ManageService();
		
		switch (url) {
		case "/manageUpload":
			System.out.println("프로필 사진 업로드 요청");
			String msg = "저장 실패";
			String page = "manage.jsp";
			HashMap<String, Object> map = service.select(req);
			for(String key : map.keySet()) {
				System.out.println("키 :  값 : "+ key  +"/ " +  map.get(key));
			}
			String filename = (String) map.get("filename");
			boolean success = (boolean) map.get("success");
			System.out.println(filename);
			
			if(!success) {
				System.out.println("파일이 하나도 없다");
				ManageDTO dto = service.upload(req);
				ManageDAO dao = new ManageDAO();
				System.out.println("컨트롤러로 이동");
				if(dao.profileWrite(dto)) {
					msg = "저장 성공";
					System.out.println(msg);
				}
				req.setAttribute("newfilename", dto.getNewFileName());
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
				
			}else{
				System.out.println("파일이 있다");
				//원래 파일 삭제
				File file = new File("C:/upload/" +filename);
				if(file.exists()) {
					if(file.delete()){
						System.out.println("파일삭제 성공");
					}else{ System.out.println("파일삭제 실패");
					}
				}else{
					System.out.println("파일이 존재하지 않습니다.");
				}
				
				//새로만들 파일 업로드
				ManageDTO dto = service.upload(req);
				ManageDAO dao = new ManageDAO();
				System.out.println("컨트롤러로 이동");
				if(dao.profileWrite(dto)) {
					msg = "저장 성공";
					System.out.println(msg);
				}
				req.setAttribute("newfilename", dto.getNewFileName());
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
			}
			
			break;
			
			
		case "/manageUpload1":
			System.out.println("대문 사진 업로드 요청");
			msg = "저장 실패";
			page = "manage.jsp";
			map= service.select1(req);
			for(String key : map.keySet()) {
				System.out.println("키 :  값 : "+ key  +"/ " +  map.get(key));
			}
			filename = (String) map.get("filename");
			success = (boolean) map.get("success");
			System.out.println("원래 파일 이름 : "+  filename);
			
			if(!success) {
				System.out.println("파일이 하나도 없다");
				ManageDTO dto = service.upload1(req);
				ManageDAO dao = new ManageDAO();
				System.out.println("컨트롤러로 이동");
				if(dao.profileWrite1(dto)) {
					msg = "저장 성공";
					System.out.println(msg);
				}
				req.setAttribute("newfilename", dto.getNewFileName());
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
				
			}else{
				System.out.println("파일이 있다");
				//원래 파일 삭제
				File file = new File("C:/upload/" +filename);
				if(file.exists()) {
					if(file.delete()){
						System.out.println("파일삭제 성공");
					}else{ System.out.println("파일삭제 실패");
					}
				}else{
					System.out.println("파일이 존재하지 않습니다.");
				}
				
				//새로만들 파일 업로드
				ManageDTO dto = service.upload1(req);
				ManageDAO dao = new ManageDAO();
				System.out.println("컨트롤러로 이동");
				if(dao.profileWrite1(dto)) {
					msg = "저장 성공";
					System.out.println(msg);
				}
				req.setAttribute("newfilename", dto.getNewFileName());
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
			}
			
			break;

		
		}
		
		
	}
			
	
	
		
	}

	
	
	
