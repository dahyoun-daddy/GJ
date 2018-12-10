package com.sist.gj.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.gj.dao.JasoDao;
import com.sist.gj.dao.MypageDao;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CvFormVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserMPViewVO;
import com.sist.gj.vo.UserVO;

@Service
public class MypageSvcImple implements MypageSvc {

	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public int addPic(PictureVO pictureVO) {
		return mypageDao.addPic(pictureVO);
	}

	@Override
	public int deletePic(PictureVO pictureVO) throws SQLException {
		return mypageDao.deletePic(pictureVO);
	}

	@Override
	public CvFormVO selectCv(CvFormVO cvFormVO) throws ClassNotFoundException, SQLException {
		return mypageDao.selectCv(cvFormVO);
	}

	@Override
	public int updateCv(CvFormVO cvFormVO) throws SQLException {
		return mypageDao.updateCv(cvFormVO);
	}

	@Override
	public int addCv(CvFormVO cvFormVO) {
		return mypageDao.addCv(cvFormVO);
	}

	@Override
	public List<CvFormVO> retrieveCv(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		return mypageDao.retrieveCv(searchVO);
	}

	@Override
	public int addLic(LicenseVO licenseVO) {
		return mypageDao.addLic(licenseVO);
	}

	@Override
	public int updateLic(LicenseVO licenseVO) throws SQLException {
		return mypageDao.updateLic(licenseVO);
	}

	@Override
	public int deleteLic(LicenseVO licenseVO) throws SQLException {
		return mypageDao.deleteLic(licenseVO);
	}

	@Override
	public LicenseVO selectLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException {
		return mypageDao.selectLic(licenseVO);
	}

	@Override
	public List<LicenseVO> retrieveLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException {
		return mypageDao.retrieveLic(licenseVO);
	}

	@Override
	public int addApply(ApplyVO applyVO) {
		return mypageDao.addApply(applyVO);
	}

	@Override
	public List<ApplyVO> retrieveApply(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		return mypageDao.retrieveApply(searchVO);
	}

	@Override
	public int updateApply(ApplyVO applyVO) throws SQLException {
		return mypageDao.updateApply(applyVO);
	}

	@Override
	public int deleteApply(ApplyVO applyVO) throws SQLException {
		return mypageDao.deleteApply(applyVO);
	}

	@Override
	public UserMPViewVO selectUserInfo(UserMPViewVO userViewVO) throws ClassNotFoundException, SQLException {
		return mypageDao.selectUserInfo(userViewVO);
	}

	@Override
	public UserMPViewVO selectCompInfo(UserMPViewVO userViewVO) throws ClassNotFoundException, SQLException {
		return mypageDao.selectCompInfo(userViewVO); 
	}

	@Override
	public int deleteUser(UserVO userVO) throws SQLException {
		return mypageDao.deleteUser(userVO);
	}

	@Override
	public int updateUser(UserVO userVO) throws SQLException {
		return mypageDao.updateUser(userVO);
	}

	@Override
	public int deleteCvAll() throws SQLException {
		return mypageDao.deleteCvAll();
	}

}
