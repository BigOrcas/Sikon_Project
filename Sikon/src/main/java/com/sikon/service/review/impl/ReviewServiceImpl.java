package com.sikon.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;
import com.sikon.service.review.ReviewDao;
import com.sikon.service.review.ReviewService;;


//==> 회원관리 서비스 구현
@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService{
	
	///Field
	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	///Constructor
	public ReviewServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addReview(Review review) throws Exception {
		reviewDao.addReview(review);
		System.out.println("오오");
	}

	public Review getReview(int reviewNo) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.getReview(reviewNo);
	}

	public Map<String, Object> getReviewList(Search search,int category, int textNo) throws Exception{
		List<Review> list= reviewDao.getReviewList(search,category,textNo);
		int totalCount = reviewDao.getTotalCount(search,textNo);
		System.out.println("serviceimpl"+textNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		System.out.println(list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateReview(Review review) throws Exception {
		reviewDao.updateReview(review);
		
	}

	@Override
	public void deleteReview(Review review) throws Exception {
		reviewDao.deleteReview(review);
		
	}





	
}