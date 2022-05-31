package com.sikon.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Product;
import com.sikon.service.product.ProductDAO;


@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDAO {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	/// insertProduct Method
	public void insertProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	/// findProduct Method
	public Product findProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.findProduct", prodNo);
	}

	/// getProductList Method
	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	/// updateProduct Method
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount) return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
}