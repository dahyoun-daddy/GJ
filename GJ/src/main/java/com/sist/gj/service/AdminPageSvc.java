package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

public interface AdminPageSvc {
	
	
	
	
	 
	//유저 조회
	UserVO selectUser(UserVO userVO) throws ClassNotFoundException, SQLException;
	
		//유저 수정
		int updateUser(UserVO userVO) throws SQLException;
		
		//유저 삭제 
		int deleteUser(UserVO userVO) throws SQLException;

				
		//유저 리스트 조회
		List<UserVO> doRetrieveUser(SearchVO searchVO) throws ClassNotFoundException, SQLException;
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
			//기업 조회
			UserVO selectCompany(UserVO userVO) throws ClassNotFoundException, SQLException;
		
			//기업 수정
			int updateCompany(UserVO userVO) throws SQLException;
			
			//기업 삭제 
			int deleteCompany(UserVO userVO) throws SQLException;

					
			//기업 리스트 조회
			List<UserVO> doRetrieveCompany(SearchVO searchVO) throws ClassNotFoundException, SQLException;
	
}
