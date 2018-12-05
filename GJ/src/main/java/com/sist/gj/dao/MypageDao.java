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
	
	//사진 추가
	int addPic(PictureVO pictureVO);
	
	//사진 수정
	int updatePic(PictureVO pictureVO) throws SQLException;
	
	//사진 삭제 
	int deletePic(PictureVO pictureVO) throws SQLException;
	
	
	
	//이력서 단건조회
	CvFormVO selectCv(CvFormVO cvFormVO) throws ClassNotFoundException, SQLException;
	
	//이력서 수정 
	int updateCv(CvFormVO cvFormVO) throws SQLException;
	
	//이력서 추가(저장)
	int addCv(CvFormVO cvFormVO);
	
	//기업 마이페이지 오픈된 이력서 리스트
	List<CvFormVO> retrieveCv(SearchVO searchVO) throws ClassNotFoundException, SQLException;
	
	//자격증 추가 (자격증은 수정은 없고, 수정 시 기존에 있던 파일 삭제 후 다시 추가하는 것으로 한다)
	int addLic(LicenseVO licenseVO);
	
	//자격증 삭제
	int deleteLic(LicenseVO licenseVO) throws SQLException;
	
	//자격증 단건조회 
	LicenseVO selectLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException;
	
	
	
	//입사지원정보 list 조회
	List<ApplyVO> retrieveApply(SearchVO searchVO) throws ClassNotFoundException, SQLException;
	
	//입사지원 취소
	int deletePic(ApplyVO applyVO) throws SQLException;
	
	
	// (UserVO 생겼을 때 대체하기)
	//기본 구직자마이페이지
	CvFormVO selectUserInfo(DTO DTO) throws ClassNotFoundException, SQLException;
	
	//기본 기업마이페이지
	CvFormVO selectCompInfo(DTO DTO) throws ClassNotFoundException, SQLException;
	
	//(UserVO 생겼을 때 대체하기)
	//탈퇴하기
	int deleteUser(DTO DTO) throws SQLException;
	
	//(UserVO 생겼을 때 대체하기)
	//회원정보 수정하기 
	int updateUSer(DTO DTO) throws SQLException;
	
	

}
