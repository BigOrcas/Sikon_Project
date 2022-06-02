package com.sikon.service.user;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Career;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;
	
	public void addCareer(Career career) throws Exception ;
	
	public void addLicense(License license) throws Exception ;
	

	// SELECT ONE
	public User getUser(String userId) throws Exception ;
	
	// IDã��
	public User findUserId(String userNickname) throws Exception ;

	// ȸ����������
	public void updateUser(User user) throws Exception ;
	
	// ȸ�����
	public List<User> getUserList(Search search) throws Exception ;
	
	// ȸ��Ż��
	public void deleteUser(User user) throws Exception ;
		
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}