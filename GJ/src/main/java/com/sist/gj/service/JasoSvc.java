package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

public interface JasoSvc {
	int update(JasoVO jasoVO) throws SQLException;
	int delete(JasoVO jasoVO) throws SQLException;
	//추가
	int add(JasoVO jasoVO);
	
	List<JasoVO> doRetrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException;

	//조회
	JasoVO select(JasoVO jasoVO) throws ClassNotFoundException, SQLException;
}
