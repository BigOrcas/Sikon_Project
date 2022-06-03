package com.sikon.service.review.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sikon.common.Search;
import com.sikon.service.domain.Cook;
import com.sikon.service.domain.Ingredient;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.Review;
import com.sikon.service.domain.User;
import com.sikon.service.review.ReviewService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class ReviewServiceTest {

	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	//@Test
	public void testAddReview() throws Exception {

//		// Review
		Review review = new Review();
		review.setWriterNickname("user");
		review.setReviewContent("리뷰");
		review.setReviewCategory("100");
		Recipe recipe = new Recipe();
		recipe.setRecipeNo(10002);
		review.setRecipe(recipe);
		review.setReviewImg("aa.jpg");

//		// Review
//		Review review = new Review();
//		review.setWriterNickname("mentor");
//		review.setReviewContent("프로덕트");
//		review.setReviewCategory("200");
//		Product product=new Product();
//		product.setProdNo(10000);
//		review.setProduct(product);
//		review.setReviewImg("aa.jpg");

		// Review
//		Review review = new Review();
//		review.setWriterNickname("mentor");
//		review.setReviewContent("클래스");
//		review.setReviewCategory("300");
//		Cook cook=new Cook();
//		cook.setCookNo(10000);
//		review.setCook(cook);
//		review.setReviewImg("aa.jpg");
//
		reviewService.addReview(review);

	}

	//	@Test
		public void testUpdateReview() throws Exception {

			// Review
			Review review = new Review();
			review.setReviewContent("수정");
			review.setReviewImg("a/jpg");
			review.setReviewNo(10000);

			reviewService.updateReview(review);

		}
		
		//@Test
		 public void testGetReviewListAll() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	Map<String,Object> map = reviewService.getReviewList(search,200,10002);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	
			//==> console 확인
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 }

}
