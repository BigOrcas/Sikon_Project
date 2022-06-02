package com.sikon.service.user.test;

import java.sql.Date;
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
 * し JUnit4 (Test Framework) 引 Spring Framework 搭杯 Test( Unit Test)
 * し Spring 精 JUnit 4研 是廃 走据 適掘什研 搭背 什覗元 奄鋼 搭杯 砺什闘 坪球研 拙失 拝 呪 赤陥.
 * し @RunWith : Meta-data 研 搭廃 wiring(持失,DI) 拝 梓端 姥薄端 走舛
 * し @ContextConfiguration : Meta-data location 走舛
 * し @Test : 砺什闘 叔楳 社什 走舛
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 研 陥丞馬惟 Wiring 馬切...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class UserServiceTest {

	//==>@RunWith,@ContextConfiguration 戚遂 Wiring, Test 拝 instance DI
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Test
	public void testAddUser() throws Exception {
		
		User user = new User();
		Career career = new Career();
		License license = new License();
		
		user.setUserId("testUserId");
		user.setUserName("testUserName");
		user.setPassword("testPasswd");
		user.setUserBirth("19991111");
		user.setUserNickname("testddd");
		user.setUserImage("11.jpg");
		user.setAddr("井奄亀");
		user.setRole("user");
		user.setPhone("01033334444");
		user.setHoldpoint(1);
		user.setMentorApply("N");
		user.setQuitStatus("N");
		career.setCareerNo(
		career.setCompany("悪害");
		career.setCareerExperience("ししししししし");
		career.setStartDate(new Date(2017/11/25));
		career.setEndDate(new Date(2018/10/22));
		license.setLicenseName("1曽左搭");
		license.setLicenseInstitution("悪害姥短");
		license.setLicenseDate(new Date(2019/02/03));
		
		
		
		
		userService.addUser(user);
		userService.addCareer(career);
		userService.addLicense(license);
		
		user = userService.getUser("testUserId");
	//	career = userService.get
		
		//==> console 溌昔
		System.out.println(user);
		
		//==> API 溌昔
		Assert.assertEquals("testUserId", user.getUserId());
		Assert.assertEquals("testUserName", user.getUserName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("19991111", user.getUserBirth());
		Assert.assertEquals("testddd", user.getUserNickname());
		Assert.assertEquals("11.jpg", user.getUserImage());
		Assert.assertEquals("user", user.getAddr());
		Assert.assertEquals("井奄亀", user.getRole());
		Assert.assertEquals("01033334444", user.getPhone());
		Assert.assertEquals(1, user.getHoldpoint());
		Assert.assertEquals("N", user.getMentorApply());
		Assert.assertEquals("悪害", career.getCompany());
		Assert.assertEquals("ししししししし", career.getCareerExperience());
		Assert.assertEquals("2017/11/25", career.getStartDate());
		Assert.assertEquals("2018/10/22", career.getEndDate());
		Assert.assertEquals("1曽左搭", license.getLicenseName());
		Assert.assertEquals("悪害姥短", license.getLicenseInstitution());
		Assert.assertEquals("2019/02/03", license.getLicenseDate());
	}
	
	//@Test
	public void testGetUser() throws Exception {
		
		User user = new User();
		//==> 琶推馬陥檎...
//			user.setUserId("testUserId");
//			user.setUserName("testUserName");
//			user.setPassword("testPasswd");
//			user.setSsn("1111112222222");
//			user.setPhone("111-2222-3333");
//			user.setAddr("井奄亀");
//			user.setEmail("test@test.com");
		
		user = userService.getUser("testUserId");

		//==> console 溌昔
		//System.out.println(user);
		
		//==> API 溌昔
		Assert.assertEquals("testUserId", user.getUserId());
		Assert.assertEquals("testUserName", user.getUserName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("111-2222-3333", user.getPhone());
		Assert.assertEquals("井奄亀", user.getAddr());
		Assert.assertEquals("test@test.com", user.getEmail());

		Assert.assertNotNull(userService.getUser("user02"));
		Assert.assertNotNull(userService.getUser("user05"));
	}
	
	//@Test
	 public void testUpdateUser() throws Exception{
		 
		User user = userService.getUser("testUserId");
		Assert.assertNotNull(user);
		
		Assert.assertEquals("testUserName", user.getUserName());
		Assert.assertEquals("111-2222-3333", user.getPhone());
		Assert.assertEquals("井奄亀", user.getAddr());
		Assert.assertEquals("test@test.com", user.getEmail());

		user.setUserName("change");
		user.setPhone("777-7777-7777");
		user.setAddr("change");
		user.setEmail("change@change.com");
		
		userService.updateUser(user);
		
		user = userService.getUser("testUserId");
		Assert.assertNotNull(user);
		
		//==> console 溌昔
		//System.out.println(user);
			
		//==> API 溌昔
		Assert.assertEquals("change", user.getUserName());
		Assert.assertEquals("777-7777-7777", user.getPhone());
		Assert.assertEquals("change", user.getAddr());
		Assert.assertEquals("change@change.com", user.getEmail());
	 }
	 
	//@Test
	public void testCheckDuplication() throws Exception{

		//==> 琶推馬陥檎...
//			User user = new User();
//			user.setUserId("testUserId");
//			user.setUserName("testUserName");
//			user.setPassword("testPasswd");
//			user.setSsn("1111112222222");
//			user.setPhone("111-2222-3333");
//			user.setAddr("井奄亀");
//			user.setEmail("test@test.com");
//			
//			userService.addUser(user);
		
		//==> console 溌昔
		//System.out.println(userService.checkDuplication("testUserId"));
		//System.out.println(userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
	 	
		//==> API 溌昔
		Assert.assertFalse( userService.checkDuplication("testUserId") );
	 	Assert.assertTrue( userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
		 	
	}
	
	 //==>  爽汐聖 熱壱 叔楳馬檎....
	 //@Test
	 public void testGetUserListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 溌昔
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
	 	
	 	//==> console 溌昔
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
	 	
		//==> console 溌昔
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 溌昔
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
	 	
		//==> console 溌昔
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 溌昔
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 
}