package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;


public interface reviewDao {
	int update(ReviewVO reviewVO) throws SQLException;
	
	void deleteAll() throws SQLException;
	
	int delete(ReviewVO reviewVO) throws SQLException;

	int add(ReviewVO reviewVO);

	List<ReviewVO> selectAll() throws ClassNotFoundException, SQLException;
	
	List<ReviewVO> doRetrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException;

	ReviewVO select(ReviewVO reviewVO) throws ClassNotFoundException, SQLException;

}