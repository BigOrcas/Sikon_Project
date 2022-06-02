package com.sikon.service.cart;

import java.util.List;



import com.sikon.service.domain.Cart;

 
public interface CartService {
	
	
	public void addCart(Cart cart) throws Exception;
	
	
	public List<Cart> getCartList(String userId) throws Exception;
	
	
	public void updateCart(Cart cart) throws Exception;
	
	
	public void deleteCart(int cartNo) throws Exception;
		
	
	public Cart getCart(int cartNo) throws Exception ;
	
}