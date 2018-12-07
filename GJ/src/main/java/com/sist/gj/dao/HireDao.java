package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.SearchVO;

public interface HireDao {
	
	//등록
	int create(HireVO hireVO) throws SQLException;
	//수정
	int update(HireVO hireVO) throws SQLException;
	
	//삭제 : 게시 중인 채용공고를 삭제할 수 없다.
	//마감기한이 지나거나 채용이 완료된 경우는 별도로 표기

	//전체조회
	List<HireVO> search(SearchVO searchVO) throws Exception;
	
	//조회
	HireVO read(HireVO hireVO) throws Exception;
	
}
