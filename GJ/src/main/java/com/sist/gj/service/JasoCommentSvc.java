package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;

public interface JasoCommentSvc {
	int update(JasoCommentVO jasoCVO) throws SQLException;
	int delete(JasoCommentVO jasoCVO) throws SQLException;
	int merge(JasoCommentVO jasoCVO) throws SQLException;
	int add(JasoCommentVO jasoCVO);
	List<JasoCommentVO> doRetrieve(JasoVO jasoCVO) throws ClassNotFoundException, SQLException;
}
