package com.sikon.service.heart.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.service.domain.Heart;
import com.sikon.service.heart.HeartDao;
import com.sikon.service.heart.HeartService;
import com.sikon.service.cook.CookService;






@Service("heartServiceImpl")
public class HeartServiceImpl implements HeartService{
	
	///Field
	@Autowired
	@Qualifier("heartDaoImpl")
	private HeartDao heartDao;
	public void setHeartDao(HeartDao heartDao) {
		this.heartDao = heartDao;
	}
	
	///Constructor
	public HeartServiceImpl() {
		System.out.println(this.getClass());
	}
	


	@Override
	public void updateHeart(int cookNo) throws Exception{
		heartDao.updateHeart(cookNo);
	}
	
	@Override
	public void updateHeartCancel(int cookNo) throws Exception{
		heartDao.updateHeartCancel(cookNo);
	}

	
	@Override
	public void insertHeart(int cookNo,String userId) throws Exception{
		heartDao.insertHeart(cookNo, userId);
	}
	
	@Override
	public void deleteHeart(int cookNo,String userId)throws Exception{
		heartDao.deleteHeart(cookNo, userId);
	}
	
	@Override
	public int heartCheck(int cookNo,String userId) throws Exception{
		return heartDao.heartCheck(cookNo, userId);
	}
	
	@Override
	public void updateHeartCheck(int cookNo,String userId)throws Exception{
		heartDao.updateHeartCheck(cookNo, userId);
	}
	
	@Override
	public void updateHeartCheckCancel(int cookNo,String userId)throws Exception{
		System.out.println(cookNo);
		System.out.println(userId);
		heartDao.updateHeartCheckCancel(cookNo, userId);
	}
	

	

	

}