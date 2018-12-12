package com.sist.gj.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.sist.gj.dao.SignUpDao;
import com.sist.gj.vo.UserVO;

public class SignUpSvcImple implements SignUpSvc {

	@Autowired
	private SignUpDao signupDao;
	
	@Override
	public int insert(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return signupDao.insert(userVO);
	}

	@Override
	public UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return signupDao.select(userVO);
	}

}
