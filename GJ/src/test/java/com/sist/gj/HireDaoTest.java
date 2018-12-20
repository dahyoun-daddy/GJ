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

import com.sist.gj.dao.HireDao;
import com.sist.gj.dao.JasoDao;
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class HireDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private HireDao hireDao;
	private MockMvc mockMvc;
	
	HireVO inVo1 = null;
	HireVO inVo2 = null;
	HireVO inVo3 = null;
	SearchVO searchVO = null;
	
	@Before
	public void setUp() {
	//	inVo1 = new HireVO(15,"보승소프트 신입공채","보승소프트 신입공채","보승소프트"
		//		,"20181212","20181212","창원시","3000","학력무관","보승소프트",null,"보승소프트",null);
		inVo2 = new HireVO();
		inVo3 = new HireVO();
		
		inVo1.setHireNo(1);
		inVo2.setHireNo(2);
		inVo3.setHireNo(3);
		
		searchVO = new SearchVO(10,1,"",""); 
		LOG.info("context : "+context);
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		LOG.info("mockMvc : "+mockMvc);
		LOG.info("HireDao : "+hireDao);
	}
	
	@Test
	public void test() {
		assertThat(inVo1.getHireNo(),is(1));
	}
	
	@Test
	public void create() throws Exception{
		int flag = hireDao.create(inVo1);
		assertThat(flag,is(1));
	}
	
	@Test 
	public void read() throws Exception {
		HireVO result = hireDao.read(inVo1);
		LOG.info("result : "+result);
		assertThat(inVo1.getHireNo(),is(1));
	}
	
	@Test
	@Ignore
	public void update() throws Exception {
		inVo1.setHireTitle("수정됨");
		int flag = hireDao.update(inVo1);
		assertThat(flag,is(1)); 
	}
	
	@Test
	public void search() throws Exception {
		List<HireVO> list = hireDao.search(searchVO);
		LOG.info("size : "+list.size()+""); 
		LOG.info("list : "+list); 
		assertThat(list.size(),is(not(0)));
	}
	
	@Test
	public void delete() throws Exception {
		int flag = hireDao.delete(inVo1);
		assertThat(flag, is(1));
	}

	
}
