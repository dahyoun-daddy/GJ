package com.sist.gj;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
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

import com.sist.gj.dao.JasoDao;
import com.sist.gj.dao.SignUpDao;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class SignUpTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private SignUpDao signUpDao;
	private MockMvc mockMvc;
	
	UserVO inVo1 = null;
	
	SearchVO searchVO = null;
	
	@Before 
	public void setUp() {
		inVo1 = new UserVO("test15@company.com","1","1","1","1","1"
					,"1","01011112222",1,"","","","test@company.com",null,"test15@company.com",null);
		 
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("SignUpDao : "+signUpDao);
	} 
														
	@Test
	public void Test() {
		assertThat(inVo1.getUserId(), is("test15@company.com")); 
	}
	@Test   
	public void insert() throws ClassNotFoundException, SQLException {
		 signUpDao.insert(inVo1);

	}
	
	@Test 
	public void select() throws ClassNotFoundException, SQLException {
		UserVO result = signUpDao.select(inVo1);
		LOG.info("result : "+result);
		assertThat(result.getUserId(),is("test15@company.com"));
	}
	
}

