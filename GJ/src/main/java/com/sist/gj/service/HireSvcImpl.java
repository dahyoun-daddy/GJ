package com.sist.gj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.common.RandomNum;
import com.sist.gj.dao.HireDao;
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Service
public class HireSvcImpl implements HireSvc {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private RandomNum random = new RandomNum();
	
	@Autowired
	private HireDao hireDao;
	
	@Override
	public int create(HireVO hireVO) throws Exception {
			String randomString = random.makeRandom();
			hireVO.setHireNo(Integer.parseInt(randomString.substring(8)));
		return hireDao.create(hireVO);
	}

	@Override
	public HireVO read(HireVO hireVO) throws Exception {
		return hireDao.read(hireVO);
	}

	@Override
	public int update(HireVO hireVO) throws Exception {
		return hireDao.update(hireVO);
	}

	@Override
	public int delete(HireVO hireVO) throws Exception {
		return hireDao.delete(hireVO);
	}

	@Override
	public List<HireVO> search(SearchVO searchVO) throws Exception {
		return hireDao.search(searchVO);
	}

}
