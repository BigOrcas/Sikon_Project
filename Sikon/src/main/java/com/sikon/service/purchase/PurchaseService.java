package com.sikon.service.purchase;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Purchase;



public interface PurchaseService {
	
	public void addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int tranNo) throws Exception;
	 
	public Map<String , Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	public Map<String , Object > getSalesList(Search search) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateDivyStatus(Purchase purchase) throws Exception;
	
	public void updateStock(int purchaseQuantity, int prodNo) throws Exception;
	
	public void cancelOrder(int purchaseQuantity, int prodNo) throws Exception;
	
}