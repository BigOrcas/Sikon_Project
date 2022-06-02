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
		
		//setter Method ���� ����
			
		public ApplyController() {
			System.out.println(this.getClass());
		}
		
		//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
		//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
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
			//addObject : key�� value�� ��� ���� �� �ִ� �޼���


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
			//product ��ü�� ��ǰ��ȣ�� �־��ݴϴ�
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			
			//user ��ü�� user�� �־��ݴϴ�
			
//			Purchase purchase=new Purchase();
			apply.setApplier(user);         //user��ü�� set���ݴϴ�
			apply.setClassCook(cook1); //product ��ü�� set���ݴϴ�
//			purchase.setPaymentOption(request.getParameter("paymentOption"));
//			purchase.setReceiverName(request.getParameter("receiverName"));
//			purchase.setReceiverPhone(request.getParameter("receiverPhone"));
//			purchase.setDivyAddr(request.getParameter("receiverAddr"));
//			purchase.setDivyRequest(request.getParameter("receiverRequest"));
//			purchase.setDivyDate(request.getParameter("receiverDate"));	
			apply.setApplyStatus("100");   
			 //purchase ��ü��  @ModelAttribute�� ���������� trancode�� set���ݴϴ�
		
			int buy= apply.getCookStatus();   //��� ��ǰ���� ������ buy�� �־��ݴϴ�
			int cookNo=cook.getCookNo(); //��ǰ��ȣ�� ������ prodNo�� �־��ݴϴ�
					
			System.out.println(apply);
			applyService.buyCook(buy, cookNo); //buyProd�� �־��ݴϴ�
			applyService.addApply(apply);
			
			ModelAndView modelAndView=new ModelAndView(); //modelAndView ��ü����
			modelAndView.addObject(apply); //modelAndView ��ü�� purchase�� �־���
			modelAndView.setViewName("forward:/apply/readApply.jsp");
			
			return modelAndView;
		}
		
		//@RequestMapping("/getPurchase.do")
		@RequestMapping( value="getApply" )
		public ModelAndView getApply( @ModelAttribute("apply") Apply apply,@RequestParam("applyNo") int applyNo) throws Exception {
			
			System.out.println("/apply/getApply : GET, POST");
			//Business Logic
			Apply apply1 = applyService.getApply(applyNo);
			// Model �� View ����
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject(apply1);
			// ���⼭�� value���� �־����
			
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
			
			System.out.println("applyStatus��:"+applyStatus);
			
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
			
			// Business logic ����
			Map<String , Object> map=applyService.getApplyList(search,user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model �� View ����
			
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
			
			// Business logic ����
			Map<String , Object> map=applyService.getApplyList(search,user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model �� View ����
			
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
