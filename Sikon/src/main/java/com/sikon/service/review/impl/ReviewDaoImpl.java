package com.sikon.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;
import com.sikon.service.review.ReviewDao;

//¸®ºä Dao CRUD ±¸Çö
@Repository("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public ReviewDaoImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addReview(Review review) throws Exception {
		System.out.println("review=" + review);
		sqlSession.insert("ReviewMapper.addReview", review);
	}

	public List<Review> getReviewList(Search search, int category, int textNo) throws Exception {
		System.out.println("search=" + search);
		System.out.println("category=" + category);
		System.out.println("textNo" + textNo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("category", category);
		map.put("textNo", textNo);

		return sqlSession.selectList("ReviewMapper.getReviewList", map);
	}

	public void updateReview(Review review) throws Exception {
		System.out.println("review=" + review);
		sqlSession.update("ReviewMapper.updateReview", review);

	}

	public void deleteReview(Review review) throws Exception {
		System.out.println("review=" + review);

		sqlSession.delete("ReviewMapper.deleteReview", review);

	}

	public int getTotalCount(Search search, int category, int textNo) throws Exception {
		System.out.println("search=" + search);
		System.out.println("category=" + category);
		System.out.println("textNo" + textNo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("category", category);
		map.put("textNo", textNo);
		return sqlSession.selectOne("ReviewMapper.getTotalCount", map);
	}

}