package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.sns.dto.ManageDTO;
import com.sns.service.ManageService;


public class ManageDAO {
	
	Connection conn= null;
	PreparedStatement ps= null;
	ResultSet  rs =null;
	
	//connection 생성
	public ManageDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn  = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//connection 닫기
	public void Close() {
		try {
			if(rs != null) {rs.close();}
			if(ps != null) {ps.close();}
			if(conn != null) {conn.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}



	public boolean profileWrite(ManageDTO dto) {
		
		String sql = "insert into upfile(id, datatype ,orifilename, newfilename) "
				+ "values(?, 1 , ? , ?)";
		boolean com = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getOriFileName());
			ps.setString(3, dto.getNewFileName());
			
			int success = ps.executeUpdate();
			System.out.println("album insert 성공? 실패? : " + success);
			if (success>0) {
				System.out.println("db 저장 완료");
				com = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		
		return com;
	}

public boolean profileWrite1(ManageDTO dto) {
		
		String sql = "insert into upfile(id, datatype ,orifilename, newfilename) "
				+ "values(?, 2 , ? , ?)";
		boolean com = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getOriFileName());
			ps.setString(3, dto.getNewFileName());
			
			int success = ps.executeUpdate();
			System.out.println("album insert 성공? 실패? : " + success);
			if (success>0) {
				System.out.println("db 저장 완료");
				com = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		
		return com;
	}
public boolean profileWrite2(ManageDTO dto) {
	
	String sql = "insert into upfile(id, datatype ,orifilename, newfilename) "
			+ "values(?, 3 , ? , ?)";
	boolean com = false;
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getOriFileName());
		ps.setString(3, dto.getNewFileName());
		
		int success = ps.executeUpdate();
		System.out.println("album insert 성공? 실패? : " + success);
		if (success>0) {
			System.out.println("db 저장 완료");
			com = true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		Close();
	}
	
	return com;
}

	public HashMap<String, Object> select(HttpServletRequest req) {
		ManageService service = new ManageService();
		String sql = "Select datatype, newfilename from upfile where datatype=1";
		
		boolean com = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				System.out.println(rs.getString("newfilename"));
				map.put("filename", rs.getString("newfilename"));
				com=true;
				
			}
			map.put("success", com);
			delete();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		return map;
	}
	
	public HashMap<String, Object> select1(HttpServletRequest req) {
		ManageService service = new ManageService();
		String sql = "Select datatype, newfilename from upfile where datatype=2";
		
		boolean com = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				System.out.println(rs.getString("newfilename"));
				map.put("filename", rs.getString("newfilename"));
				com=true;
				
			}
			map.put("success", com);
			delete1();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		return map;
	}
	public HashMap<String, Object> select2(HttpServletRequest req) {
		ManageService service = new ManageService();
		String sql = "Select datatype, newfilename from upfile where datatype=3";
		
		boolean com = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				System.out.println(rs.getString("newfilename"));
				map.put("filename", rs.getString("newfilename"));
				com=true;
				
			}
			map.put("success", com);
			delete2();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		return map;
	}
	

	

	public void delete() {
		String sql = "DELETE FROM upfile WHERE datatype = 1";
		boolean com = false;
		try {
			ps = conn.prepareStatement(sql);
			if(ps.executeUpdate()>0) {
				System.out.println("삭제 성공");
				com = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		
	}
	public void delete1() {
		String sql = "DELETE FROM upfile WHERE datatype = 2";
		boolean com = false;
		try {
			ps = conn.prepareStatement(sql);
			if(ps.executeUpdate()>0) {
				System.out.println("삭제 성공");
				com = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
	}
	
	private void delete2() {
		String sql = "DELETE FROM upfile WHERE datatype = 3";
		boolean com = false;
		try {
			ps = conn.prepareStatement(sql);
			if(ps.executeUpdate()>0) {
				System.out.println("삭제 성공");
				com = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		
	}
}
