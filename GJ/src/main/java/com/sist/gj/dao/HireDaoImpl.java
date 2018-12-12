package com.sist.gj.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Repository
public class HireDaoImpl implements HireDao {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE = "com.sist.gj.mappers.Hire";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public HireDaoImpl() {}
	
	@Override
	public int create(HireVO hireVO) throws SQLException {
		String statement = NAMESPACE+".create";
		log.debug("sql statement : "+statement);
		log.debug("param : "+hireVO);
		int flag = sqlSession.insert(statement, hireVO);
		log.debug("result : "+flag);
				
		return flag;
	}

	@Override
	public int update(HireVO hireVO) throws SQLException {
		String statement = NAMESPACE+".update";
		log.debug("sql statement : "+statement);
		log.debug("param : "+hireVO);
		int flag = sqlSession.update(statement, hireVO);
		log.debug("result : "+flag);
		return flag;
	}

	@Override
	public List<HireVO> search(SearchVO searchVO) throws Exception {
		String statement = NAMESPACE+".search";
		log.debug("sql statement : "+statement);
		log.debug("param : "+searchVO);
		List<HireVO> list = sqlSession.selectList(statement, searchVO);
		log.debug("result : "+list);
		
		return list;
	}

	@Override
	public int read(HireVO hireVO) throws Exception {
		String statement = NAMESPACE+".read";
		log.debug("sql statement : "+statement);
		log.debug("param : "+hireVO);
		int outVO = sqlSession.selectOne(statement, hireVO);
		log.debug("result : "+outVO);
		
		return outVO;
	}


	@Override
	public int delete(HireVO hireVO) throws SQLException {
		String statement = NAMESPACE+".delete";
		log.debug("sql statement : "+statement);
		log.debug("param : "+hireVO);
		int flag = sqlSession.delete(statement, hireVO);
		log.debug("result : "+flag);
				
		return flag;
	}

}
