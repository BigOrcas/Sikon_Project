package com.sikon.service.review;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;

//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface ReviewDao {

	// INSERT
	public void addReview(Review review) throws Exception;

	public List<Review> getReviewList(Search search,int category, int textNo) throws Exception;

	public Review getReview(int reviewNo) throws Exception;

	public void updateReview(Review review) throws Exception;

	public int getTotalCount(Search search,int textNo) throws Exception ;
	
	public void deleteReview(Review review) throws Exception;

}