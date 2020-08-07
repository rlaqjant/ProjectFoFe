package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sns.dto.MiniHomeDTO;

public class MiniHomeDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public MiniHomeDAO(){
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

	public MiniHomeDTO loadMinihome(String id) {
		String sql = "SELECT h.backcolor, h.minihname, h.minihintro, m.email FROM minihmain h, member m WHERE m.id = ?";
		MiniHomeDTO dto = new MiniHomeDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto.setBackcolor(rs.getString("backcolor"));
				dto.setMinihname(rs.getString("minihname"));
				dto.setMinihintro(rs.getString("minihintro"));
				dto.setEmail(rs.getString("email"));
			}
			/*sql="SELECT newFileName FROM upfile where id=? and dataType=1";//프로필 사진
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setProfilephoto(rs.getString("newFileName"));
			}
			sql="SELECT newFileName FROM upfile where id=? and dataType=2";//대문 사진
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setMainphoto(rs.getString("newFileName"));
			}*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
		
	}

}
