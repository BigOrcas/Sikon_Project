package com.sikon.service.bookmark.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.bookmark.BookmarkDao;
import com.sikon.service.domain.Bookmark;

//책갈피 DAO CRUD 구현
@Repository("bookmarkDaoImpl")
public class BookmarkDaoImpl implements BookmarkDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public BookmarkDaoImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addBookmark(Bookmark bookmark) throws Exception {
		System.out.println("bookmark="+bookmark);
		sqlSession.insert("BookmarkMapper.addBookmark", bookmark);
	}


	public List<Bookmark> getBookmarkList(Search search, String userId) throws Exception {
		System.out.println("userid="+userId+"search="+search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);

		List list = sqlSession.selectList("BookmarkMapper.getBookmarkList", map);
		System.out.println("list=" + list);
		return list;
	}

	public void deleteBookmark(int bookmarkNo) throws Exception {
		System.out.println("bookmarkNo="+bookmarkNo);
		sqlSession.delete("BookmarkMapper.deleteBookmark", bookmarkNo);
	}

	public int getTotalCount(Search search, String userId) throws Exception {
		System.out.println("userid="+userId+"search="+search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		return sqlSession.selectOne("BookmarkMapper.getTotalCount", map);

	}

}