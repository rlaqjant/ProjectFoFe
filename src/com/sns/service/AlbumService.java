package com.sns.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.sns.dao.AlbumDAO;
import com.sns.dto.AlbumDTO;
import com.sns.dto.ReplyDTO;

public class AlbumService {

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public AlbumService(HttpServletRequest req,HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	/* 사진 업로드 */
	public AlbumDTO upload() {
		
		int maxSize = 10*1024*1024;//사진 용량 제한
		
		String root = "../MVC_STUDY/ProjectFoFe/";
		String newFileName = "";
		String uploadPath = root+"upload";
		System.out.println(uploadPath);
		System.out.println(System.getProperty("user.dir"));
		File dir = new File(uploadPath);
		if(!dir.exists()) {
			System.out.println("해당 폴더가 없음, 생성");
			dir.mkdir();
		}
		
		AlbumDTO dto = new AlbumDTO();
		try {

			//파일 업로드할 때 form action
			//MultipartRequest 는 예외처리가 필요해서 try=catch문을 사용함.
			MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "utf-8");
			
			//dto를 이용하여 게시물 정보 저장
			dto.setId((String) req.getSession().getAttribute("loginId"));
			dto.setAlbumcontent(multi.getParameter("content"));
			String ext = null;
			String oriFileName = multi.getFilesystemName("uploadFile");
			if(oriFileName == null) {
				oriFileName = "noneimage.png";
				newFileName = "noneimage.png";
			}else {
				System.out.println("원본 파일 이름 : " + oriFileName);
				ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				System.out.println("확장자 확인" + ext);
				newFileName = System.currentTimeMillis() + ext;
				System.out.println(oriFileName +"- > " + newFileName);
			}
			
			File oldName = new File(uploadPath+"/"+oriFileName);
			File newName = new File(uploadPath+"/"+newFileName);
			oldName.renameTo(newName);
			dto.setAlbumOriFileName(oriFileName);
			System.out.println(dto.getAlbumOriFileName());
			dto.setAlbumNewFileName(newFileName);
			System.out.println(dto.getAlbumNewFileName());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	public void list() throws IOException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int page = Integer.parseInt(req.getParameter("page"));
		System.out.println();
		Gson gson = new Gson();
		ArrayList<AlbumDTO> list = null;
		AlbumDAO dao = new AlbumDAO();
		int allcnt = dao.listcnt();
		list = dao.list(page);
		map.put("list", list);
		if(page == 1) {map.put("allcnt", allcnt);}
		String obj = gson.toJson(map);
		System.out.println(obj);
		resp.setContentType("text/html; charset=UTF-8");
		resp.getWriter().println(obj);
	}

	
	
	/* 댓글 작성 */
	public ReplyDTO reply() {
		ReplyDTO dto = new ReplyDTO();
		try {
			//dto를 이용하여 댓글 정보 저장
			dto.setAlbumidx(Integer.parseInt(req.getParameter("albumIdx")));
			dto.setReplyLevel(req.getParameter("replyLevel"));
			dto.setReplyRef(req.getParameter("replyRef"));
			dto.setReplyCont(req.getParameter("replyCont"));
			
			// 테스트용 : dto.setReplyUser_id("dbckdgur12");
			dto.setReplyUser_id((String) req.getSession().getAttribute("loginId"));
			
			System.out.println(dto);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return dto;
	}
	
	
	
	
}
