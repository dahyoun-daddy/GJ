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
		inVo1 = new UserVO("11@test.com","11","11","11","1","1"
					,"1","01011112222",1,null,null,null,"11@test.com","20181111",null,null);
		 
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("SignUpDao : "+adminPageDao);
	}
	
	@Test
	public void Test() { 
		assertThat(inVo1.getUserId(), is("11@test.com")); 
	}
	
	@Test
	public void doRetrieve() throws ClassNotFoundException, SQLException {
		List<UserVO> list = adminPageDao.doRetrieve(searchVO);
		LOG.info("result = "+list);
		LOG.info("list size = "+list.size());
		assertThat(list.size(),is(not(0)));
		
	}
	
	
}