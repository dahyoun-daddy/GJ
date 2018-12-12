package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sist.gj.dao.AdminPageDao;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

public class AdminPageSvcImple implements AdminPageSvc {

	@Autowired
	private AdminPageDao adminPageDao ;
	
	@Override
	public UserVO selectUser(UserVO userVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.selectUser(userVO);
	}

	@Override
	public int updateUser(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.updateUser(userVO);
	}

	@Override
	public int deleteUser(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.deleteUser(userVO);
	}

	@Override
	public List<UserVO> doRetrieveUser(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.doRetrieveUser(searchVO);
	}

	@Override
	public UserVO selectCompany(UserVO userVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.selectCompany(userVO);
	}

	@Override
	public int updateCompany(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.updateCompany(userVO);
	}

	@Override
	public int deleteCompany(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.deleteCompany(userVO);
	}

	@Override
	public List<UserVO> doRetrieveCompany(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return adminPageDao.doRetrieveCompany(searchVO);
	}

}
