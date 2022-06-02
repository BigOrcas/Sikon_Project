package com.sikon.service.bookmark;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Bookmark;

//책갈피에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface BookmarkDao {

	// INSERT
	public void addBookmark(Bookmark bookmark) throws Exception;
	
	//SELECT LIST
	public List<Bookmark> getBookmarkList(Search search,String userId) throws Exception;

	//DELETE
	public void deleteBookmark(int bookmarkNo) throws Exception;

	//SELECT ROW Count
	public int getTotalCount(Search search,String userId) throws Exception ;
	
}