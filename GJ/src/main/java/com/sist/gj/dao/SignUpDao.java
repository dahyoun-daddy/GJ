package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;


public interface SignUpDao {
	int update(UserVO userVO) throws SQLException;
	
	//추가 
	int add(JasoVO jasoVO);

	List<UserVO> selectAll() throws ClassNotFoundException, SQLException;
	
	List<UserVO> do_retrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException;

	//조회
	UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException;
}