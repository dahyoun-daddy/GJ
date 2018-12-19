package com.sist.gj.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.gj.vo.ReviewCpVO;
import com.sist.gj.vo.ReviewVO;

@Repository
public class ReviewCpDaoImple implements ReviewCpDao {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.reviewCp";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ReviewCpDaoImple() {}

	@Override
	public int add(ReviewCpVO reviewCpVO) {
		String statement = NAMESPACE+".add";
		log.debug("sql statement : "+statement);
		log.debug("param : "+reviewCpVO);
		int flag = sqlSession.insert(statement, reviewCpVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public ReviewCpVO select(ReviewCpVO reviewCpVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".select";
		log.debug("sql statement : "+statement);
		log.debug("param : "+reviewCpVO);
		ReviewCpVO outVO = sqlSession.selectOne(statement, reviewCpVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}

}
