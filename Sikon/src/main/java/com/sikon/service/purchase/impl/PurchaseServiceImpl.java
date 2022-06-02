package com.sikon.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Purchase;
import com.sikon.service.purchase.PurchaseService;
import com.sikon.service.purchase.PurchaseDao;;


//==> 회원관리 서비스 구현
@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	///Field
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	///Constructor
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.getPurchase(tranNo);
	}

	public Map<String , Object > getPurchaseList(Search search, String buyerId) throws Exception {
		List<Purchase> list= purchaseDao.getPurchaseList(search, buyerId);
		int totalCount = purchaseDao.getTotalCount(search, buyerId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String , Object > getSalesList(Search search) throws Exception {
		List<Purchase> list= purchaseDao.getSalesList(search);
		int totalCount = purchaseDao.getTotalCount2(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}
	
	public void updateDivyStatus(Purchase purchase) throws Exception {
		purchaseDao.updateDivyStatus(purchase);
	}
	
	public void updateStock(int purchaseQuantity, int prodNo) throws Exception {
		purchaseDao.updateStock(purchaseQuantity, prodNo);
	}
	
	public void cancelOrder(int purchaseQuantity, int prodNo) throws Exception {
		purchaseDao.cancelOrder(purchaseQuantity, prodNo);
	}

	
}