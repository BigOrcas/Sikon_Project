package com.sikon.service.domain;


public class Cart {
	
	private int cartNo;
	private Product cartProd;
	private String userId;
	private int quantity;
	


	public Cart(){
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}	

	public Product getCartProd() {
		return cartProd;
	}

	public void setCartProd(Product cartProd) {
		this.cartProd = cartProd;
	}

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}





	public String toString() {
		return "Cart :"+"[cartNo: "+cartNo+", userId: "+userId+", cartProd: "+cartProd+", quantity: "+quantity +"]";
	}
}