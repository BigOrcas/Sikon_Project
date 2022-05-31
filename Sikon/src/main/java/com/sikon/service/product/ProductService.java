package com.sikon.service.product;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Product;


public interface ProductService {
	
	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public Map<String, Object> getProductList(Search searchVO) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
}