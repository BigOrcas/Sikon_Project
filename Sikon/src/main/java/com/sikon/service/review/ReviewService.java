package com.sikon.service.review;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;

//���信�� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ReviewService {

	//���� ���
	public void addReview(Review review) throws Exception;

	//���� ����Ʈ ��ȸ
	public Map<String, Object> getReviewList(Search search,int category, int textNo) throws Exception;

	//���� ����
	public void updateReview(Review review) throws Exception;

	//���� ����
	public void deleteReview(Review review) throws Exception;


}
