package com.sist.gj;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.sist.gj.dao.MypageDao;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CvFormVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserMPViewVO;
import com.sist.gj.vo.UserVO;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MypageTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private MypageDao mypageDao;
	private MockMvc mockMvc;
	
	PictureVO inPic1 = null;
	CvFormVO inCv1 = null;
	CvFormVO inCv2 = null;
	CvFormVO inCv3 = null;
	LicenseVO inLic1 = null;
	LicenseVO inLic2 = null;
	LicenseVO inLic3 = null;
	ApplyVO inApply1 = null;
	ApplyVO inApply2 = null;
	ApplyVO inApply3 = null;
	UserVO inUser1 = null;
	UserVO inUser2 = null;
	UserMPViewVO user = null;
	UserMPViewVO company = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
		inPic1 = new PictureVO("boondll@hanmail.net","logo.jpg","2018120616215000001","/gj/images/2018/12",
				               ".jpg","40000","boondll@hanmail.net","20181207",null,null);
		inCv1 = new CvFormVO("boondll1@hanmail.net","","대졸"  ,1,"",null,null);
		inCv2 = new CvFormVO("boondll2@hanmail.net","","초대졸",1,"",null,null);
		inCv3 = new CvFormVO("boondll3@hanmail.net","","고졸"  ,1,"",null,null);
		inLic1 = new LicenseVO("1","정보처리기사","2018/11/16","","boondll@hanmail.net");
	    inLic2 = new LicenseVO("2","TOEIC","2016/10/16","830","boondll@hanmail.net");
		inLic3 = new LicenseVO("3","OPic","2016/07/16","IM2","boondll@hanmail.net");
//		inApply1 = new ApplyVO("1","boondll@hanmail.net", "2018/12/01","1","1");
//		inApply2 = new ApplyVO("2","boondll@hanmail.net", "2018/12/01","2","1");
//		inApply3 = new ApplyVO("3","boondll@hanmail.net", "2018/12/01","3","1");
		inUser1 = new UserVO("will@delete.com","1","1","1","1","1","1","010-1212-1212",1,"","","","will@delete.com","18/12/10","","");
		inUser2 = new UserVO("boondll@hanmail.net","password","nickname","name","address","2","답변수정","010-1111-1111",1,"","","","boondll@hanmail.net","18/12/10","","");

		user = new UserMPViewVO();
		company = new UserMPViewVO();
		
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("mypageDao : "+mypageDao);
	}
	
	
	@Test
	public void addnDeletePic() throws SQLException {
		int flag1 = mypageDao.addPic(inPic1);
		assertThat(flag1,is(1));
		int flag2 = mypageDao.deletePic(inPic1);
		assertThat(flag2,is(1));
	}//picture
	
	@Test
	public void cvFormTest() throws SQLException, ClassNotFoundException {
		//add
		int flagAdd1 = mypageDao.addCv(inCv1);
		int flagAdd2 = mypageDao.addCv(inCv2);
		int flagAdd3 = mypageDao.addCv(inCv3);
		assertThat(flagAdd1,is(1));
		assertThat(flagAdd2,is(1));
		assertThat(flagAdd3,is(1));
		
		//update
		inCv1.setCvGrade("학력변경테스트");
		int flagUpdate = mypageDao.updateCv(inCv1);
		assertThat(flagUpdate,is(1));
		
		//selectone
		CvFormVO result = mypageDao.selectCv(inCv1);
		LOG.info("result : "+result);
		assertThat(result.getCvGrade(),is("학력변경테스트"));
		
		//list retrieve
		List<CvFormVO> list = mypageDao.retrieveCv(searchVO);
		LOG.info("size : "+list.size()+""); 
		LOG.info("list : "+list); 
		assertThat(list.size(),is(not(0)));
		
		//delete All
		mypageDao.deleteCvAll();
		List<CvFormVO> list2 = mypageDao.retrieveCv(searchVO);
		assertThat(list2.size() , is(0));
	}//resume
	
	@Test
	public void licenseTest() throws SQLException, ClassNotFoundException {
		//add
		int flagAdd1 = mypageDao.addLic(inLic1);
		int flagAdd2 = mypageDao.addLic(inLic2);
		int flagAdd3 = mypageDao.addLic(inLic3);
		assertThat(flagAdd1,is(1));
		assertThat(flagAdd2,is(1));
		assertThat(flagAdd3,is(1));
		
		//update
		inLic1.setLicScore("합격");
		int flagUpdate = mypageDao.updateLic(inLic1);
		assertThat(flagUpdate,is(1));
		LOG.info("inLic3:"+inLic3);
		
		//select
		LicenseVO result = mypageDao.selectLic(inLic3);
		LOG.info("result : "+result);
		assertThat(result.getLicNo(),is("3"));
		
		//list retrieve
		List<LicenseVO> list = mypageDao.retrieveLic(inLic3);
		LOG.info("size : "+list.size()+""); 
		LOG.info("list : "+list); 
		assertThat(list.size(),is(not(0)));
		
		//delete All
		mypageDao.deleteLic(inLic1);
		mypageDao.deleteLic(inLic2);
		mypageDao.deleteLic(inLic3);
		List<LicenseVO> list2 = mypageDao.retrieveLic(inLic3);
		assertThat(list2.size() , is(0));
		
	}
	
	@Test
	public void applyTest() throws SQLException, ClassNotFoundException {
		//add
		int flagAdd1 = mypageDao.addApply(inApply1);
		int flagAdd2 = mypageDao.addApply(inApply2);
		int flagAdd3 = mypageDao.addApply(inApply3);
		assertThat(flagAdd1,is(1));
		assertThat(flagAdd2,is(1));
		assertThat(flagAdd3,is(1));
		
		//update
		inApply1.setApplyCheck("0");
		int flagUpdate = mypageDao.updateApply(inApply1);
		assertThat(flagUpdate,is(1));
		LOG.info("inApply1:"+inApply1);
		
		//list retrieve
		List<ApplyVO> list = mypageDao.retrieveApplyUser(searchVO);
		LOG.info("size : "+list.size()+""); 
		LOG.info("list : "+list); 
		assertThat(list.size(),is(not(0)));
		
		//delete All
		mypageDao.deleteApply(inApply1);
		mypageDao.deleteApply(inApply2);
		mypageDao.deleteApply(inApply3);
		List<ApplyVO> list2 = mypageDao.retrieveApplyUser(searchVO);
		assertThat(list2.size() , is(0));
		
	}
	
	
	//inUser1 = new UserVO("will@delete.com","1","1","1","1","1","1",
	//                     "010-1212-1212",1,"","","",
	//                     "will@delete.com","18/12/10","","");
	//DB에 넣은 뒤 수행하기
	@Test
	@Ignore
	public void userDelete() throws SQLException {
		int flag = mypageDao.deleteUser(inUser1);
		assertThat(flag, is(1));
	}
	
	@Test
	public void userUpdate() throws Exception {
		inUser2.setModId("boondll@hanmail.net");
		inUser2.setModDt("18/12/10");
		inUser2.setuserPassAn("ANSWER!!");
		LOG.info("inUser2:"+inUser2.toString());
		LOG.info("inUser2 userId:"+inUser2.getUserId());
		int flagUpdate = mypageDao.updateUser(inUser2);
		assertThat(flagUpdate, is(1));
		
	}
	
	@Test
	public void selectUser() throws Exception {
		user.setUserId("boondll@hanmail.net");
		UserMPViewVO result = mypageDao.selectUserInfo(user);
		LOG.info("result : "+result);
		assertThat(result.getUserNick(),is("nickname"));
		assertThat(result.getCvCheck(),is(1));
	}
	
	@Test
	public void selectComp() throws Exception {
		company.setUserId("test@company.com");
		UserMPViewVO result = mypageDao.selectCompInfo(company);
		LOG.info("result : "+result);
		assertThat(result.getUserNick(),is("1"));
		assertThat(result.getHireCount(),is(3));
	}

}
