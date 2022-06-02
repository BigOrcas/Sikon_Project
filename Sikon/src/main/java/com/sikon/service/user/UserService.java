package com.sikon.service.user;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Career;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	public void addCareer(Career career) throws Exception ;
	public void addLicense(License license) throws Exception ;
	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
	
	// IDã��
	public User findUserId(String userNickname) throws Exception ;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	// ȸ��Ż��
	public void deleteUser(User user) throws Exception ;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String userId) throws Exception;
	
}