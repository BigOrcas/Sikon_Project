package com.sikon.service.purchase;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Purchase;


public interface PurchaseService {
	
	public void addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int tranNo) throws Exception;
	
	public Map<String, Object> getPurchaseList(Search search, String buyer) throws Exception;
	
	public Map<String, Object> getSaleList(Search search) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
}