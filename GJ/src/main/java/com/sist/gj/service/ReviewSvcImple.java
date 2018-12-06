package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.sist.gj.dao.ReviewDao;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;

@Service
public class ReviewSvcImple implements ReviewSvc {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public int delete(ReviewVO reviewVO) throws SQLException {
		// TODO Auto-generated method stub
		return reviewDao.delete(reviewVO);
	}

	@Override
	public int update(ReviewVO reviewVO) throws SQLException {
		// TODO Auto-generated method stub
		return reviewDao.update(reviewVO);
	}

	@Override
	public int add(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDao.add(reviewVO);
	}

	@Override
	public List<ReviewVO> doRetrieve(SearchVO searchVO)
			throws ClassNotFoundException, SQLException, EmptyResultDataAccessException {
		// TODO Auto-generated method stub
		return reviewDao.doRetrieve(searchVO);
	}

	@Override
	public ReviewVO select(ReviewVO reviewVO)
			throws ClassNotFoundException, SQLException, EmptyResultDataAccessException {
		// TODO Auto-generated method stub
		return reviewDao.select(reviewVO);
	}

}
