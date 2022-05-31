package com.sikon.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.purchase.PurchaseService;
import com.sikon.service.purchase.dao.PurchaseDAO;
import com.sikon.service.domain.Purchase;


@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	///Field
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDAO purchaseDao;

	public void setPurchaseDao(PurchaseDAO purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	
	/// Constructor
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}


	///Method
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.insertPurchase(purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.findPurchase(tranNo);
	}

	public Map<String, Object> getPurchaseList(Search search, String buyer) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buyer", buyer);
		map.put("search", search);
		
		List<Purchase> list= purchaseDao.getPurchaseList(map);
		int totalCount = purchaseDao.getPurchaseTotalCount(buyer);
		
		System.out.println(list);
		
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String, Object> getSaleList(Search search) throws Exception {
		List<Purchase> list= purchaseDao.getSaleList(search);
		int totalCount = purchaseDao.getSaleTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);
	}

}