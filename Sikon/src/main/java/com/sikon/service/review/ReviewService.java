package com.sikon.service.review;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;

public interface ReviewService {

	public void addReview(Review review) throws Exception;

	public Map<String, Object> getReviewList(Search search,int category, int textNo) throws Exception;

	public Review getReview(int reviewNo) throws Exception;

	public void updateReview(Review review) throws Exception;

	public void deleteReview(Review review) throws Exception;

}
