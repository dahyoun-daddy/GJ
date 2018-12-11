package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.CodeVO;

public interface CodeSvc {
	List<CodeVO> doRetrieve(CodeVO codeVO) throws ClassNotFoundException, SQLException;
}
