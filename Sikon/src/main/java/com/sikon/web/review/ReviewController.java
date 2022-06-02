package com.sikon.web.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sikon.service.domain.Product;
import com.sikon.service.domain.Purchase;
import com.sikon.service.domain.Review;
import com.sikon.service.product.ProductService;
import com.sikon.service.purchase.PurchaseService;
import com.sikon.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	public ReviewController() {
		System.out.println("╬х©м?");
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addReview", method=RequestMethod.POST )
	public ModelAndView addReview(@ModelAttribute("review") Review review,@RequestParam("tranNo") int tranNo) throws Exception {

		System.out.println("/review/addReview : POST");
		System.out.println("tranNo="+tranNo);
		
		Purchase purchase=purchaseService.getPurchase(tranNo);
		System.out.println("©╗"+purchase);
		review.setWriterNickname(purchase.getBuyer().getUserId());
		review.setProduct(purchase.getPurchaseProd());
		
	    reviewService.addReview(review);
	    
	    Product product=productService.getProduct(purchase.getPurchaseProd().getProdNo());
	  //  product.setReviewNum(product.getReviewNum()+1);
		System.out.println("га╥н"+product);
	    productService.updateProduct(product);
	    
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("forward:/review/getReview.jsp");
		
		return modelAndView;
	}
	
	
	
}