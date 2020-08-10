package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public MemberDAO() {
		try {
			Context ctx=new InitialContext();
			DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean join(String id, String pw, String name, String email, String phone) {
		boolean result=false;
		String sql="insert into member(id,pw,name,email,phone) values(?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, email);
			ps.setString(5, phone);
			int success=ps.executeUpdate();
			if(success>0) {
				result=true;
			}else {
				result=false;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			result=false;
		}finally {
			resClose();
		}		
		return result;
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

	public boolean login(String id, String pw) {
		String sql="select id from member where id=? and pw=?";
		boolean result=false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs=ps.executeQuery();
			result=rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}		
		return result;
	}

}