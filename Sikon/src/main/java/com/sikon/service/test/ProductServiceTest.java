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

import com.sikon.common.Search;
import com.sikon.service.domain.Product;
import com.sikon.service.product.ProductService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	//@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		product.setProdName("���");
		product.setProdThumbnail("���.jpg");
		product.setProdContent("���content");
		product.setProdDetail("��ε�����");
		product.setProdStock(20);
		product.setProdTheme("MK");
		product.setProdPrice(30000);
		product.setProdDisRate(0.1);
		product.setProdDisPrice(27000);
		product.setProdStatus("Y");
		product.setCouponApply("Y");
		
		System.out.println(product);
		System.out.println("add ����");
		productService.addProduct(product);
		System.out.println("add ��");
	}
	
	//@Test
	public void testGetProduct() throws Exception {
		
		System.out.println("����");
		Product product = new Product();
		//==> �ʿ��ϴٸ�...
		product = productService.getProduct(10020);

		//==> console Ȯ��
		System.out.println(product);
		
		//==> API Ȯ��
		Assert.assertEquals(10020, product.getProdNo());

		Assert.assertNotNull(productService.getProduct(10020));
	}
	
	//@Test
	 public void testUpdateProduct() throws Exception{
		 
		 Product product = productService.getProduct(10020);
		Assert.assertNotNull(product);
		
		Assert.assertEquals("���", product.getProdName());
		Assert.assertEquals("��ε�����", product.getProdDetail());

		product.setProdNo(10020);
		product.setProdName("���");
		product.setProdThumbnail("���.jpg");
		product.setProdContent("���content");
		product.setProdDetail("��ε�����");
		product.setProdStock(40);
		product.setProdTheme("CW");
		product.setProdPrice(30000);
		product.setProdDisRate(0.1);
		product.setProdDisPrice(27000);
		product.setProdStatus("N");
		product.setCouponApply("N");
		
		productService.updateProduct(product);
		
		product = productService.getProduct(10020);
		Assert.assertNotNull(product);
		
		//==> console Ȯ��
		System.out.println(product);
			
		//==> API Ȯ��
		Assert.assertEquals("���", product.getProdName());
		Assert.assertEquals("��ε�����", product.getProdDetail());
	 }
	 
	
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	 //@Test
	 public void testGetProductListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetProductListByProdNo() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("20");
	 	
	 	System.out.println("Test Search: "+search);
	 	
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("20");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetProductListByProdNames() throws Exception{
		 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	Map<String,Object> map = productService.getProdNames(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(1, list.size());
		 	
			//==> console Ȯ��
		 	System.out.println(list);
		 	
		 	
		 	System.out.println("=======================================");
		 	
		 	map = productService.getProdNames(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(0, list.size());
		 	
			//==> console Ȯ��
		 	System.out.println(list);
		 	
		 }
	 
	 	@Test
		 public void testGetProductListByprodPrice() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("2");
		 	search.setSearchKeyword("3000");
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(3, list.size());
		 	
			//==> console Ȯ��
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("2");
		 	search.setSearchKeyword("3000");
		 	map = productService.getProductList(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(0, list.size());
		 	
			//==> console Ȯ��
		 	System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 }	 
}