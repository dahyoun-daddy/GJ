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

import com.sist.gj.dao.ReviewDao;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private ReviewDao reviewDao;
	private MockMvc mockMvc;
	
	ReviewVO inVo1 = null;
	ReviewVO inVo2 = null;
	ReviewVO inVo3 = null;
	ReviewVO inVo4 = null;
	ReviewVO inVo5 = null;
	ReviewVO inVo6 = null;
	ReviewVO inVo7 = null;
	ReviewVO inVo8 = null;
	ReviewVO inVo9 = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
		inVo1 = new ReviewVO("10","test4@naver.com","3","제목","내용","","4","준혁","",null,null);
		inVo2 = new ReviewVO("11","test4@naver.com","3","제목","내용","","4","준혁1","",null,null);
		inVo3 = new ReviewVO("12","test4@naver.com","3","제목","내용","","4","준혁2","",null,null);
		inVo4 = new ReviewVO("4","test4@naver.com","3","제목","내용","","4","준혁","",null,null);
		inVo5 = new ReviewVO("5","test4@naver.com","3","제목","내용","","4","준혁1","",null,null);
		inVo6 = new ReviewVO("6","test4@naver.com","3","제목","내용","","4","준혁2","",null,null);
		inVo7 = new ReviewVO("7","test4@naver.com","3","제목","내용","","4","준혁","",null,null);
		inVo8 = new ReviewVO("8","test4@naver.com","3","제목","내용","","4","준혁1","",null,null);
		inVo9 = new ReviewVO("9","test4@naver.com","3","제목","내용","","4","준혁2","",null,null);
		
		
		searchVO = new SearchVO(10,1,"기업1",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("reviewDao : "+reviewDao);
	}
	
	@Test
	public void Test() {
		assertThat(inVo1.getReviewNo(),is("1"));
	}
	
	@Test
	public void add() throws ClassNotFoundException, SQLException{
		reviewDao.add(inVo1);
		reviewDao.add(inVo2);
		reviewDao.add(inVo3);
		reviewDao.add(inVo4);
		reviewDao.add(inVo5);
		reviewDao.add(inVo6);
		reviewDao.add(inVo7);
		reviewDao.add(inVo8);
		reviewDao.add(inVo9);
	}
	
	@Test
	@Ignore
	public void doRetrieve() throws ClassNotFoundException, SQLException {
		List<ReviewVO> list = reviewDao.doRetrieve(searchVO);
		LOG.info("size : "+list.size()+""); 
		LOG.info("list : "+list); 
		assertThat(list.size(),is(not(0)));
	}
	
	@Test
	@Ignore
	public void select() throws ClassNotFoundException, SQLException {
		ReviewVO result = reviewDao.select(inVo3);
		LOG.info("result : "+result);
		assertThat(result.getReviewNo(),is("3"));
	}
	
	@Test
	@Ignore
	public void update() throws ClassNotFoundException, SQLException {
		inVo3.setReviewPoint("10");
		reviewDao.update(inVo3);
	}
	
	@Test
	@Ignore
	public void delete() throws ClassNotFoundException, SQLException {
		reviewDao.delete(inVo1);
		reviewDao.delete(inVo2);
		reviewDao.delete(inVo3);
	}
	
	 
//	@Test
//	public void merge() throws SQLException {
//		int flag = reviewDao.merge(inVo1);
//		int flag2 = reviewDao.merge(inVo2);
//		assertThat(flag,is(1)); 
//		int deleteflag = reviewDao.delete(inVo1);
//		assertThat(deleteflag,is(1));
//	}
	

}