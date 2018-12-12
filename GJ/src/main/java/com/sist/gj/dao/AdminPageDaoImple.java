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

import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Repository
public class AdminPageDaoImple implements AdminPageDao {

Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.AdminMyPage";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public AdminPageDaoImple() {
		// TODO Auto-generated constructor stub
	}

	

	@Override
	public UserVO selectUser(UserVO userVO) throws ClassNotFoundException, SQLException {

	UserVO outVO = null;
		
		String statement = NAMESPACE+".userDetail";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
		
	}	
	

	@Override
	public int updateUser(UserVO userVO) throws SQLException {
		UserVO outVO = null;
		
		String statement = NAMESPACE+".updateUser";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.update(statement, userVO);
		log.debug("result : "+flag);
		
		return flag;
	}

	@Override
	public int deleteUser(UserVO userVO) throws SQLException {
		UserVO outVO = null;
		
		String statement = NAMESPACE+".deleteUser";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.delete(statement, userVO);
		log.debug("result : "+flag);
		
		return flag;
	}
 
	@Override
	public List<UserVO> doRetrieveUser(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectUser";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<UserVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@Override
	public UserVO selectCompany(UserVO userVO) throws ClassNotFoundException, SQLException {

	UserVO outVO = null;
		
		String statement = NAMESPACE+".companyDetail";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		outVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+outVO);
				
		return outVO;
		
	}	
	

	@Override
	public int updateCompany(UserVO userVO) throws SQLException {
		UserVO outVO = null;
		
		String statement = NAMESPACE+".updateCompany";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.update(statement, userVO);
		log.debug("result : "+flag);
		
		return flag;
	}

	@Override
	public int deleteCompany(UserVO userVO) throws SQLException {
		UserVO outVO = null;
		
		String statement = NAMESPACE+".deleteCompany";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.delete(statement, userVO);
		log.debug("result : "+flag);
		
		return flag;
	}
 
	@Override
	public List<UserVO> doRetrieveCompany(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectCompany";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<UserVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}

	

}
