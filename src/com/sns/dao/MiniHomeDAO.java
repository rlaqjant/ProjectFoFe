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
		String sql = "SELECT backcolor, minihname, minihintro FROM minihmain WHERE id = ?"; //미니홈피 정보
		MiniHomeDTO dto = new MiniHomeDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setBackcolor(rs.getString("backcolor"));
				dto.setMinihname(rs.getString("minihname"));
				dto.setMinihintro(rs.getString("minihintro"));
			}
			sql = "SELECT id, email FROM member WHERE id = ?";//회원 email, id
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
			}
			sql="SELECT newFileName FROM profilephotoup where id=? ";//프로필 사진
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setProfilephoto(rs.getString("newFileName"));
			}
			sql="SELECT newFileName FROM mainphotoup where id=?";//대문 사진
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setMainphoto(rs.getString("newFileName"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
		
	}

	public boolean followCheck(String homephostId, String loginId) {
		String sql="select id from follow where id=? and followId=?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.setString(2, homephostId);
			rs = ps.executeQuery();
			
			result=rs.next();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return result;
		
	}

	public boolean minihomeNameEdit(String homephostId, String minihome_nameEdit) {
		String sql="UPDATE minihmain SET minihname = ? WHERE id=?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, minihome_nameEdit);
			ps.setString(2, homephostId);
			if(0<ps.executeUpdate()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		
		return result;
	}

	public boolean profileMessageEdit(String homephostId, String profile_messageEdit) {
		String sql="UPDATE minihmain SET minihintro = ? WHERE id=?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, profile_messageEdit);
			ps.setString(2, homephostId);
			if(0<ps.executeUpdate()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		
		return result;
	}

}
