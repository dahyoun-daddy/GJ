package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.*;

public interface MypageDao {
	
	/*사진 등록/ 사진 수정/ 사진 삭제
	 addPic
	 updatePic
	 deletePic

	나의 정보 : Users Join > user_nick 
	 selectUserInfo 기본 구직자마이페이지
	 selectCompInfo 기본 기업마이페이지
	 updateUser 정보수정
	 deleteUser 탈퇴

	지원현황
	 retrieveApply
	 deleteApply*/
	
	//사진은 수정이 따로 없고 (계정 당 한 사진만 올릴 수 있어서)
	//사진 수정 시 기존 사진을 삭제하고 추가하는 과정을 거친다
	//사진 추가
	int addPic(PictureVO pictureVO);

	//사진 삭제 
	int deletePic(PictureVO pictureVO) throws SQLException;
	
	//이력서 전체 삭제
	int deleteCvAll() throws SQLException;
	 
	//이력서 단건조회
	CvFormVO selectCv(CvFormVO cvFormVO) throws ClassNotFoundException, SQLException;
	
	//이력서 수정 
	int updateCv(CvFormVO cvFormVO) throws SQLException;
	
	//이력서 추가(저장)
	int addCv(CvFormVO cvFormVO);
	
	//기업 마이페이지 오픈된 이력서 리스트
	List<CvFormVO> retrieveCv(SearchVO searchVO) throws ClassNotFoundException, SQLException;
	
	//자격증 추가 
	int addLic(LicenseVO licenseVO);
	
	//자격증 삭제
	int updateLic(LicenseVO licenseVO) throws SQLException;
	
	//자격증 삭제
	int deleteLic(LicenseVO licenseVO) throws SQLException;
	
	//자격증 단건조회 
	LicenseVO selectLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException;
	
	//자격증 리스트 조회
	List<LicenseVO> retrieveLic(SearchVO searchVO) throws ClassNotFoundException, SQLException;
	
	
	//입사지원정보 추가
	int addApply(ApplyVO applyVO);
	
	//입사지원정보 list 조회
	List<ApplyVO> retrieveApply(SearchVO searchVO) throws ClassNotFoundException, SQLException;
	
	//입사지원 수정 
	int updateApply(ApplyVO applyVO) throws SQLException;
	
	//입사지원 취소
	int deleteApply(ApplyVO applyVO) throws SQLException;
	
	
	//기본 구직자마이페이지
	UserVO selectUserInfo(UserVO userVO) throws ClassNotFoundException, SQLException;
	
	//기본 기업마이페이지
	UserVO selectCompInfo(UserVO userVO) throws ClassNotFoundException, SQLException;
	
	//탈퇴하기
	int deleteUser(UserVO userVO) throws SQLException;
	
	//회원정보 수정하기 
	int updateUser(UserVO userVO) throws SQLException;
	
	

}
