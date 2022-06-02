package com.sikon.service.coupon.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.purchase.PurchaseService;
import com.sikon.service.purchase.PurchaseDao;
import com.sikon.service.coupon.CouponDao;
import com.sikon.service.coupon.CouponService;
import com.sikon.service.domain.Coupon;
import com.sikon.service.domain.Purchase;
import com.sikon.service.domain.User;


@Service("couponServiceImpl")
public class CouponServiceImpl implements CouponService{
	
	///Field
	@Autowired
	@Qualifier("couponDaoImpl")
	private CouponDao couponDao;

	
	/// Constructor
	public CouponServiceImpl() {
		System.out.println(this.getClass());
	}


	///Method
	public void addCoupon(Coupon coupon) throws Exception {
		couponDao.insertCoupon(coupon);
	}
	
	//��������
	public void issueCoupon(Coupon coupon) throws Exception{
		couponDao.issueCoupon(coupon);
	};
	
	//�����˻�
	public List<Coupon> getCoupon() throws Exception {
		
		List<Coupon> couponList = couponDao.findCoupon();
		
		System.out.println(couponList);
		
		return couponList;
	}
	
	//���������˻�
	public Coupon getIssuedCoupon(int issueNo) throws Exception {
		
		Coupon issuedCoupon = couponDao.findIssuedCoupon(issueNo);
		
		System.out.println(issuedCoupon);
		
		return issuedCoupon;
	}
	
	//���������˻�
	public List<Coupon> getUsableCoupon(String userId) throws Exception {
		
		List<Coupon> couponList = couponDao.findUsableCoupon(userId);
		
		System.out.println(couponList);
		
		return couponList;
	}
	
	
	//������������Ʈ �˻�
	public Map<String , Object > getCouponList(Search search) throws Exception {
		List<Coupon> list= couponDao.getCouponList(search);
		int totalCount = couponDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	//�߱���������Ʈ �˻�
	public Map<String , Object > getIssuedCouponList(Search search) throws Exception {
		List<Coupon> list= couponDao.getIssuedCouponList(search);
		int totalCount = couponDao.getIssuedTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	//�������º���
	public void updateIssueStatus(Coupon coupon) throws Exception{
		couponDao.updateIssueStatus(coupon);
	}
	
	// ��������
	public void deleteCoupon(int couponNo) throws Exception{
		couponDao.deleteCoupon(couponNo);
	};
	
}