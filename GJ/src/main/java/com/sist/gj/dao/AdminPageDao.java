package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.UserVO;

public interface AdminPageDao {
	
	
	
	//등록
		int insert(UserVO userVO) throws SQLException;
	
	//조회
	UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException;
	
		//유저 수정
		int updateUC(UserVO userVO) throws SQLException;
		
		//유저 삭제 
		int deleteUC(UserVO userVO) throws SQLException;

				
		//유 리스트 조회
		List<UserVO> retrieveLic(UserVO userVO) throws ClassNotFoundException, SQLException;
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		//리뷰 삭제
		int deleteRV(ReviewVO reviewVO) throws SQLException;
		
		//조회
		ReviewVO select(ReviewVO reviewVO) throws ClassNotFoundException, SQLException;
		
		//리뷰 조회
		List<UserVO> retrieveLic(ReviewVO reviewVO) throws ClassNotFoundException, SQLException;
	
}
