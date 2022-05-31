package com.sikon.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Product;
import com.sikon.service.product.ProductService;
import com.sikon.service.product.ProductDao;



@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService{
	
	///Field
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	///Constructor
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
	}

	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}
	
	
	public void updateProduct(Product product) throws Exception {
		System.out.println("업데이트 시작: " + product);
		productDao.updateProduct(product);
		System.out.println("업데이트 완료");
	}
	

	public Map<String , Object > getProductList(Search search) throws Exception {
		List<Product> list= productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
			
		return map;
	}
	

	public Map<String , Object> getProdNames(Search search) throws Exception{
		
		List<Product> list= productDao.getProdNames(search);	
		
		Map map = new HashMap<String, Object>();
		map.put("list", list );
		
		return map;
	}

	
}