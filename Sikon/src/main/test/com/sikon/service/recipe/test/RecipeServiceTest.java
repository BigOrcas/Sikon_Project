package com.sikon.service.recipe.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sikon.common.Search;
import com.sikon.service.domain.Ingredient;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.User;
import com.sikon.service.recipe.RecipeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class RecipeServiceTest {

	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("recipeServiceImpl")
	private RecipeService recipeService;

	// @Test
	public void testAddRecipe() throws Exception {

		// Recipe
		Recipe recipe = new Recipe();
		recipe.setCookingTime(30);
		recipe.setRecipeDetail("레시피간략설명");
		recipe.setRecipeDifficulty("100");
		recipe.setRecipeImg("a.jpg");
		recipe.setRecipeName("레시피명");
		recipe.setRecipeOrder("요리조리");
		recipe.setRecipeTheme("KO");

		User user = new User();
		user.setUserNickname("mentor");
		recipe.setWriter(user);

		// Ingredient
		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName("재료명");
		ingredient.setIngredientAmount("1g");

		Ingredient ingredient2 = new Ingredient();
		ingredient2.setIngredientName("22");
		ingredient2.setIngredientAmount("22");

		// 하나의 레시피에 필요한 재료를 list에 add
		List<Ingredient> list = new ArrayList<Ingredient>();
		list.add(ingredient);
		list.add(ingredient2);

		Map map = new HashMap();
		map.put("list", list);
		System.out.println(map);

		// addRecipe의 인자로 recipe 객체와 ingredient list를 담은 map을 넘긴다.
		recipeService.addRecipe(recipe, map);

	}

	//@Test
	public void testGetRecipe() throws Exception {

		List list = (List) recipeService.getRecipe(10002);

		System.out.println(list);

	}
	
	 @Test
		public void testUpdateRecipe() throws Exception {

			// Recipe
			Recipe recipe = new Recipe();
			recipe.setRecipeNo(10002);
			recipe.setCookingTime(100);
			recipe.setRecipeDetail("수정");
			recipe.setRecipeDifficulty("300");
			recipe.setRecipeImg("bb.jpg");
			recipe.setRecipeName("수정");
			recipe.setRecipeOrder("수정");
			recipe.setRecipeTheme("KO");

			User user = new User();
			user.setUserNickname("mentor");
			recipe.setWriter(user);

			// Ingredient
			Ingredient ingredient = new Ingredient();
			ingredient.setIngredientName("수정");
			ingredient.setIngredientAmount("수정");
			ingredient.setRecipeNo(10002);


			Ingredient ingredient2 = new Ingredient();
			ingredient2.setIngredientName("552");
			ingredient2.setIngredientAmount("522");
			ingredient2.setRecipeNo(10002);

			int RecipeNo=10002;
			// 하나의 레시피에 필요한 재료를 list에 add
			List<Ingredient> list = new ArrayList<Ingredient>();
			list.add(ingredient);
			list.add(ingredient2);

			Map map = new HashMap();
			map.put("list", list);
			System.out.println(map);

			// addRecipe의 인자로 recipe 객체와 ingredient list를 담은 map을 넘긴다.
			recipeService.updateRecipe(recipe, map);

		}
		
		//@Test
		 public void testGetRecipeListAll() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	Map<String,Object> map = recipeService.getRecipeList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
//		 	Assert.assertEquals(3, list.size());
		 	
			//==> console 확인
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 }
		
		//@Test
		 public void testGetRecipeListByRecipeNo() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("10002");
		 	Map<String,Object> map = recipeService.getRecipeList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
//		 	Assert.assertEquals(3, list.size());
		 	
			//==> console 확인
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 }
		
		//@Test
		 public void testGetRecipeListByRecipeName() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("1");
		 	search.setSearchKeyword("1");
		 	Map<String,Object> map = recipeService.getRecipeList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
//		 	Assert.assertEquals(3, list.size());
		 	
			//==> console 확인
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 }
		 
		//@Test
		 public void testGetRecipeListOrderbyCookingTime() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("1");
		 	search.setOrderCondition("2");
		 	Map<String,Object> map = recipeService.getRecipeList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
//		 	Assert.assertEquals(3, list.size());
		 	
			//==> console 확인
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 }


}
