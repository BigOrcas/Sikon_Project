package com.sikon.service.purchase;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Purchase;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface PurchaseDao {
	
	// INSERT
	public void addPurchase(Purchase purchase) throws Exception ;

	// SELECT ONE
	public Purchase getPurchase(int tranNo) throws Exception ;

	// SELECT LIST
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception ;
	
	public List<Purchase> getSalesList(Search search) throws Exception ;

	// UPDATE
	public void updatePurchase(Purchase purchase) throws Exception ;
	
	public void updateDivyStatus(Purchase purchase) throws Exception ;
	
	public void updateStock(int purchaseQuantity, int prodNo) throws Exception ;
	
	public void cancelOrder(int purchaseQuantity, int prodNo) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search, String buyerId) throws Exception ;
	
	public int getTotalCount2(Search search) throws Exception ;
	
}