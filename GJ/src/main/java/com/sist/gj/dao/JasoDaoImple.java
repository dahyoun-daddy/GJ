package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Repository
public class JasoDaoImple implements JasoDao {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.jaso";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public JasoDaoImple() {}
	
	@Override
	public int update(JasoVO jasoVO) throws SQLException {
		String statement = NAMESPACE+".update";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		int flag = sqlSession.update(statement, jasoVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int delete(JasoVO jasoVO) throws SQLException {
		String statement = NAMESPACE+".delete";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		int flag = sqlSession.delete(statement, jasoVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int add(JasoVO jasoVO) {
		String statement = NAMESPACE+".add";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		int flag = sqlSession.insert(statement, jasoVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public List<JasoVO> doRetrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".doRetrieve";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<JasoVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}

	@Override
	public JasoVO select(JasoVO jasoVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".select";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		JasoVO outVO = sqlSession.selectOne(statement, jasoVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}

	@Override
	public int merge(JasoVO jasoVO) throws SQLException {
		String statement = NAMESPACE+".merge";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		int flag = sqlSession.insert(statement, jasoVO);
		log.debug("result : "+flag);
				
		return flag;
	}

}
