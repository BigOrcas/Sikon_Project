package com.sikon.service.bookmark;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Bookmark;

//å���ǿ��� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
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