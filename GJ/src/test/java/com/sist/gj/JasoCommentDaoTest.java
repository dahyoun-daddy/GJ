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
	JasoVO jasosearchVo = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
		inVo1 = new JasoCommentVO("2018120617415500001","boondll@hanmail.net","테스트 댓글1"
					,"18/12/06","boondll@hanmail.net","18/12/06",null,null,"2018120412355500001");
		inVo2 = new JasoCommentVO("2018120617415500002","boondll@hanmail.net","테스트 댓글2"
					,"18/12/06","boondll@hanmail.net","18/12/06",null,null,"2018120412355500002");
		searchVO = new SearchVO(10,1,"",""); 
		jasosearchVo = new JasoVO();
		jasosearchVo.setClNo("2018120412355500001");
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("jasoDao : "+jasoCDao);
	}
	
	@Test
	public void test() {
		assertThat(inVo1.getCommentNo(),is("2018120617415500001"));

	}
	
	@Test
	public void merge() throws SQLException {
		int flag = jasoCDao.merge(inVo1);
		LOG.info("merge result = "+flag);
		assertThat(flag,is(1));
		int deleteflag = jasoCDao.delete(inVo1);
		assertThat(deleteflag,is(1));
		
		int flag2 = jasoCDao.merge(inVo2);
		assertThat(flag,is(1));
	}
	
	@Test
	public void doRetrieve() throws ClassNotFoundException, SQLException {
		List<JasoCommentVO> list = jasoCDao.doRetrieve(jasosearchVo);
		LOG.info("result = "+list);
		LOG.info("list size = "+list.size());
		assertThat(list.size(),is(not(0)));
		
	}
}
