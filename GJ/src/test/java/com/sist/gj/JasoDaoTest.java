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

import com.sist.gj.dao.JasoDao;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class JasoDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private JasoDao jasoDao;
	private MockMvc mockMvc;
	
	JasoVO inVo1 = null;
	JasoVO inVo2 = null;
	JasoVO inVo3 = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
		inVo1 = new JasoVO("2018120616215000001","테스트제목1","테스트성장1","테스트학교1","테스트성격1","테스트지원동기1"
					,1,"boondll@hanmail.net","20181206",null,null,null);
		inVo2 = new JasoVO("2018120616215000002","테스트제목2","테스트성장2","테스트학교2","테스트성격2","테스트지원동기2"
					,1,"boondll@hanmail.net","20181206",null,null,null);
		inVo3 = new JasoVO("2018120616215000003","테스트제목3","테스트성장3","테스트학교3","테스트성격3","테스트지원동기3"
					,1,"boondll@hanmail.net","20181206",null,null,null);
		
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("jasoDao : "+jasoDao);
	}
}
