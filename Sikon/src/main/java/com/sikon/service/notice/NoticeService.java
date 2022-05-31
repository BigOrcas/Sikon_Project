package com.sikon.service.notice;

import com.sikon.common.Search;
import com.sikon.service.domain.Notice;
import com.sikon.service.domain.User;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	//공지사항 등록
	public void addNotice(Notice notice) throws Exception;
	
	public Notice getNotice(int noticeNo) throws Exception;
	
	public Map<String , Object > getNoticeList(Search search) throws Exception;
	
	//updateNotice
	public void updateNotice(Notice notice) throws Exception;
		
	//deleteNotice
	public void deleteNotice(int noticeNo) throws Exception;;
	
}