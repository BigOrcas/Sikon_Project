package com.sikon.web.bookmark;

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
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.bookmark.BookmarkService;
import com.sikon.service.domain.Bookmark;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.User;

@Controller
@RequestMapping("/bookmark/*")
public class BookmarkController {
	
	///Field
	@Autowired
	@Qualifier("bookmarkServiceImpl")
	private BookmarkService bookmarkService;
	
	
	public BookmarkController() {
		System.out.println("bookmark시작~");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addBookmark" )
	public ModelAndView addBookmark(@ModelAttribute("bookmark") Bookmark bookmark,@ModelAttribute("recipe") Recipe recipe, HttpServletRequest request) throws Exception {

		System.out.println("/bookmark/addBookmark : POST");
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		System.out.println(user);
		System.out.println(recipe);
		bookmark.setRecipe(recipe);
		bookmark.setUserId(user.getUserId());

		bookmarkService.addBookmark(bookmark);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("forward:/recipe/getRecipe?recipeNo="+recipe.getRecipeNo());
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "listBookmark")
	public String listBookmark(@ModelAttribute("search") Search search, Model model,
			HttpServletRequest request) throws Exception {

		System.out.println("/recipe/listBookmark :  POST/get");
		System.out.println("search:" + search);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}


		search.setPageSize(pageSize);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// Business logic 수행
		Map<String, Object> map = bookmarkService.getBookmarkList(search,user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

	
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		System.out.println("listRecipe::list=" + map.get("list"));
		model.addAttribute("resultPage", resultPage);
		System.out.println("resultPage는" + resultPage);
		model.addAttribute("search", search);
		model.addAttribute("user", user);

		return "forward:/user/mypage.jsp";
	}
	
	@RequestMapping(value="deleteBookmark" )
	public ModelAndView deleteBookmark(@RequestParam("bookmarkNo") int bookmarkNo) throws Exception {

		System.out.println("/bookmark/deleteBookmark : POST");


		bookmarkService.deleteBookmark(bookmarkNo);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("forward:/bookmark/listBookmark");
		
		return modelAndView;
	}

}