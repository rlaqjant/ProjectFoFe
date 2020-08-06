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

	public void memberSearch() throws IOException {
		String srchText = req.getParameter("srchText");
		System.out.println("검색요청값 : "+srchText);
		FollowDAO dao = new FollowDAO();
		ArrayList<SearchDTO> list = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			list = dao.memberSearch(srchText);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dao.resClose();
		}
		map.put("list", list);
		Gson gson = new Gson();
		String obj = gson.toJson(map);
		System.out.println(obj);
		resp.setContentType("text/html; charset=UTF-8"); 
		resp.getWriter().println(obj);
	}
	


}
