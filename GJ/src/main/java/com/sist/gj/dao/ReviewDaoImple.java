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
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;

@Repository
public class ReviewDaoImple implements ReviewDao {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.review";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int update(ReviewVO reviewVO) throws SQLException {
		String statement = NAMESPACE+".update";
		log.debug("sql statement : "+statement);
		log.debug("param : "+reviewVO);
		int flag = sqlSession.update(statement, reviewVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int delete(ReviewVO reviewVO) throws SQLException {
		String statement = NAMESPACE+".delete";
		log.debug("sql statement : "+statement);
		log.debug("param : "+reviewVO);
		int flag = sqlSession.delete(statement, reviewVO);
		log.debug("result : "+flag);
				
		return flag; 
	}

	@Override
	public int add(ReviewVO reviewVO) {
		String statement = NAMESPACE+".add";
		log.debug("sql statement : "+statement);
		log.debug("param : "+reviewVO);
		int flag = sqlSession.insert(statement, reviewVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public List<ReviewVO> doRetrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".doRetrieve";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<ReviewVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}
	

	@Override
	public ReviewVO select(ReviewVO reviewVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".select";
		log.debug("sql statement : "+statement);
		log.debug("param : "+reviewVO);
		ReviewVO outVO = sqlSession.selectOne(statement, reviewVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}
	
	@Override
	public void deleteAll() throws SQLException {
		// TODO Auto-generated method stub

	}
	
	@Override
	public List<ReviewVO> selectAll() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}




}
