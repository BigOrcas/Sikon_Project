package com.sikon.service.notice;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Coupon;
import com.sikon.service.domain.Notice;


public interface NoticeDao{
	
	//�������� ���
	public void insertNotice(Notice notice) throws Exception;
	
	/// findNotice Method
	public Notice findNotice(int noticeNo) throws Exception;
	
	public List<Coupon> getNoticeList(Search search) throws Exception;
	
	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getNoticeTotalCount(Search search) throws Exception;

	/// updateNotice Method
	public void updateNotice(Notice notice) throws Exception;
		
	//�������׻���
	public void deleteNotice(int noticeNo) throws Exception;
}