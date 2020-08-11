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
			arrList = dao.memberSearch(srchName);
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

	public void follow() {
		String homephostId = req.getParameter("homephostId");
		String loginId = (String) req.getSession().getAttribute("id");
		System.out.println("로그인 된 아이디(팔로우 할 놈) : "+loginId);
		System.out.println("팔로우당할 아이디(홈피주인) : "+homephostId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		
		FollowDAO dao = new FollowDAO();
		boolean result = false;
		
		try {
			if(loginId==null) {
				result = false;
			}else {
				result = dao.follow(homephostId,loginId);
			}
			
			map.put("result",result);
			String obj = gson.toJson(map);
			resp.getWriter().println(obj);
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}finally {
			dao.resClose();
		}
	}

	public void unFollow() {
		String homephostId = req.getParameter("homephostId");
		String loginId = (String) req.getSession().getAttribute("id");
		System.out.println("로그인 된 아이디(언팔 할 놈) : "+loginId);
		System.out.println("언팔로우당할 아이디(홈피주인) : "+homephostId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		
		FollowDAO dao = new FollowDAO();
		try {
			boolean result = dao.unfollow(homephostId,loginId);
			map.put("result",result);
			String obj = gson.toJson(map);
			resp.getWriter().println(obj);
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}finally {
			dao.resClose();
		}
	}

	public void loadFollowList() {
		String loginId = req.getParameter("loginId");
		FollowDAO dao = new FollowDAO();
		
		ArrayList<SearchDTO> arrList = new ArrayList<SearchDTO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		
		try {
			arrList = dao.loadFollowList(loginId);
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

	public void loadFollowerList() {
		String loginId = req.getParameter("loginId");
		FollowDAO dao = new FollowDAO();
		
		ArrayList<SearchDTO> arrList = new ArrayList<SearchDTO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		
		try {
			arrList = dao.loadFollowerList(loginId);
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
