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
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserMPViewVO;
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
	public UserVO selectPic(UserVO userVO) {
		String statement = NAMESPACE+".selectPic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		UserVO inVO = sqlSession.selectOne(statement, userVO);
		log.debug("result : "+inVO);
				
		return inVO;
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
	public JasoVO selectCl(JasoVO jasoVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectCl";
		log.debug("sql statement : "+statement);
		log.debug("param : "+jasoVO);
		JasoVO outVO = sqlSession.selectOne(statement, jasoVO);
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
		String statement = NAMESPACE+".addLic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+licenseVO);
		int flag = sqlSession.insert(statement, licenseVO);
		log.debug("result : "+flag);
				
		return flag;
	}
	
	@Override
	public int updateLic(LicenseVO licenseVO) throws SQLException {
		String statement = NAMESPACE+".updateLic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+licenseVO);
		int flag = sqlSession.update(statement, licenseVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int deleteLic(LicenseVO licenseVO) throws SQLException {
		String statement = NAMESPACE+".deleteLic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+licenseVO);
		int flag = sqlSession.delete(statement, licenseVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public LicenseVO selectLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectLic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+licenseVO);
		LicenseVO outVO = sqlSession.selectOne(statement, licenseVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}
	

	@Override
	public List<LicenseVO> retrieveLic(LicenseVO licenseVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".retrieveLic";
		log.debug("sql statement : "+statement);
		log.debug("param : "+licenseVO);
		List<LicenseVO> list = sqlSession.selectList(statement, licenseVO);
		log.debug("result : "+list);
		
		return list;
	}

	@Override
	public int addApply(ApplyVO applyVO) {
		String statement = NAMESPACE+".addApply";
		log.debug("sql statement : "+statement);
		log.debug("param : "+applyVO);
		int flag = sqlSession.insert(statement, applyVO);
		log.debug("result : "+flag);
				
		return flag;
	}
	
	@Override
	public List<ApplyVO> retrieveApplyUser(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".retrieveApplyUser";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<ApplyVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}
	
	@Override
	public List<ApplyVO> retrieveApplyComp(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".retrieveApplyComp";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<ApplyVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}
	
	@Override
	public int updateApply(ApplyVO applyVO) throws SQLException {
		String statement = NAMESPACE+".updateApply";
		log.debug("sql statement : "+statement);
		log.debug("param : "+applyVO);
		int flag = sqlSession.update(statement, applyVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int deleteApply(ApplyVO applyVO) throws SQLException {
		String statement = NAMESPACE+".deleteApply";
		log.debug("sql statement : "+statement);
		log.debug("param : "+applyVO);
		int flag = sqlSession.delete(statement, applyVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public UserMPViewVO selectUserInfo(UserMPViewVO userViewVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectUserInfo";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userViewVO);
		UserMPViewVO outVO = sqlSession.selectOne(statement, userViewVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}

	@Override
	public UserMPViewVO selectCompInfo(UserMPViewVO userViewVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".selectCompInfo";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userViewVO);
		UserMPViewVO outVO = sqlSession.selectOne(statement, userViewVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}

	@Override
	public int deleteUser(UserVO userVO) throws SQLException {
		String statement = NAMESPACE+".deleteUser";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.delete(statement, userVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int updateUser(UserVO userVO) throws SQLException{
		String statement = NAMESPACE+".updateUser";
		log.debug("sql statement : "+statement);
		log.debug("param : "+userVO);
		int flag = sqlSession.update(statement, userVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int deleteCvAll() throws SQLException {
		String statement = NAMESPACE+".deleteCvAll";
		log.debug("sql statement : "+statement);
		int flag = sqlSession.update(statement);
		log.debug("result : "+flag);
		return flag;
	}

	@Override
	public int deleteCv(CvFormVO cvFormVO) throws SQLException {
		String statement = NAMESPACE+".deleteCv";
		log.debug("sql statement : "+statement);
		log.debug("param : "+cvFormVO);
		int flag = sqlSession.update(statement, cvFormVO);
		log.debug("result : "+flag);
		return flag;
	}

	@Override
	public List<HireVO> retrieveHire(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		String statement = NAMESPACE+".retrieveHire";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<HireVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}

	
}
