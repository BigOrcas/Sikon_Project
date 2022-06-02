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


import com.sikon.service.cart.CartService;
import com.sikon.service.domain.Cart;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.User;
import com.sikon.service.product.ProductService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class CartServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	
	
	
	//method
	//@Test
	public void testAddCart() throws Exception {
		
		Product product = productService.getProduct(10007);		
		
		Cart cart = new Cart();		
		cart.setCartProd(product);
		cart.setQuantity(5);
		cart.setUserId("user01");
		
		cartService.addCart(cart);

	}

	
	//@Test
	public void testGetCart() throws Exception {
		
		Cart cart = cartService.getCart(10020);

		System.out.println(cart);
		
		//==> API 확인
		Assert.assertEquals(10020, cart.getCartNo());
		Assert.assertEquals("user01", cart.getUserId());
		Assert.assertEquals(10020, cart.getCartProd().getProdNo());

		Assert.assertNotNull(cartService.getCart(10020));
	}
	
	

	//@Test
	 public void testUpdateCart() throws Exception{
		 
		Cart cart = cartService.getCart(10020);
		
		Assert.assertNotNull(cart);		
		Assert.assertEquals(10020, cart.getCartNo());

		cart.setQuantity(7);
		
		System.out.println("1: "+cart);
		
		cartService.updateCart(cart);
		
		cart = cartService.getCart(10020);
		
		//==> console 확인
		System.out.println("2: "+cart);
			
		//==> API 확인
		
		Assert.assertEquals(10020, cart.getCartNo());
		Assert.assertEquals(7, cart.getQuantity());
		
		
	 }
	 

	@Test
	public void testDeleteCart() throws Exception{

		cartService.deleteCart(10020);
		
		Assert.assertNull(cartService.getCart(10020));
	 }
	

	 //@Test
	 public void testGetCartList() throws Exception{
		 
	 	
	 	String userId="user01";
	 	List<Cart> list = cartService.getCartList(userId);
	 	
	 	Assert.assertEquals(2, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 }

}