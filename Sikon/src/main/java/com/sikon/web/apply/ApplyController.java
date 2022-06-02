package com.sikon.web.apply;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.Cook;
import com.sikon.service.domain.Apply;
import com.sikon.service.domain.User;

import com.sikon.service.cook.CookService;
import com.sikon.service.apply.ApplyService;


@Controller
@RequestMapping("/apply/*")
public class ApplyController {

	///Field
		@Autowired
		@Qualifier("applyServiceImpl")
		private ApplyService applyService;
		
		/// Field
		@Autowired
		@Qualifier("cookServiceImpl")
		private CookService cookService;
		
		//setter Method 구현 않음
			
		public ApplyController() {
			System.out.println(this.getClass());
		}
		
		//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		//@RequestMapping("/addPurchaseView.do")
		@RequestMapping( value="addApply", method=RequestMethod.GET )
		public ModelAndView addApply(@ModelAttribute("cook") Cook cook) throws Exception {

			System.out.println("/apply/addApply : GET");
			Cook cook1=cookService.getCook(cook.getCookNo());
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("cook",cook1);
			//addObject : key와 value를 담아 보낼 수 있는 메서드


			modelAndView.setViewName("forward:/apply/addApply.jsp");
			//modelAndView.setViewName("forward:/apply/addApply_KakaoPay.jsp");
			
			return modelAndView;
		}
		
		//@RequestMapping("/addPurchase.do")
		@RequestMapping( value="addApply", method=RequestMethod.POST )
		public ModelAndView addApply(  @ModelAttribute("cook") Cook cook,@ModelAttribute("apply") Apply apply
				, HttpServletRequest request) throws Exception {
			
			System.out.println("/apply/addApply : POST");
			//Business Logic
			System.out.println(cook.getCookNo());
			Cook cook1=cookService.getCook(cook.getCookNo());
			//product 객체에 상품번호를 넣어줍니다
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			
			//user 객체에 user를 넣어줍니다
			
//			Purchase purchase=new Purchase();
			apply.setApplier(user);         //user객체를 set해줍니다
			apply.setClassCook(cook1); //product 객체를 set해줍니다
//			purchase.setPaymentOption(request.getParameter("paymentOption"));
//			purchase.setReceiverName(request.getParameter("receiverName"));
//			purchase.setReceiverPhone(request.getParameter("receiverPhone"));
//			purchase.setDivyAddr(request.getParameter("receiverAddr"));
//			purchase.setDivyRequest(request.getParameter("receiverRequest"));
//			purchase.setDivyDate(request.getParameter("receiverDate"));	
			apply.setApplyStatus("100");   
			 //purchase 객체를  @ModelAttribute로 가져왔으니 trancode를 set해줍니다
		
			int buy= apply.getCookStatus();   //사는 상품수를 가져와 buy에 넣어줍니다
			int cookNo=cook.getCookNo(); //상품번호를 가져와 prodNo에 넣어줍니다
					
			System.out.println(apply);
			applyService.buyCook(buy, cookNo); //buyProd에 넣어줍니다
			applyService.addApply(apply);
			
			ModelAndView modelAndView=new ModelAndView(); //modelAndView 객체생성
			modelAndView.addObject(apply); //modelAndView 객체에 purchase를 넣어줌
			modelAndView.setViewName("forward:/apply/readApply.jsp");
			
			return modelAndView;
		}
		
		//@RequestMapping("/getPurchase.do")
		@RequestMapping( value="getApply" )
		public ModelAndView getApply( @ModelAttribute("apply") Apply apply,@RequestParam("applyNo") int applyNo) throws Exception {
			
			System.out.println("/apply/getApply : GET, POST");
			//Business Logic
			Apply apply1 = applyService.getApply(applyNo);
			// Model 과 View 연결
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject(apply1);
			// 여기서는 value값만 넣어줬다
			
			modelAndView.setViewName("forward:/apply/getApply.jsp");
			
			return modelAndView;
		}
		

		

		
		//@RequestMapping("/updateTranCode.do")
		@RequestMapping( value="updateApplyStatus" )
		public ModelAndView updateApplyStatus( @ModelAttribute("apply") Apply apply,
				@RequestParam("menu") String menu,
				@RequestParam("applyNo") int applyNo) throws Exception{

			System.out.println("/apply/updateApplyStatus : GET,Post");
			//Business Logic
			String applyStatus=apply.getApplyStatus();
			Apply apply1=applyService.getApply(applyNo);
			
		
			
			if(applyStatus.equals("100")) {
				applyStatus="200";
			}
			
			System.out.println("applyStatus후:"+applyStatus);
			
			apply1.setApplyStatus(applyStatus);

			applyService.updateApplyStatus(apply1);
			
			ModelAndView modelAndView=new ModelAndView();
			
			if(applyStatus.equals("100")) {
			modelAndView.setViewName("forward:/apply/listSale");
			}else {
			modelAndView.setViewName("forward:/apply/listApply");
			}
			
			return modelAndView;
		}
		
		//@RequestMapping("/listPurchase.do")
		@RequestMapping( value="listApply" )

		public ModelAndView listApply( @ModelAttribute("search") Search search ,  HttpServletRequest request) throws Exception{
			
			System.out.println("/apply/listApply : GET,Post");
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			
			// Business logic 수행
			Map<String , Object> map=applyService.getApplyList(search,user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model 과 View 연결
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			
			modelAndView.setViewName("forward:/apply/listApply.jsp");
			
			
			return modelAndView;
		}
		
		//@RequestMapping("/listSale.do")
		@RequestMapping( value="listSale" )

		public ModelAndView listSale( @ModelAttribute("search") Search search ,  HttpServletRequest request) throws Exception{
			
			System.out.println("/apply/listSale : GET,Post");
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			
			// Business logic 수행
			Map<String , Object> map=applyService.getApplyList(search,user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model 과 View 연결
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			
			modelAndView.setViewName("forward:/apply/listSale.jsp");
			
			
			return modelAndView;
		}
		@RequestMapping(value="cancel", method=RequestMethod.GET)
		public ModelAndView cancel(@RequestParam("applyNo") int applyNo) throws Exception{

		
			
			Apply apply = applyService.getApply(applyNo);
			
			int buyClass = apply.getCookStatus();
			int cookNo = apply.getClassCook().getCookNo();
			
			applyService.cancel(buyClass, cookNo);
			
			apply.setApplyStatus("000");
			

			applyService.updateApplyStatus(apply);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("/apply/listApply.do");		
			
			
			return modelAndView;
		}
		
		
		
		
}
