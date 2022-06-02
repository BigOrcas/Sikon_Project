package com.sikon.web.wish;



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
import org.springframework.web.bind.annotation.RequestParam;

import com.sikon.common.Page;
import com.sikon.common.Search;

import com.sikon.service.domain.User;
import com.sikon.service.domain.Cook;
import com.sikon.service.domain.Wish;

import com.sikon.service.user.UserService;
import com.sikon.service.wish.WishService;




@Controller
@RequestMapping("/wish/*")
public class WishController {
	
	///Field
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
		
	public WishController(){
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping("addWish")
	public String addWish( @ModelAttribute("wish") Wish wish) throws Exception {

		System.out.println("/addWish");
		System.out.println("userId : "+wish.getUserId());
		System.out.println("cookNo : "+wish.getCookNo());
		System.out.println("cookName : "+wish.getCookName());
		
		
		wish.setCookFilename("aaa.jpg");
		wishService.addWish(wish);
		
		return "redirect:/cook/getCook?menu=search&cookNo="+wish.getCookNo();
	}
	
	
	@RequestMapping("getWish")
	public String getWish( @RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("/getWish");
		
		List<Wish> list = wishService.getWish(userId);
		
		
		
		model.addAttribute("wish", list);
		
		return "forward:/wish/listWish.jsp";
	}
	
	@RequestMapping("updateWish")
	public String updateWish( @RequestParam("wishNo") int wishNo, @RequestParam("buy") int buy, Model model, HttpSession session) throws Exception{
		
		System.out.println("/updateWish");
		
		User user = (User) session.getAttribute("user");
		wishService.updateWish(wishNo,buy);
		
		
		return "redirect:/wish/getWish?userId="+user.getUserId();
	}
	
	@RequestMapping("deleteWish")
	public String deleteWish( @RequestParam("wishNo") int wishNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/deleteWish");
		
		User user = (User) session.getAttribute("user");
		wishService.deleteWish(wishNo);
		
		
		return "redirect:/wish/getWish?userId="+user.getUserId();
	}

}