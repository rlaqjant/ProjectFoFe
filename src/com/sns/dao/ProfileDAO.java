package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileDAO {
	
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	public boolean profileWrite(String id, String nickname, String myBirth, String blood, String addr, String major,
			String seduWay, String motto, String fMovie) {
		boolean success=false;
		
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
			
			if(ps.executeUpdate()>0) {
				success=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			success=false;
		}finally {
			resClose();
		}		
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

}
