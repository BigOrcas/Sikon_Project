package com.sikon.service.review;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;

//리뷰에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface ReviewService {

	//리뷰 등록
	public void addReview(Review review) throws Exception;

	//리뷰 리스트 조회
	public Map<String, Object> getReviewList(Search search,int category, int textNo) throws Exception;

	//리뷰 수정
	public void updateReview(Review review) throws Exception;

	//리뷰 삭제
	public void deleteReview(Review review) throws Exception;


}
