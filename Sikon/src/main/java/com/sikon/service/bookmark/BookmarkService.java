package com.sikon.service.bookmark;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Bookmark;

public interface BookmarkService {

	public void addBookmark(Bookmark bookmark) throws Exception;

	public Map<String, Object> getBookmarkList(Search search,String userId) throws Exception;

	public Bookmark getBookmark(int bookmarkNo) throws Exception;

	public void deleteBookmark(Bookmark bookmark) throws Exception;

}
