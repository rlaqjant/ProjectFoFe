package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sns.dto.SearchDTO;

public class FollowDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public FollowDAO(){
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void resClose() {
		try {
			if(rs!=null) {rs.close();}
			if(ps!=null) {ps.close();}
			if(conn!=null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<SearchDTO> memberSearch(String srchText) throws SQLException {
		String sql = "SELECT id, name FROM member WHERE name=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, srchText);
		rs = ps.executeQuery();
		
		ArrayList<SearchDTO> list = new ArrayList<SearchDTO>();
		while(rs.next()) {
			SearchDTO dto = new SearchDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			list.add(dto);
		}
		
		return list;
	}
		


}
