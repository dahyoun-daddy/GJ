package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.ReviewVO;

public interface ReviewSvc {
	/**
	 * 단건삭제
	 */
	int delete(ReviewVO reviewVO) throws SQLException;

	/**
	 * 수정
	 */
	int update(ReviewVO reviewVO) throws SQLException;


	/**
	 * 추가:115
	 * @param reviewVO
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	int add(ReviewVO reviewVO);

	List<ReviewVO> doRetrieve(SearchVO searchVO)
			throws ClassNotFoundException, SQLException, EmptyResultDataAccessException;

	/**
	 * 단건조회
	 * @param reviewVO
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	ReviewVO select(ReviewVO reviewVO) throws ClassNotFoundException, SQLException, EmptyResultDataAccessException;

}