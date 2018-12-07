package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CvFormVO;
import com.sist.gj.vo.DTO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserInfoVO;
import com.sist.gj.vo.UserVO;

@Repository
public class MypageDaoImple implements MypageDao {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	private final String NAMESPACE = "com.sist.gj.mappers.userMypage";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MypageDaoImple() {}
	
	@Override
	public int addPic(PictureVO pictureVO) {
		String statement = NAMESPACE+".addPic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+pictureVO);
		int flag = sqlSession.insert(statement, pictureVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int deletePic(PictureVO pictureVO) throws SQLException {
		String statement = NAMESPACE+".deletePic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+pictureVO);
		int flag = sqlSession.delete(statement, pictureVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public CvFormVO selectCv(CvFormVO cvFormVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectCv";
		log.debug("sql statement : "+statement);
		log.debug("param : "+cvFormVO);
		CvFormVO outVO = sqlSession.selectOne(statement, cvFormVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}

	@Override
	public int updateCv(CvFormVO cvFormVO) throws SQLException {
		String statement = NAMESPACE+".updateCv";
		log.debug("sql statement : "+statement);
		log.debug("param : "+cvFormVO);
		int flag = sqlSession.update(statement, cvFormVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int addCv(CvFormVO cvFormVO) {
		String statement = NAMESPACE+".addCv";
		log.debug("sql statement : "+statement);
		log.debug("param : "+cvFormVO);
		int flag = sqlSession.insert(statement, cvFormVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public List<CvFormVO> retrieveCv(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".retrieveCv";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<CvFormVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
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
	public int addApply(ApplyVO applyVO) {
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
	public UserVO selectUserInfo(UserInfoVO userInfoVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO selectCompInfo(UserInfoVO userInfoVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteUser(UserVO userVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserVO userVO) throws SQLException{
		// TODO Auto-generated method stub
		return 0;
	}


	
}
