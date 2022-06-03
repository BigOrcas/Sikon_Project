package com.sikon.web.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Purchase;
import com.sikon.service.domain.User;
import com.sikon.service.domain.Cart;
import com.sikon.service.product.ProductService;
import com.sikon.service.purchase.PurchaseService;
import com.sikon.service.user.UserService;
import com.sikon.service.cart.CartService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
		
	public PurchaseController(){
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
	
	
	@RequestMapping(value="addPurchase", method=RequestMethod.GET)
	public ModelAndView addPurchase(@RequestParam("prodNo") int prodNo, @RequestParam("quantity") int quantity, HttpServletRequest request) throws Exception {

		
		System.out.println("/purchase/addPurchase : GET");
		
		System.out.println("quantity: "+quantity);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		System.out.println(user.getHoldpoint());
		
		Product product = productService.getProduct(prodNo);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/addPurchaseView.jsp");
		modelAndView.addObject("product", product);
		modelAndView.addObject("quantity", quantity);
		
		
		return modelAndView;
	}
	

	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public ModelAndView addPurchase( @ModelAttribute("purchase") Purchase purchase, @RequestParam("prodNo") int prodNo, @RequestParam("userId") String userId ) throws Exception {

		System.out.println("/purchase/addPurchase : POST");
		//Business Logic
		
		User user = userService.getUser(userId);
		Product product = productService.getProduct(prodNo);
		//Purchase purchase = new Purchase();
		
		System.out.println("usedPoint: "+purchase.getUsedPoint());
		
		int price = product.getProdDisPrice();
		System.out.println(price);
		
		double point = (int)(price*0.05);
		
		System.out.println("earnPoint: "+point);
		//System.out.println("earnPoint: "+Math.round(point));
		
		//purchase.setEarnPoint(point);
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setDivyStatus("001");
		
		int quantity = purchase.getPurchaseQuantity();
		
		System.out.println(purchase);
		//purchaseService.addPurchase(purchase);
		
		
		System.out.println(quantity);
		System.out.println(prodNo);
		purchaseService.updateStock(quantity, prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/readPurchase.jsp");
		modelAndView.addObject("purchsae", purchase);
		
		return modelAndView;
	}
	
	
	
	/*
	@RequestMapping( value="getPurchase", method=RequestMethod.GET)
	public ModelAndView getPurchase( @RequestParam("tranNo") int tranNo) throws Exception {
		
		System.out.println("/purchase/getPurchase : GET ");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		User user = userService.getUser(purchase.getBuyer().getUserId());
		Product product = productService.getProduct(purchase.getPurchaseProd().getProdNo());
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/getPurchase.jsp");
		modelAndView.addObject("purchase", purchase);
		
		//return "forward:/purchase/getPurchase.jsp";
		return modelAndView;
	}
	

	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public ModelAndView updatePurchase( @RequestParam("tranNo") int tranNo) throws Exception{

		System.out.println("/purchase/updatePurchase : GET ");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		// Model 과 View 연결
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/updatePurchase.jsp");
		modelAndView.addObject("purchase", purchase);
		
		//return "forward:/purchase/updatePurchase.jsp";
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public ModelAndView updatePurchase( @ModelAttribute("purchase") Purchase purchase, @RequestParam("tranNo") int tranNo) throws Exception{

		System.out.println("/purchase/updatePurchase : POST ");
		//Business Logic
		
		String divyDate = "";
		String[]  divyDates = purchase.getDivyDate().split("/");
		divyDate = divyDates[2]+divyDates[0]+divyDates[1];
		
		purchase.setDivyDate(divyDate);
		purchase.setTranNo(tranNo);
		purchaseService.updatePurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/purchase/getPurchase?tranNo="+tranNo);		
		
		//return "redirect:/getPurchase.do?tranNo="+purchase.getTranNo();
		return modelAndView;
	}
	
	@RequestMapping(value="updateTranCode", method=RequestMethod.GET)
	public ModelAndView updateTranCode( @ModelAttribute("purchase") Purchase purchase, HttpServletRequest request) throws Exception{

		System.out.println("/purchase/updateTranCode : GET");
		//Business Logic
		
		int tranNo = Integer.parseInt(request.getParameter("tranNo")); 
		String tranCode = request.getParameter("tranCode");
		
		
		if(tranCode.equals("001")) {
			tranCode = "002";
		}else if(tranCode.equals("002")) {
			tranCode = "003";
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		user = userService.getUser(user.getUserId());
		
		purchase.setTranCode(tranCode);
		purchase.setTranNo(tranNo);
		purchase.setBuyer(user);
		
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		if(user.getRole().equals("admin")) {
			modelAndView.setViewName("/purchase/listSales?menu=menage");	
		}else {
			modelAndView.setViewName("/purchase/listPurchase");
		}
			
		
		//return "redirect:/getPurchase.do?tranNo="+purchase.getTranNo();
		return modelAndView;
	}

	
	@RequestMapping(value="cancelOrder", method=RequestMethod.GET)
	public ModelAndView cancelOrder(@RequestParam("tranNo") int tranNo) throws Exception{

		System.out.println("/purchase/cancelOrder : GET");
		//Business Logic
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		int buyNum = purchase.getBuyNum();
		int prodNo = purchase.getPurchaseProd().getProdNo();
		
		purchaseService.cancelOrder(buyNum, prodNo);
		
		purchase.setTranCode("000");
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/listPurchase.do");		
		
		//return "redirect:/getPurchase.do?tranNo="+purchase.getTranNo();
		return modelAndView;
	}
	
	
	@RequestMapping(value="listPurchase" )
	public ModelAndView listPurchase( @ModelAttribute("search") Search search ,  HttpServletRequest request) throws Exception{
		
		System.out.println("/purchase/listPurchase : GET / POST ");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String buyerId = user.getUserId();
		
		
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search, buyerId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/listPurchase.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("user", user);
		
		
		//return "forward:/purchase/listPurchase.jsp";
		return modelAndView;
	}
	
	@RequestMapping(value="listSales")
	public ModelAndView listSales( @ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("/purchase/listSales : GET / POST ");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getSalesList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/listSales2.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		return modelAndView;
	}
	
	//*/
	
}