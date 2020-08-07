package com.sns.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sns.dao.FollowDAO;
import com.sns.dto.SearchDTO;

public class FollowService {
	
	HttpServletRequest req = null;
	HttpServletResponse resp = null;

	public FollowService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void memberSearch() {
		String srchName = req.getParameter("srchName");
		System.out.println("검색 요청값 : "+srchName);
		HashMap<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		ArrayList<SearchDTO> arrList = null;
		FollowDAO dao = new FollowDAO();
		boolean result = true;
		try {
			arrList = dao.list(srchName);
			if(arrList.isEmpty()) {
				result=false;
			}
			map.put("result",result);
			map.put("arrList", arrList);
			String obj = gson.toJson(map);
			System.out.println(obj);
			resp.setContentType("text/html; charset=UTF-8"); 
			resp.getWriter().println(obj);
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}finally {
			dao.resClose();
		}
		
		
	}



}
