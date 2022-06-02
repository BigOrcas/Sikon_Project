package com.sikon.service.cart.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.service.domain.Cart;
import com.sikon.service.cart.CartDao;
import com.sikon.service.cart.CartService;


//==> 회원관리 서비스 구현
@Service("cartServiceImpl")
public class CartServiceImpl implements CartService{
	
	///Field
	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDao cartDao;
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	///Constructor
	public CartServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addCart(Cart cart) throws Exception {
		cartDao.addCart(cart);		
	}

	@Override
	public List<Cart> getCartList(String userId) throws Exception {
		
		return cartDao.getCartList(userId);	
	}

	@Override
	public void deleteCart(int cartNo) throws Exception {
		cartDao.deleteCart(cartNo);
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		
		cartDao.updateCart(cart);
	}

	@Override
	public Cart getCart(int cartNo) throws Exception {
		return cartDao.getCart(cartNo);
	}

}

