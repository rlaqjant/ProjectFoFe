package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sns.dto.AlbumDTO;

public class AlbumDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public AlbumDAO() {
		//생성자 이용해 DB연결
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void Close() {
		try {
			if(rs != null) {rs.close();}
			if(ps != null) {ps.close();}
			if(conn != null) {conn.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public boolean write(AlbumDTO dto) {
		String sql = "insert into album(albumidx, id, albumcontent) values(Album_seq.NEXTVAL,?,?)";
		long pk=0;
		boolean com = false;
		try {
			ps = conn.prepareStatement(sql, new String[] {"albumidx"});
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getAlbumcontent());
			int success = ps.executeUpdate();
			System.out.println("album insert 성공? 실패? : "+success);
			rs=ps.getGeneratedKeys();
			if(rs.next()) {
				pk = rs.getLong(1);
				System.out.println("album idx : " + pk);
				if(success>0) {
					sql = "insert into albumupfile(albumidx, photoidx, albumorifilename, albumnewfilename) values(?,photoidx_seq.NEXTVAL,?,?)";
					ps=conn.prepareStatement(sql);
					ps.setLong(1, pk);
					ps.setString(2, dto.getAlbumOriFileName());
					ps.setString(3, dto.getAlbumNewFileName());
				}
				
				
				com = (ps.executeUpdate()>0)?true:false;
				System.out.println(com);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		return com;
	}

	public ArrayList<AlbumDTO> list() {
		String sql = "select albumidx from album";
		AlbumDTO dto = null;
		ArrayList<AlbumDTO> list = new ArrayList<AlbumDTO>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto = new AlbumDTO();
				dto.setAlbumidx(rs.getInt("albumidx"));
				System.out.println("idx 값 : " + rs.getInt("albumidx"));
				sql = "select albumnewfilename from albumupfile where albumidx=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, dto.getAlbumidx());
				ResultSet rs2 = ps.executeQuery();
				while(rs2.next()) {
					if(rs.getString("albumnewfilename") == null) {
						dto.setAlbumNewFileName("noneimage.png");
					}else {
						dto.setAlbumNewFileName(rs.getString("albumnewfilename"));
					}
					
					System.out.println("의 사진 이름 : "+rs.getString("albumnewfilename"));
				}
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close();
		}
		return list;
	}

}
