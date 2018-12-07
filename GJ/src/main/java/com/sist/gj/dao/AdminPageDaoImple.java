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
	public int insert(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUC(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUC(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> retrieveLic(UserVO userVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteRV(ReviewVO reviewVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewVO select(ReviewVO reviewVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> retrieveLic(ReviewVO reviewVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	

	

}
