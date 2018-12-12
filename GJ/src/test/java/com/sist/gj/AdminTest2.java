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

import com.sist.gj.dao.AdminPageDao;
import com.sist.gj.dao.JasoDao;
import com.sist.gj.dao.SignUpDao;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AdminTest2 {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context; 
	
	@Autowired
	private AdminPageDao adminPageDao;
	private MockMvc mockMvc;
	
	UserVO inVo1 = null; 
	
	SearchVO searchVO = null; 
	 
	@Before 
	public void setUp() {
		inVo1 = new UserVO("test5@naver.com","1","1","1","1","1"
					,"1","01011112222",1,null,null,null,"11@test.com","20181111",null,null);
		 
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("adminPageDao : "+adminPageDao);
	}
	 
	@Test
	public void Test() { 
		assertThat(inVo1.getUserId(), is("test5@naver.com")); 
	}
	
	@Test
	public void doRetrieve() throws ClassNotFoundException, SQLException {
		List<UserVO> list = adminPageDao.doRetrieveUser(searchVO);
		LOG.info("result = "+list);
		LOG.info("list size = "+list.size());
		assertThat(list.size(),is(not(0)));
		
	}
	
	@Test
	@Ignore
	public void merge() throws SQLException, ClassNotFoundException {
		UserVO userVO = adminPageDao.selectUser(inVo1);
		LOG.info("merge result = "+userVO);
		assertThat(userVO.getUserId(),is("test1@naver.com"));
		int updateUCflag = adminPageDao.updateUser(inVo1);
		assertThat(updateUCflag,is(1));
		int deleteUCflag = adminPageDao.deleteUser(inVo1);
		assertThat(deleteUCflag,is(1));
		
	}
	 
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Test
	public void doRetrieve1() throws ClassNotFoundException, SQLException {
		List<UserVO> list = adminPageDao.doRetrieveCompany(searchVO);
		LOG.info("result = "+list);
		LOG.info("list size = "+list.size());
		assertThat(list.size(),is(not(0)));
		
	}
	

	@Test
	
	public void merge1() throws SQLException, ClassNotFoundException {
		UserVO userVO = adminPageDao.selectCompany(inVo1);
		LOG.info("merge result = "+userVO);
		assertThat(userVO.getUserId(),is("test5@naver.com"));
		int updateUCflag = adminPageDao.updateCompany(inVo1);
		assertThat(updateUCflag,is(1));
		int deleteUCflag = adminPageDao.deleteCompany(inVo1);
		assertThat(deleteUCflag,is(1));
		
	}
	
	
	
}