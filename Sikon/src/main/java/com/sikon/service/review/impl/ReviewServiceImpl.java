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

//리뷰 서비스 구현
@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	/// Field
	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;

	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}

	/// Constructor
	public ReviewServiceImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addReview(Review review) throws Exception {
		System.out.println("review=" + review);
		reviewDao.addReview(review);
	}

	public Map<String, Object> getReviewList(Search search, int category, int textNo) throws Exception {
		System.out.println("search=" + search);
		System.out.println("category=" + category);
		System.out.println("textNo" + textNo);
		
		List<Review> list = reviewDao.getReviewList(search, category, textNo);
		int totalCount = reviewDao.getTotalCount(search, category, textNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		System.out.println("list="+list);

		return map;
	}

	public void updateReview(Review review) throws Exception {
		System.out.println("review=" + review);
		reviewDao.updateReview(review);

	}

	public void deleteReview(Review review) throws Exception {
		System.out.println("review=" + review);
		reviewDao.deleteReview(review);

	}

}