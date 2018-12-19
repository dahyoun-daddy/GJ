package com.sist.gj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Repository
public class SignUpDaoImple implements SignUpDao {

Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.SignUp";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public SignUpDaoImple() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int insert(UserVO userVO) throws SQLException {
		String statement = NAMESPACE+".insert";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.insert(statement, userVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException {
		
		UserVO outVO = null;
		
		String statement = NAMESPACE+".select";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
	}

	@Override
	public UserVO login(UserVO userVO) throws ClassNotFoundException, SQLException {
UserVO outVO = null;
		
		String statement = NAMESPACE+".login";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
	}
	
	@Override
	public UserVO findIdPass(UserVO userVO) throws ClassNotFoundException, SQLException {
UserVO outVO = null;
		
		String statement = NAMESPACE+".findId";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
	}
	
	@Override
	public UserVO findIdPass2(UserVO userVO) throws ClassNotFoundException, SQLException {
UserVO outVO = null;
		
		String statement = NAMESPACE+".findPw";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
	}

	@Override
	public UserVO checkId(UserVO userVO) throws ClassNotFoundException, SQLException {
UserVO outVO = null;
		
		String statement = NAMESPACE+".checkId";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
	}

}
