package com.sikon.service.heart;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.User;
import com.sikon.service.domain.Heart;

public interface HeartService {

public void updateHeart (int cookNo) throws Exception;
	
	public void updateHeartCancel(int cookNo) throws Exception;
	
	
	public void insertHeart(int cookNo,String userId) throws Exception;
	
	public void deleteHeart(int cookNo,String userId) throws Exception;
	
	public int heartCheck(int cookNo,String userId) throws Exception;
	
	public void updateHeartCheck(int cookNo,String userId) throws Exception;
	
	public void updateHeartCheckCancel(int cookNo,String userId) throws Exception;

}
