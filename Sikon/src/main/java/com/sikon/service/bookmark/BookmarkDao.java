package com.sikon.service.bookmark;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Bookmark;

//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface BookmarkDao {

	// INSERT
	public void addBookmark(Bookmark bookmark) throws Exception;

	public List<Bookmark> getBookmarkList(Search search,String userId) throws Exception;

	public Bookmark getBookmark(int bookmarkNo) throws Exception;


	public void deleteBookmark(Bookmark bookmark) throws Exception;

	public int getTotalCount(Search search,String userId) throws Exception ;
	
}