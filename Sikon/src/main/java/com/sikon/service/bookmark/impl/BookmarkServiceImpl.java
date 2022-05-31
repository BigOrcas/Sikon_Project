package com.sikon.service.bookmark.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.bookmark.BookmarkDao;
import com.sikon.service.bookmark.BookmarkService;
import com.sikon.service.domain.Bookmark;;

//==> 회원관리 서비스 구현
@Service("bookmarkServiceImpl")
public class BookmarkServiceImpl implements BookmarkService {

	/// Field
	@Autowired
	@Qualifier("bookmarkDaoImpl")
	private BookmarkDao bookmarkDao;

	public void setBookmarkDao(BookmarkDao bookmarkDao) {
		this.bookmarkDao = bookmarkDao;
	}

	/// Constructor
	public BookmarkServiceImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addBookmark(Bookmark bookmark) throws Exception {
		// TODO Auto-generated method stub
		bookmarkDao.addBookmark(bookmark);
	}

	public Map<String, Object> getBookmarkList(Search search,String userId) throws Exception {
		// TODO Auto-generated method stub
		List<Bookmark> list = bookmarkDao.getBookmarkList(search,userId);
		int totalCount = bookmarkDao.getTotalCount(search,userId);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		System.out.println(list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void deleteBookmark(Bookmark bookmark) throws Exception {
		// TODO Auto-generated method stub
		bookmarkDao.deleteBookmark(bookmark);

	}

	@Override
	public Bookmark getBookmark(int bookmarkNo) throws Exception {
		// TODO Auto-generated method stub
		return bookmarkDao.getBookmark(bookmarkNo);
	}

}