package com.sikon.service.notice.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Coupon;
import com.sikon.service.domain.Notice;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.User;
import com.sikon.service.notice.NoticeDao;



@Repository("noticeDaoImpl")
public class NoticeDaoImpl implements NoticeDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public NoticeDaoImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	/// inserNotice Method
	public void insertNotice(Notice notice) throws Exception {
		sqlSession.insert("NoticeMapper.addNotice", notice);
	}
	
	/// findNotice Method
	public Notice findNotice(int noticeNo) throws Exception {
		return sqlSession.selectOne("NoticeMapper.findNotice", noticeNo);
	}
	
	public List<Coupon> getNoticeList(Search search) throws Exception {
		return sqlSession.selectList("NoticeMapper.getNoticeList", search);
	}
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getNoticeTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("NoticeMapper.getTotalCount", search);
	}
	
	/// updateNotice Method
	public void updateNotice(Notice notice) throws Exception {
		sqlSession.update("NoticeMapper.updateNotice", notice);
	}
	
	//공지사항삭제
	public void deleteNotice(int noticeNo) throws Exception{
		sqlSession.delete("NoticeMapper.deleteNotice", noticeNo);
	};

}