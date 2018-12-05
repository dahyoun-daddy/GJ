package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;

@Repository
public class JasoCommentDaoImple implements JasoCommentDao {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.jasoComment";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int update(JasoCommentVO jasoCVO) throws SQLException {
		String statement = NAMESPACE+".update";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoCVO);
		int flag = sqlSession.update(statement, jasoCVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int delete(JasoCommentVO jasoCVO) throws SQLException {
		String statement = NAMESPACE+".delete";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoCVO);
		int flag = sqlSession.delete(statement, jasoCVO);
		log.debug("result : "+flag);
				
		return flag; 
	}
 
	@Override
	public int add(JasoCommentVO jasoCVO) {
		String statement = NAMESPACE+".add";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoCVO);
		int flag = sqlSession.insert(statement, jasoCVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public List<JasoCommentVO> doRetrieve(JasoVO jasoVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".doRetrieve";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		List<JasoCommentVO> list = sqlSession.selectList(statement, jasoVO);
		log.debug("result : "+list);
		
		return list;
	}

}
