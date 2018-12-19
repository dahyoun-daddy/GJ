package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.sist.gj.vo.ReviewCpVO;
import com.sist.gj.vo.SearchVO;


public interface ReviewCpDao {
	
	int add(ReviewCpVO reviewCpVO);

	ReviewCpVO select(ReviewCpVO reviewCpVO) throws ClassNotFoundException, SQLException;

}