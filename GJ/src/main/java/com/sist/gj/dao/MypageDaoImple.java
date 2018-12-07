package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CvFormVO;
import com.sist.gj.vo.DTO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

public class MypageDaoImple implements MypageDao {

	@Override
	public int addPic(PictureVO pictureVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePic(PictureVO pictureVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CvFormVO selectCv(CvFormVO cvFormVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCv(CvFormVO cvFormVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addCv(CvFormVO cvFormVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CvFormVO> retrieveCv(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addLic(LicenseVO licenseVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int updateLic(LicenseVO licenseVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLic(LicenseVO licenseVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LicenseVO selectLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public List<LicenseVO> retrieveLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addApply(ApplyVO liceapplyVOnseVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<ApplyVO> retrieveApply(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int updateApply(ApplyVO applyVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteApply(ApplyVO applyVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO selectUserInfo(UserVO userVO, CvFormVO cvFormVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO selectCompInfo(UserVO userVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteUser(UserVO DTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUSer(UserVO DTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
