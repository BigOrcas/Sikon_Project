package com.sikon.service.cook.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Cook;
import com.sikon.service.cook.CookDao;


//==> 회원관리 DAO CRUD 구현
@Repository("cookDaoImpl")
public class CookDaoImpl implements CookDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CookDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addCook(Cook cook) throws Exception {
		
		System.out.println("CookDaoImpl: "+cook);
		sqlSession.insert("CookMapper.addCook", cook);
	}

	public Cook getCook(int cookNo) throws Exception {
		return sqlSession.selectOne("CookMapper.getCook", cookNo);
	}
	
	public void updateCook(Cook cook) throws Exception {
		sqlSession.update("CookMapper.updateCook", cook);
	}

	public List<Cook> getCookList(Search search) throws Exception {
		return sqlSession.selectList("CookMapper.getCookList", search);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CookMapper.getTotalCount", search);
	}
	
	public void deleteCook(int cookNo) throws Exception {
		sqlSession.delete("CookMapper.deleteCook",cookNo);
	}
	

	
	
	
	
	
}