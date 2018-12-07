package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.dao.JasoCommentDao;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;

@Service
public class JasoCommentSvcImple implements JasoCommentSvc {

	@Autowired
	private JasoCommentDao jasoCDao;
	
	@Override
	public int update(JasoCommentVO jasoCVO) throws SQLException {
		return jasoCDao.update(jasoCVO);
	}

	@Override
	public int delete(JasoCommentVO jasoCVO) throws SQLException {
		return jasoCDao.delete(jasoCVO);
	}

	@Override
	public int add(JasoCommentVO jasoCVO) {
		return jasoCDao.add(jasoCVO);
	}

	@Override
	public List<JasoCommentVO> doRetrieve(JasoVO jasoCVO) throws ClassNotFoundException, SQLException {
		return jasoCDao.doRetrieve(jasoCVO);
	}

	@Override
	public int merge(JasoCommentVO jasoCVO) throws SQLException {
		return jasoCDao.merge(jasoCVO);
	}

}
