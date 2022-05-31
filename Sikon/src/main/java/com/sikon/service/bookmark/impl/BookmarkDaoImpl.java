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

//==> 雀盔包府 DAO CRUD 备泅
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
		// TODO Auto-generated method stub
		sqlSession.insert("BookmarkMapper.addBookmark", bookmark);

	}

	public List<Bookmark> getBookmarkList(Search search,String userId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		List list=sqlSession.selectList("BookmarkMapper.getBookmarkList", map);
		System.out.println("府"+list);
//		Map map1=(Map)list.get(0);
		return list;
	}

	public void deleteBookmark(Bookmark bookmark) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("BookmarkMapper.deleteBookmark", bookmark);

	}



	@Override
	public int getTotalCount(Search search,String userId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId",userId);
		return sqlSession.selectOne("BookmarkMapper.getTotalCount", map);

		}

	@Override
	public Bookmark getBookmark(int bookmarkNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookmarkMapper.getBookmark", bookmarkNo);
	}

}