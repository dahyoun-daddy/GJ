package com.sist.gj.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.sist.gj.dao.ReviewCpDao;
import com.sist.gj.vo.ReviewCpVO;

@Service
public class ReviewCpSvcImple implements ReviewCpSvc {
	
	@Autowired
	private ReviewCpDao reviewCpDao;
	
	
	public ReviewCpSvcImple() {}

	@Override
	public int add(ReviewCpVO reviewCpVO) {
		return reviewCpDao.add(reviewCpVO);
	}

	@Override
	public ReviewCpVO select(ReviewCpVO reviewCpVO)
			throws ClassNotFoundException, SQLException, EmptyResultDataAccessException {
		return reviewCpDao.select(reviewCpVO);
	}

}
