package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.dao.CodeDao;
import com.sist.gj.vo.CodeVO;

@Service
public class CodeSvcImple implements CodeSvc {

	@Autowired
	private CodeDao codeDao;
	
	@Override
	public List<CodeVO> doRetrieve(CodeVO codeVO) throws ClassNotFoundException, SQLException {
		return codeDao.doRetrieve(codeVO);
	}

}
