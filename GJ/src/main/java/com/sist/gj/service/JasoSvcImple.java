package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.dao.JasoDao;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Service
public class JasoSvcImple implements JasoSvc {

	@Autowired
	private JasoDao jasoDao;
	
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

}
