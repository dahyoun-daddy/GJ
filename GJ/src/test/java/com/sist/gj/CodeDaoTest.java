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

import com.sist.gj.dao.CodeDao;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.JasoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CodeDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private CodeDao codeDao;
	private MockMvc mockMvc;
	
	CodeVO codeVO = null;
	 
	@Before
	public void setUp() {
		codeVO = new CodeVO("JASO_SEARCH","1","작성자","1","1","ADMIN","18/12/05","ADMIN","18/12/05");
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("CodeDao : "+codeDao);
	}
	
	@Test
	public void test() {
		assertThat(codeVO.getCmId(),is("JASO_SEARCH"));
	}
	
	@Test
	public void code() throws ClassNotFoundException, SQLException {
		List<CodeVO> list = codeDao.doRetrieve(codeVO);
		LOG.info("size : "+list.size()+""); 
		LOG.info("list : "+list); 
		assertThat(list.size(),is(not(0)));
	}
}
