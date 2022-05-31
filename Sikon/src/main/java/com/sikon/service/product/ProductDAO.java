package com.sikon.service.product;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Product;


public interface ProductDAO {
	
	public void insertProduct(Product product) throws Exception;
	
	public Product findProduct(int prodNo) throws Exception;
	
	public List<Product> getProductList(Search search) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}