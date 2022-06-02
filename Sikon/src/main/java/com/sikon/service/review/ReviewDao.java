package com.sikon.service.review;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;

//¸®ºä¿¡¼­ CRUD Ãß»óÈ­/Ä¸½¶È­ÇÑ DAO Interface Definition
public interface ReviewDao {

	// INSERT
	public void addReview(Review review) throws Exception;

	//SELECT LIST
	public List<Review> getReviewList(Search search,int category, int textNo) throws Exception;

	//UPDATE
	public void updateReview(Review review) throws Exception;

	//DELETE
	public void deleteReview(Review review) throws Exception;
	
	//SELECT ROW Count
	public int getTotalCount(Search search,int category,int textNo) throws Exception ;

}