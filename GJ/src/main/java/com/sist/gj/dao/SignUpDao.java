package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.UserVO;

public interface SignUpDao {
	
	
	
	//등록
		int insert(UserVO userVO) throws SQLException;
	
	//조희
	UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException;
	
	
	
}