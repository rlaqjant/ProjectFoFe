package com.sns.service;

import com.sns.dao.MiniHomeDAO;
import com.sns.dto.MiniHomeDTO;

public class MiniHomeService {

	public MiniHomeDTO loadMinihome(String id) {
		
		MiniHomeDAO dao = new MiniHomeDAO();
		return dao.loadMinihome(id);
		
		
	}

	public boolean followCheck(String homephostId, String loginId) {
		
		MiniHomeDAO dao = new MiniHomeDAO();
		return dao.followCheck(homephostId, loginId);
		
	}

	public boolean minihomeNameEdit(String homephostId, String minihome_nameEdit) {
		MiniHomeDAO dao = new MiniHomeDAO();
		return dao.minihomeNameEdit(homephostId, minihome_nameEdit);
	}

	public boolean profileMessageEdit(String homephostId, String profile_messageEdit) {
		MiniHomeDAO dao = new MiniHomeDAO();
		return dao.profileMessageEdit(homephostId, profile_messageEdit);
	}

}
