package com.sikon.service.cart;

import java.util.List;

import com.sikon.service.domain.Cart;


public interface CartDao {
	
	// INSERT
	public void addCart(Cart cartlist) throws Exception ;

	// SELECT LIST
	public List<Cart> getCartList(String userId) throws Exception ;

	//update
	public void updateCart(int cartNo, int quantity) throws Exception ;
		
	//delete
	public void deleteCart(int cartNo) throws Exception ;
	
	//find
	public Cart getCart(int cartNo) throws Exception ;
	
}