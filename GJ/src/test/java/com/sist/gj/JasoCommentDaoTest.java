package com.sist.gj;

import org.junit.Before;
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

import com.sist.gj.dao.JasoCommentDao;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class JasoCommentDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private JasoCommentDao jasoCDao;
	private MockMvc mockMvc;
	
	JasoCommentVO inVo1 = null;
	JasoCommentVO inVo2 = null;
	JasoCommentVO inVo3 = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
		inVo1 = new JasoCommentVO("2018120617415500001","boondll@hanmail.net","테스트 댓글1"
					,"18/12/06","boondll@hanmail.net","18/12/06",null,null,"boondll@hanmail.net");
		inVo1 = new JasoCommentVO("2018120617415500001","boondll@hanmail.net","테스트 댓글1"
					,"18/12/06","boondll@hanmail.net","18/12/06",null,null,"boondll@hanmail.net");
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("jasoDao : "+jasoCDao);
	}
	
	
	
	
}
