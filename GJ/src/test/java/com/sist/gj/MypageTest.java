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
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
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
//	UserVO inUserInfo1 = null;
//	UserVO inUserInfo2 = null;
//	UserVO inUserInfo3 = null;
//	UserVO inUser1 = null;
//	UserVO inUser2 = null;
//	UserVO inUser3 = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
		inPic1 = new PictureVO("boondll@hanmail.net","logo.jpg","2018120616215000001","/gj/images/2018/12",
				               ".jpg","40000","boondll@hanmail.net","20181207",null,null);
		inCv1 = new CvFormVO("boondll1@hanmail.net","","대졸"  ,1,"",null,null);
		inCv2 = new CvFormVO("boondll2@hanmail.net","","초대졸",1,"",null,null);
		inCv3 = new CvFormVO("boondll3@hanmail.net","","고졸"  ,1,"",null,null);
		inLic1 = new LicenseVO();
	    inLic2 = new LicenseVO();
		inLic3 = new LicenseVO();
		inApply1 = new ApplyVO();
		inApply2 = new ApplyVO();
		inApply3 = new ApplyVO();
//		inUser1 = new UserVO();
//		inUser2 = new UserVO();
//		inUser3 = new UserVO();
		
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("mypageDao : "+mypageDao);
	}
	
	
	@Test
	@Ignore
	public void addnDeletePic() throws SQLException {
		int flag1 = mypageDao.addPic(inPic1);
		assertThat(flag1,is(1));
		int flag2 = mypageDao.deletePic(inPic1);
		assertThat(flag2,is(1));
	}
	
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
		
	}


}
