package com.sikon.web.coupon;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.coupon.CouponService;
import com.sikon.service.domain.Coupon;
import com.sikon.service.domain.Notice;
import com.sikon.service.domain.Purchase;
import com.sikon.service.domain.User;
import com.sikon.service.user.UserService;


//==> 쿠폰 Controller
@Controller
@RequestMapping("/coupon/*")
public class CouponController {
	
	///Field
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	///Constructor
	public CouponController(){
		System.out.println(this.getClass());
	}
		
	///Method
	@RequestMapping( value="/manageCoupon" )
	public String manageCoupon(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
				
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> couponMap = couponService.getCouponList(search);
		Map<String , Object> issueMap = couponService.getIssuedCouponList(search);
		
		Page couponPage = new Page( search.getCurrentPage(), ((Integer)couponMap.get("totalCount")).intValue(), pageUnit, pageSize);
		Page issuePage = new Page( search.getCurrentPage(), ((Integer)issueMap.get("totalCount")).intValue(), pageUnit, pageSize);
		
		// Model 과 View 연결
		model.addAttribute("couponList", couponMap.get("list"));
		model.addAttribute("issueList", issueMap.get("list"));
		model.addAttribute("couponPage", couponPage);
		model.addAttribute("issuePage", issuePage);
		model.addAttribute("search", search);
		
		return "forward:/coupon/manageCoupon.jsp";
	}
	
	@RequestMapping( value="/addCoupon", method=RequestMethod.POST )
	public String addCoupon(@ModelAttribute("coupon") Coupon coupon) throws Exception{

		System.out.println("/coupon/addCoupon : POST");
		
		//Business Logic
		System.out.println(coupon.getCouponNo());
		couponService.addCoupon(coupon);
		
		return "forward:/coupon/manageCoupon";
	}
	
	@RequestMapping( value="/listCoupon" )
	public String listCoupon(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map = couponService.getCouponList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/coupon/listCoupon.jsp";
	}
	
	@RequestMapping( value="/deleteCoupon", method=RequestMethod.GET)
	public String updatePurchaseView(@RequestParam("couponNo") int couponNo) throws Exception{

		System.out.println("/coupon/deleteCoupon : GET");
		
		//Business Logic
		couponService.deleteCoupon(couponNo);

		return "forward:/coupon/manageCoupon";
	}
	
	@RequestMapping(value="/issueCoupon", method=RequestMethod.GET)
	public String issueCouponView(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
				
		System.out.println("/coupon/issueCoupon : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map = userService.getUserList(search);
		List <Coupon> couponList = couponService.getCoupon(); 
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("couponList", couponList);
		
		return "forward:/coupon/issueCoupon.jsp";
	}
	
	@RequestMapping( value="/issueCoupon", method=RequestMethod.POST )
	public String issueCoupon(@ModelAttribute("coupon") Coupon coupon, @RequestParam("userId") List<String> userId) throws Exception{

		System.out.println("/coupon/issueCoupon : POST");
		
		System.out.println(coupon.getIssueStatus());
		
		//Business Logic		
		for (String c : userId) {
			User user = userService.getUser(c);
			coupon.setCouponUser(user);
			couponService.issueCoupon(coupon);
	    }
		
		return "forward:/coupon/manageCoupon";
	}
	
	@RequestMapping( value="/listIssuedCoupon" )
	public String listIssuedCoupon(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=couponService.getIssuedCouponList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/coupon/listIssuedCoupon.jsp";
	}
	
	@RequestMapping( value="/updateIssueStatus", method=RequestMethod.GET )
	public String updateIssueStatus(@RequestParam("issueNo") int issueNo) throws Exception{

		System.out.println("/coupon/updateIssueStatus : GET");
	
		//Business Logic
		Coupon coupon = couponService.getIssuedCoupon(issueNo);
		coupon.setIssueStatus("회수");
		couponService.updateIssueStatus(coupon);
		
		return "forward:/coupon/manageCoupon";
	}
	
}