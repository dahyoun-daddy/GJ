package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;


public interface JasoDao {
	int update(JasoVO jasoVO) throws SQLException;
	int delete(JasoVO jasoVO) throws SQLException;
	//추가
	int add(JasoVO jasoVO);

	List<JasoVO> selectAll() throws ClassNotFoundException, SQLException;
	
	List<JasoVO> doRetrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException;

	//조회
	JasoVO select(JasoVO jasoVO) throws ClassNotFoundException, SQLException;

	
}