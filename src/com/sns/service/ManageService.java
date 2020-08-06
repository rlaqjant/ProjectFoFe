package com.sns.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ManageService {

	public String upload(HttpServletRequest req) {
		int maxSize = 10*1024*1024;
		
		//2. 저장 경로 설정(1.프로젝트 안에 저장, 2. 파일시스템에 저장)
		//	getRealPath  : 실제 실행되는 프로젝트가 저장되는 곳
		//String root = req.getSession().getServletContext().getRealPath("/");
		String root = "C:/";
		//C:\MVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\07_FileUpload\
		System.out.println(root);
		String uploadPath = root +"upload";
		//3. 만약 없으면 생성
		File dir = new File(uploadPath);
		if (!dir.exists()) {
			System.out.println("해당 폴더가 없음, 생성");
			dir.mkdir();
		}
		
		
		//4. 파일 추출(request에서) -cos.jar이용
		//MultipartRequest(request, 저장 경로, 제한용량, 인코딩 타입, 정책);
		//정책 : 중복 파일이 생겼을 경우 어떻게 할 것인가?
		//기본 정책(new DefaultFileRenamePolicy()) : 중복 파일 생성시 1, 2, 3...등의 숫자를 부여
		String newFileName =null;
		try {
			MultipartRequest multi
			= new MultipartRequest(req, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			//일반 파라메터 추출 가능
			System.out.println("title : " + multi.getParameter("title"));
			
			//5. 이름 변경
			String oriFileName = multi.getFilesystemName("profile");//원래 파일명 가져오기
			System.out.println("원래 파일 이름 : " + oriFileName);//확장자명을 항상 붙여줘야 본연의 모습을 잃지 않기때문에 확장자명 추출한다.
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));//확장자만 추출(substring, split)
			System.out.println("확장자 : " + ext);
			
			newFileName = System.currentTimeMillis() + ext;;//파일명 새로 생성 + 확장자 붙이기
			System.out.println(oriFileName + " -> " + newFileName);
			
			//새 파일명으로 변경
			File oldName = new File(uploadPath + "/" + oriFileName);
			File newName = new File(uploadPath + "/" + newFileName);
			oldName.renameTo(newName);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "photo/" +newFileName;
		
		
		}
		
	}
	
	

