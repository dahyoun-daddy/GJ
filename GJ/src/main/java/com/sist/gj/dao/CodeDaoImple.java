package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.JasoVO;

public class CodeDaoImple implements CodeDao {
	private final String NAMESPACE = "com.sist.gj.mappers.code";
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CodeDaoImple() {}
	
	@Override
	public List<CodeVO> doRetrieve(CodeVO codeVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".code";
		log.debug("sql statement : "+statement);
		log.debug("param : "+codeVO);
		List<CodeVO> list = sqlSession.selectList(statement, codeVO);
		log.debug("result : "+list);
		
		return list;
	}  

}
