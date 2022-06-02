package com.sikon.service.user.test;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sikon.common.Search;
import com.sikon.service.domain.Career;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;
import com.sikon.service.user.UserService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class UserServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddUser() throws Exception {
		
		User user = new User();
		Career career = new Career();
		License license = new License();
		
		
		user.setUserId("test@naver.com");
		user.setUserName("testUserName");
		user.setPassword("3333");
		user.setUserBirth("19991111");
		user.setUserNickname("testddd");
		user.setUserImage("11.jpg");
		user.setAddr("��⵵");
		user.setRole("user");
		user.setPhone("01033334444");
		user.setHoldpoint(1);
		user.setMentorApply("Y");
		user.setQuitStatus("N");
	
		career.setCompany("����");
		career.setCareerExperience("��������������");
		career.setStartDate("2017-10-23");
		career.setEndDate("2018-10-23");
		career.setUserId("test@naver.com");
	
		license.setLicenseName("1������");
		license.setLicenseInstitution("������û");
		license.setLicenseDate("2019-10-23");
		license.setUserId("test@naver.com");
		

		Map map=new HashMap();
		map.put("user", user);
		map.put("career", career);
		map.put("license", license);
		
		
		userService.addUser(map);

		
		user = userService.getUser("test@naver.com");
	
		
		//==> console Ȯ��
		System.out.println(map);
		
		//==> API Ȯ��
//		Assert.assertEquals("testUserId", user.getUserId());
//		Assert.assertEquals("testUserName", user.getUserName());
//		Assert.assertEquals("testPasswd", user.getPassword());
//		Assert.assertEquals("19991111", user.getUserBirth());
//		Assert.assertEquals("testddd", user.getUserNickname());
//		Assert.assertEquals("11.jpg", user.getUserImage());
//		Assert.assertEquals("user", user.getAddr());
//		Assert.assertEquals("��⵵", user.getRole());
//		Assert.assertEquals("01033334444", user.getPhone());
//		Assert.assertEquals(1, user.getHoldpoint());
//		Assert.assertEquals("N", user.getMentorApply());
//		Assert.assertEquals("����", career.getCompany());
//		Assert.assertEquals("��������������", career.getCareerExperience());
//		Assert.assertEquals("2017/11/25", career.getStartDate());
//		Assert.assertEquals("2018/10/22", career.getEndDate());
//		Assert.assertEquals("1������", license.getLicenseName());
//		Assert.assertEquals("������û", license.getLicenseInstitution());
//		Assert.assertEquals("2019/02/03", license.getLicenseDate());
	}
	
	//@Test
	public void testGetUser() throws Exception {
		
		User user = new User();
		//==> �ʿ��ϴٸ�...
//		user.setUserId("test@naver.com");
//		user.setUserName("testUserName");
//		user.setPassword("3333");
//		user.setUserBirth("19991111");
//		user.setUserNickname("testddd");
//		user.setUserImage("11.jpg");
//		user.setAddr("��⵵");
//		user.setRole("user");
//		user.setPhone("01033334444");
//		user.setHoldpoint(1);
//		user.setMentorApply("Y");
//		user.setQuitStatus("N");
		
		user = userService.getUser("test@naver.com");

		//==> console Ȯ��
		System.out.println(user);
		
		//==> API Ȯ��
//		Assert.assertEquals("testUserId", user.getUserId());
//		Assert.assertEquals("testUserName", user.getUserName());
//		Assert.assertEquals("testPasswd", user.getPassword());
//		Assert.assertEquals("111-2222-3333", user.getPhone());
//		Assert.assertEquals("��⵵", user.getAddr());
//
//		Assert.assertNotNull(userService.getUser("user02"));
//		Assert.assertNotNull(userService.getUser("user05"));
	}
	
	//@Test
	public void testFindUserId() throws Exception{
		
		User user = new User();
	//	user.setUserNickname("testddd");
	//	user.setUserBirth("19991111");
	//	user.setPhone("01033334444");
		
		user = userService.findUserId("testddd");
		
		System.out.println(user);
	}
	//@Test
	 public void testUpdateUser() throws Exception{
		
		Career career = new Career();
		License license = new License();
		User user = userService.getUser("test@naver.com");
		Assert.assertNotNull(user);
		
		Assert.assertEquals("3333", user.getPassword());
		Assert.assertEquals("exchange", user.getUserName());
		Assert.assertEquals("testddd", user.getUserNickname());
		Assert.assertEquals("19991111", user.getUserBirth());
		Assert.assertEquals("�ȸ鵵", user.getAddr());
		Assert.assertEquals("01044449999", user.getPhone());
		Assert.assertEquals("Y", user.getMentorApply());
		
		Assert.assertEquals("ȸ��", career.getCompany());
	
		user.setPassword("4444");
		user.setUserName("change");
		user.setUserNickname("testa");
		user.setUserBirth("20001212");
		user.setAddr("���ֵ�");
		user.setPhone("01011119999");
		user.setMentorApply("N");
		
	//	user.setEmail("change@change.com");
		
		userService.updateUser(user);
		
		user = userService.getUser("test@naver.com");
		Assert.assertNotNull(user);
		
		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
//		Assert.assertEquals("change", user.getUserName());
//		Assert.assertEquals("01077776666", user.getPhone());
//		Assert.assertEquals("�︪��", user.getAddr());
	 }
	 
	//@Test
	public void testCheckDuplication() throws Exception{

		//==> �ʿ��ϴٸ�...
//			User user = new User();
//			user.setUserId("testUserId");
//			user.setUserName("testUserName");
//			user.setPassword("testPasswd");
//			user.setSsn("1111112222222");
//			user.setPhone("111-2222-3333");
//			user.setAddr("��⵵");
//			user.setEmail("test@test.com");
//			
//			userService.addUser(user);
		
		//==> console Ȯ��
		//System.out.println(userService.checkDuplication("testUserId"));
		//System.out.println(userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
	 	
		//==> API Ȯ��
		Assert.assertFalse( userService.checkDuplication("testUserId") );
	 	Assert.assertTrue( userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
		 	
	}
	
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	 //@Test
	 public void testGetUserListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetUserListByUserId() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("admin");
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetUserListByUserName() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("SCOTT");
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 
	 
	 @Test
	 public void testDeleteUser() throws Exception{
		 User user = userService.getUser("test@naver.com");
			Assert.assertNotNull(user);
			
			Assert.assertEquals("Y", user.getQuitStatus());
//			Assert.assertEquals(null, user.getQuitDate());
			
			
			user.setQuitStatus("N");
//			user.setQuitDate("2020/05/05");
						
			
			userService.deleteUser(user);
			
			user = userService.getUser("test@naver.com");
			Assert.assertNotNull(user);
			
			//==> console Ȯ��
			System.out.println(user);
	 }
	 
}