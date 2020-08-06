package com.sns.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DiaryDAO {

	//생성자로 무조건적으로 먼저 실행해야하는 부분을 만들어준다.
	//connection , preparestatement, resultset는 전역변수로 설정해준다.
	//자원 전부반납해주는 메서드도 만들어주면 편하다.
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public DiaryDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn =  ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		   }
	}
	public boolean write(String subject, String content) {//db에 들어갔는지 확인하기... 디테일로 가야겠지? 일단 확인해보려면 근데 그냥 목록으로가도...되굿...
		//sql문 준비하기 -> INSERT INTO diary (diaryidx,id,diarysubject,diarycontent,diarybhit,diaryreg_date)VALUES();
		//preparestatement로 ..해주고
		//실행 -> 보내고.. 
		//자원반납
		
		String sql="INSERT INTO diary(DIARYIDX,DIARYSUBJECT,DIARYCONTENT,DIARYBHIT,DIARYREG_DATE)VALUES(diary_seq.NEXTVAL,?,?,0,sysdate)";
		//조회수는 처음엔 0으로 설정해주고 나중에 update문으로 따로 수를 올려준다.
		boolean success = false;//초기값을 false로 주고
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, content);
			ps.executeUpdate();
			if(ps.executeUpdate()>0) {//넣어진게 성공이면 
				success=true;//true로 바꿔주고
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		resClose();
		}return success;//성공했으면 success가 true로 바뀌어서 서비스로 갈거다.
		
	}

	
	
	
	
	
	
	
	//자원반납하기
	public void resClose() {
		try {
			if(conn!=null) {conn.close();}
			if(rs!=null) {rs.close();}
			if(ps!=null) {ps.close();}
			
		}catch(Exception e) {
		}
	}
	

}
