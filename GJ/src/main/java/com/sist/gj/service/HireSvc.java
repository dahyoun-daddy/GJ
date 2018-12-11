package com.sist.gj.service;

import java.util.List;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

public interface HireSvc {

	int create(HireVO hireVO) throws Exception;
	int read(HireVO hireVO) throws Exception;
	int update(HireVO hireVO) throws Exception;
	int delete(HireVO hireVO) throws Exception;
	
	List<JasoVO> doRetrieve(SearchVO searchVO) throws Exception;

	//HireVO read(HireVO hireVO) throws Exception;
}
