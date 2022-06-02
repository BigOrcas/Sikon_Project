package com.sikon.service.test;


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
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Purchase;
import com.sikon.service.domain.User;
import com.sikon.service.purchase.PurchaseService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Test
	public void testAddPurchase() throws Exception {
		
		User user = new User();
		user.setUserId("user@naver.com");
		
		Product product = new Product();
		product.setProdNo(10000);
		
		Purchase purchase = new Purchase();		
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		purchase.setSerialNo("2022060210000");
		purchase.setUsedCoupon("10% 할인쿠폰");
		purchase.setReceiverName("woong");
		purchase.setReceiverPhone("01012345678");
		purchase.setReceiverEmail("bit@naver.com");
		purchase.setDivyAddr("경기도 수원");
		purchase.setDivyMessage("문앞에 놓아주세요");
		purchase.setPurchaseQuantity(3);
		purchase.setUsedPoint(200);
		purchase.setUsedPoint(1350);
		purchase.setDivyFee(3000);		
		purchase.setPaymentOpt("KA");
		purchase.setDivyStatus("001");

		purchaseService.addPurchase(purchase);

	}

	
	//@Test
	public void testGetPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		//==> 필요하다면...
		purchase = purchaseService.getPurchase(10022);

		//==> console 확인
		System.out.println(purchase);
		
		//==> API 확인
		Assert.assertEquals(10022, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user01", purchase.getBuyer().getUserId());

		Assert.assertNotNull(purchaseService.getPurchase(10022));
	}
	
	
	
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 
		Purchase purchase = purchaseService.getPurchase(10022);
		
		Assert.assertNotNull(purchase);		
		Assert.assertEquals("woong", purchase.getReceiverName());


		purchase.setReceiverName("woong");
		purchase.setReceiverPhone("01098765432");
		purchase.setReceiverEmail("camp@gmail.com");
		purchase.setDivyAddr("강남역");
		purchase.setDivyMessage("경비실에 맡겨주세요");
		
		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10022);
		
		//==> console 확인
		System.out.println(purchase);
			
		//==> API 확인
		
		Assert.assertEquals("woong", purchase.getReceiverName());
		Assert.assertEquals("강남역", purchase.getDivyAddr());
		
		
	 }
	 

	//@Test
	public void testUpdateDivyStatus() throws Exception{
		
		Purchase purchase = purchaseService.getPurchase(10022);

		System.out.println("1: "+purchase);
		
		Assert.assertEquals("003", purchase.getDivyStatus());
		
		purchase.setDivyStatus("004");
		purchase.setInvoiceNum("2022060210022");
		
		System.out.println("2: "+purchase);
		
		purchaseService.updateDivyStatus(purchase);
		
		purchase = purchaseService.getPurchase(10022);
		
		System.out.println("3: "+purchase);
			
		//==> API 확인
		Assert.assertEquals("004", purchase.getDivyStatus());
				
	 }
	
	//@Test
	public void testUpdateStock() throws Exception{
		
		Purchase purchase = purchaseService.getPurchase(10022);
		
		Assert.assertEquals("003", purchase.getDivyStatus());

		
		int purchaseQuantity = purchase.getPurchaseQuantity();
		int prodNo = purchase.getPurchaseProd().getProdNo();
		
		
		System.out.println("1: "+purchaseQuantity);	
		System.out.println("2: "+prodNo);	
		
		
		purchaseService.updateStock(purchaseQuantity,prodNo);
		
		purchase = purchaseService.getPurchase(10022);
		
		System.out.println("3: "+purchase);
			
		//==> API 확인
		Assert.assertEquals("003", purchase.getDivyStatus());
				
	 }
	
	//@Test
	public void testCancelOrder() throws Exception{
		
		Purchase purchase = purchaseService.getPurchase(10022);
		
		Assert.assertEquals("003", purchase.getDivyStatus());

		
		int purchaseQuantity = purchase.getPurchaseQuantity();
		int prodNo = purchase.getPurchaseProd().getProdNo();
		
		
		System.out.println("1: "+purchaseQuantity);	
		System.out.println("2: "+prodNo);	
		
		
		purchaseService.cancelOrder(purchaseQuantity,prodNo);
		
		purchase = purchaseService.getPurchase(10022);
		
		System.out.println("3: "+purchase);
			
		//==> API 확인
		Assert.assertEquals("003", purchase.getDivyStatus());
				
	 }
	 

	 //@Test
	 public void testGetPurchaseListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	String buyerId="user01";
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(2, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(2, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }

}