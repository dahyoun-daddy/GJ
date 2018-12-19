package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.UserVO;

public interface SignUpDao {
	
	
	
	//등록
		int insert(UserVO userVO) throws SQLException;
	
	//조회
		UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException;
	
		UserVO login(UserVO userVO) throws ClassNotFoundException, SQLException;

		UserVO findIdPass(UserVO userVO) throws ClassNotFoundException, SQLException;
		
		UserVO findIdPass2(UserVO userVO) throws ClassNotFoundException, SQLException;
		
		
	//////////////////////////회원가입
		
		UserVO checkId(UserVO userVO) throws ClassNotFoundException, SQLException;
}
