package com.sikon.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Career;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;
import com.sikon.service.user.UserDao;


//==> ȸ������ DAO CRUD ����
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(Map map) throws Exception {
		sqlSession.insert("UserMapper.addUser", map);
	}
	
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public User findUserId(String userNickname) throws Exception {
		return sqlSession.selectOne("UserMapper.findUserId", userNickname);
	}
	
	public void updateUser(User user) throws Exception {
		Career career = new Career();
		License license = new License();
		sqlSession.update("UserMapper.updateUser", user);
		sqlSession.update("CareerMapper.updateCareer", career);
		sqlSession.update("LicenseMapper.updateLicense", license);
		
		Map map = new HashMap();
		map.put("license", license);
		map.put("career", career);
		map.put("user", user);
		
	}

	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	public void deleteUser(User user) throws Exception {
		 sqlSession.delete("UserMapper.deleteUser", user);
	}

	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
}