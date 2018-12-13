package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.common.RandomNum;
import com.sist.gj.dao.JasoCommentDao;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;

@Service
public class JasoCommentSvcImple implements JasoCommentSvc {
	Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private JasoCommentDao jasoCDao;
	
	private RandomNum random = new RandomNum();
	
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
		if(null == jasoCVO.getCommentNo()) {
			String randomString = random.makeRandom();
			log.info("random no : "+randomString);
			jasoCVO.setCommentNo(randomString);
		}
		return jasoCDao.merge(jasoCVO);
	}

}
