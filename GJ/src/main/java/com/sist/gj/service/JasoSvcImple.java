package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.common.RandomNum;
import com.sist.gj.dao.JasoDao;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Service
public class JasoSvcImple implements JasoSvc {
	Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private JasoDao jasoDao;
	
	private RandomNum random = new RandomNum();
	
	@Override
	public int update(JasoVO jasoVO) throws SQLException {
		return jasoDao.update(jasoVO);
	}

	@Override
	public int delete(JasoVO jasoVO) throws SQLException {
		return jasoDao.delete(jasoVO);
	}

	@Override
	public int add(JasoVO jasoVO) {
		return jasoDao.add(jasoVO);
	}

	@Override
	public List<JasoVO> doRetrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		return jasoDao.doRetrieve(searchVO);
	}

	@Override
	public JasoVO select(JasoVO jasoVO) throws ClassNotFoundException, SQLException {
		return jasoDao.select(jasoVO);
	}

	@Override
	public int merge(JasoVO jasoVO) throws SQLException {
		if(null == jasoVO.getClNo()  || jasoVO.getClNo().equals("")) {
			String randomString = random.makeRandom();
			log.info("random no : "+randomString);
			jasoVO.setClNo(randomString);
		}
		
		
		return jasoDao.merge(jasoVO);
	}

}
