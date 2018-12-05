package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.CodeVO;

public interface CodeDao {
	List<CodeVO> doRetrieve(CodeVO codeVO) throws ClassNotFoundException, SQLException;
}
