package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.sns.dto.ProfileDTO;

public class ProfileDAO {
	
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	public ProfileDAO() {
		try {
			Context ctx=new InitialContext();
			DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean profileWrite(String id, String nickname, String myBirth, String blood, String addr, String major,
			String seduWay, String motto, String fMovie) {
		boolean success=false;
		System.out.println("1 로딩이 너무 기네");
		String sql="insert into profile(id, nickname, myBirth, blood, addr, major, seduWay, motto, fMovie) values(?,?,?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, nickname);
			ps.setString(3, myBirth);
			ps.setString(4, blood);
			ps.setString(5, addr);
			ps.setString(6, major);
			ps.setString(7, seduWay);
			ps.setString(8, motto);
			ps.setString(9, fMovie);
			System.out.println("2 로딩이 너무 기네");
			int result=ps.executeUpdate();
			System.out.println("성공 여부: "+result);
			if(result>0) {
				success=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			success=false;
		}finally {
			resClose();
		}		
		System.out.println("3 로딩이 너무 기네");
		return success;
	}

	private void resClose() {
		try {
			if(conn!=null) {conn.close();}
			if(ps!=null) {ps.close();}
			if(rs!=null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ProfileDTO profileDetail(String id) {
		String sql="select id, nickname, myBirth, blood, addr, major, seduWay, motto, fMovie from profile where id=?";
		ProfileDTO dto=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();	
			if(rs.next()) {
				dto=new ProfileDTO();
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setMyBirth(rs.getString("myBirth"));
				dto.setBlood(rs.getString("blood"));
				dto.setAddr(rs.getString("addr"));
				dto.setMajor(rs.getString("major"));
				dto.setSeduWay(rs.getString("seduWay"));
				dto.setMotto(rs.getString("motto"));
				dto.setfMovie(rs.getString("fMovie"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			resClose();
		}
		
		return dto;
	}

	public boolean profileUpdate(String id, String nickname, String myBirth, String blood, String addr, String major,
			String seduWay, String motto, String fMovie) {
		boolean result=false;
		String sql="update profile set nickname=?, myBirth=?, blood=?, addr=?, major=?, seduWay=?, motto=?, fMovie=? where id=?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ps.setString(2, myBirth);
			ps.setString(3, blood);
			ps.setString(4, addr);
			ps.setString(5, major);
			ps.setString(6, seduWay);
			ps.setString(7, motto);
			ps.setString(8, fMovie);
			ps.setString(9, id);
			if(ps.executeUpdate()>0) {
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			result=false;
		}finally {
			resClose();
		}
		return result;
	}
}
