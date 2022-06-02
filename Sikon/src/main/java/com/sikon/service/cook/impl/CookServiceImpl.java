package com.sikon.service.cook.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Cook;
import com.sikon.service.cook.CookDao;
import com.sikon.service.cook.CookService;



//==> 회원관리 서비스 구현
@Service("cookServiceImpl")
public class CookServiceImpl implements CookService{
	
	///Field
	@Autowired
	@Qualifier("cookDaoImpl")
	private CookDao cookDao;
	public void setCookDao(CookDao cookDao) {
		this.cookDao = cookDao;
	}
	
	///Constructor
	public CookServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addCook(Cook cook) throws Exception {
		
		cookDao.addCook(cook);
	}

	public Cook getCook(int cookNo) throws Exception {
		return cookDao.getCook(cookNo);
	}

	public Map<String, Object> getCookList(Search search) throws Exception {
		List<Cook> list= cookDao.getCookList(search);
		int totalCount = cookDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		System.out.println(list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateCook(Cook cook) throws Exception {
		cookDao.updateCook(cook);
	}
	
	public void deleteCook(int cookNo) throws Exception {
		cookDao.deleteCook(cookNo);
	}
	


		
}