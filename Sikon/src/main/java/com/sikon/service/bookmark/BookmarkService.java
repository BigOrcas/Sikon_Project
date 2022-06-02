package com.sikon.service.bookmark;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Bookmark;

//책갈피에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface BookmarkService {

	//책갈피 등록
	public void addBookmark(Bookmark bookmark) throws Exception;

	//책갈피 리스트 조회
	public Map<String, Object> getBookmarkList(Search search,String userId) throws Exception;

	//책갈피 삭제
	public void deleteBookmark(int bookmarkNo) throws Exception;

}
