package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

public interface JasoCommentDao {
	int update(JasoCommentVO jasoVO) throws SQLException;
	int delete(JasoCommentVO jasoVO) throws SQLException;
	//추가
	int add(JasoCommentVO jasoVO);
	
	List<JasoCommentVO> doRetrieve(JasoVO jasoVO) throws ClassNotFoundException, SQLException;
}
