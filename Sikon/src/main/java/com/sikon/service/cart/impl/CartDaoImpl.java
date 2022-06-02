package com.sikon.service.cart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.service.domain.Cart;
import com.sikon.service.cart.CartDao;



@Repository("cartDaoImpl")
public class CartDaoImpl implements CartDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CartDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addCart(Cart cart) throws Exception {
		sqlSession.insert("CartMapper.addCart", cart);
	}

	@Override
	public List<Cart> getCartList(String userId) throws Exception {
		
		return sqlSession.selectList("CartMapper.getCartList", userId);
	}

	@Override
	public void deleteCart(int cartNo) throws Exception {
		sqlSession.delete("CartMapper.deleteCart",cartNo);
	}

	@Override
	public void updateCart(Cart cart) throws Exception {		
		sqlSession.update("CartMapper.updateCart",cart);
	}

	@Override
	public Cart getCart(int cartNo) throws Exception {
		return sqlSession.selectOne("CartMapper.getCart", cartNo);
	}

}