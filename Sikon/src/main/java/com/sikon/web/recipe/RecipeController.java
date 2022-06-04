package com.sikon.web.recipe;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.Ingredient;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.User;
import com.sikon.service.recipe.RecipeService;
import com.sikon.service.review.ReviewService;

//레시피 Controller
@Controller
@RequestMapping("/recipe/*")
public class RecipeController {

	/// Field
	@Autowired
	@Qualifier("recipeServiceImpl")
	private RecipeService recipeService;

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	public RecipeController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addRecipe", method = RequestMethod.GET)
	public String addRecipe() throws Exception {

		System.out.println("/recipe/addRecipe : GET");

		return "redirect:/recipe/addRecipe.jsp";
	}

	@RequestMapping(value = "addRecipe", method = RequestMethod.POST)
	public String addRecipe(@RequestParam("recipeImg") MultipartFile recipeImg, @ModelAttribute("recipe") Recipe recipe,
			@ModelAttribute("ingredient") Ingredient[] ingredient, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/recipe/addRecipe : post");
		System.out.println(recipe);

		// Business Logic
		String rootPath = "C:\\Users\\bitcamp\\git\\Sikon_Project\\Sikon\\src\\main\\webapp\\resources\\images\\uploadFiles\\";

		String filePath = rootPath + "\\" + recipeImg.getOriginalFilename();

		File dest = new File(filePath);

		recipeImg.transferTo(dest); // 파일 업로드 작업 수행

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println("여까진오나");
		recipe.setWriter(user);
		recipe.setRecipeImg(recipeImg.getOriginalFilename());
		// map에 ingredinet랑 둘 다 담을거섀
	
		List<Ingredient> list = new ArrayList<Ingredient>();
		for(int i=0; i<ingredient.length;i++) {
			list.add(ingredient[i]);
		}
		
		Map map = new HashMap();
		map.put("list", list);
		System.out.println(map);
		
		recipeService.addRecipe(recipe,map);
		model.addAttribute("recipe", recipe);

		return "forward:/recipe/readRecipe.jsp";
	}

	@RequestMapping(value = "getRecipe")
	public String getRecipe(@ModelAttribute("search") Search search, @RequestParam("recipeNo") int recipeNo,
			Model model) throws Exception {

		System.out.println("/recipe/getRecipe : post / get");
		System.out.println("recipeNo" + recipeNo);
		// Business Logic
		List list =recipeService.getRecipe(recipeNo);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("모냐recipeNo" + recipeNo);
		
		Map<String, Object> map = reviewService.getReviewList(search, 200, recipeNo);
		System.out.println("map:" + map.get("list"));
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("recipe", list);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/recipe/getRecipe.jsp?";
	}
//
//	@RequestMapping(value = "updateRecipe", method = RequestMethod.GET)
//	public String updateRecipe(@RequestParam("recipeNo") int recipeNo, Model model) throws Exception {
//
//		System.out.println("/recipe/updateRecipe :  get");
//		// Business Logic
//		Recipe recipe = recipeService.getRecipe(recipeNo);
//
//		// Model 과 View 연결
//		model.addAttribute("recipe", recipe);
//
//		return "forward:/recipe/updateRecipe.jsp";
//	}
//
//	// @RequestMapping("/updateRecipe.do")
////	@RequestMapping(value = "updateRecipe", method = RequestMethod.POST)
////	public String updateRecipe(@ModelAttribute("recipe") Recipe recipe,
////			@RequestParam("multiFiles[]") MultipartFile[] multiFiles, @ModelAttribute("purchase") Purchase purchase,
////			Model model, HttpSession session) throws Exception {
////
////		System.out.println("/recipe/updateRecipe :  POST");
////		// Business Logic
////
////		String files = "";
////		String FILE_SERVER_PATH = "C:\\workspace2\\Mini_PJT\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles\\";
////
////		for (int i = 0; i < multiFiles.length; i++) {
////			if (!multiFiles[i].getOriginalFilename().isEmpty()) {
////				multiFiles[i].transferTo(new File(FILE_SERVER_PATH, multiFiles[i].getOriginalFilename()));
////				files += multiFiles[i].getOriginalFilename() + "/";
////			}
////		}
////		recipe.setFileName(files);
////		System.out.println("알수" + recipe.getFileName());
////
////		recipe.setManuDate(recipe.getManuDate().replace("-", ""));
////
////		recipeService.updateRecipe(recipe);
////
////		return "forward:/recipe/getRecipe.jsp?recipeNo=" + recipe.getRecipeNo();
////	}
//
	@RequestMapping(value = "listRecipe")
	public String listRecipe(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/recipe/listRecipe :  POST/get");
		System.out.println("search:" + search);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		System.out.println("sort" + search.getOrderCondition());
		if (search.getOrderCondition() == null) {
			search.setOrderCondition("100");
		}
		search.setOrderCondition(search.getOrderCondition().replace(",", ""));
		System.out.println("listRecipe::OrderCondition" + search.getOrderCondition());

		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = recipeService.getRecipeList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		System.out.println("listRecipe::list=" + map.get("list"));
		model.addAttribute("resultPage", resultPage);
		System.out.println("resultPage는" + resultPage);
		model.addAttribute("search", search);
		model.addAttribute("user", user);

		return "forward:/recipe/listRecipe.jsp";
	}
//
//	@RequestMapping(value = "getMyRecipeList")
//	public ModelAndView getMyRecipeList(@ModelAttribute("search") Search search, Model model,
//			HttpServletRequest request) throws Exception {
//
//		System.out.println("/recipe/myRecipe :  POST/get");
//		System.out.println("search:" + search);
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//
//		search.setPageSize(pageSize);
//
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//
//		// Business logic 수행
//		Map<String, Object> map = recipeService.getMyRecipeList(search, user.getUserNickname());
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		// Model 과 View 연결
//
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("list", map.get("list"));
//		modelAndView.addObject("resultPage", resultPage);
//		modelAndView.addObject("search", search);
//
//		modelAndView.setViewName("forward:/recipe/myRecipe.jsp");
//
//		return modelAndView;
//	}
	
//	@RequestMapping(value = "bestRecipeList")
//	public String bestRecipeList(Model model) throws Exception {
//	
//		Map<String, Object> map = recipeService.bestRecipeList();
//		model.addAttribute("list", map.get("list"));
//
//		return "forward:/main.jsp";
//	}

}
