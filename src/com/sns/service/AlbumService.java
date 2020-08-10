package com.sns.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.sns.dao.AlbumDAO;
import com.sns.dto.AlbumDTO;

public class AlbumService {

	HttpServletRequest req = null;
	
	public AlbumService(HttpServletRequest req) {
		this.req = req;
	}

	//사진 업로드
	public AlbumDTO upload() {
		
		int maxSize = 10*1024*1024;//사진 용량 제한
		
		String root = "C:/";
		String newFileName = "";
		String uploadPath = root+"upload";
		
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
			makeThum(uploadPath, newFileName,ext);
			dto.setAlbumOriFileName(oriFileName);
			System.out.println(dto.getAlbumOriFileName());
			dto.setAlbumNewFileName(newFileName);
			System.out.println(dto.getAlbumNewFileName());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@SuppressWarnings("deprecation")
	public void makeThum(String uploadPath, String newFileName, String ext) {
		
		int width = 170;
		int height = 170;
		System.out.println(uploadPath+"/"+newFileName);
		File oriFile = new File(uploadPath+"/"+newFileName);
		File thum = new File(uploadPath+"/thum_"+newFileName);
		System.out.println(uploadPath+"/thum_"+newFileName);
		Image src = null;
		try {
			BufferedImage im = ImageIO.read(oriFile);
			if(ext.equals("bmp") || ext.equals("png") || ext.equals("gif")) {
				src = ImageIO.read(oriFile);
			}else {
				src = new ImageIcon(oriFile.toURL()).getImage();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	public String list() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		
		AlbumDAO dao = new AlbumDAO();
		map.put("list", dao.list());
		String obj = gson.toJson(map);
		
		return obj;
	}

	
	
	//댓글 작성
	public AlbumDTO reply() {
		AlbumDTO dto= new AlbumDTO();
		return dto;
			
	}
	
	
	
	
}
