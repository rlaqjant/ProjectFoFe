package com.sns.service;

import com.sns.dao.MiniHomeDAO;
import com.sns.dto.MiniHomeDTO;

public class MiniHomeService {

	public MiniHomeDTO loadMinihome(String id) {
		
		MiniHomeDAO dao = new MiniHomeDAO();
		return dao.loadMinihome(id);
		
		
	}

}
