package com.sns.service;

import com.sns.dao.MemberDAO;

public class MemberService {

	public boolean join(String id, String pw, String name, String email, String phone) {
		MemberDAO dao=new MemberDAO();
		boolean success=dao.join(id,pw,name,email,phone);
		return success;
	}

	public boolean login(String id, String pw) {
		MemberDAO dao=new MemberDAO();
		boolean success=dao.login(id,pw);
		return success;
	}

	public void idCheck(String id) {
		boolean success=false;
	}

}
