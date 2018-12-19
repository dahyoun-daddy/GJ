package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.ReviewCpVO;

public interface ReviewCpSvc {
	int add(ReviewCpVO reviewCpVO);

	ReviewCpVO select(ReviewCpVO reviewCpVO) throws ClassNotFoundException, SQLException, EmptyResultDataAccessException;

}