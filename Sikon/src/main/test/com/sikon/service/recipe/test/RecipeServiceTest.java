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

	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("recipeServiceImpl")
	private RecipeService recipeService;

	// @Test
	public void testAddRecipe() throws Exception {

		// Recipe
		Recipe recipe = new Recipe();
		recipe.setCookingTime(30);
		recipe.setRecipeDetail("�����ǰ�������");
		recipe.setRecipeDifficulty("100");
		recipe.setRecipeImg("a.jpg");
		recipe.setRecipeName("�����Ǹ�");
		recipe.setRecipeOrder("�丮����");
		recipe.setRecipeTheme("KO");

		User user = new User();
		user.setUserNickname("mentor");
		recipe.setWriter(user);

		// Ingredient
		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName("����");
		ingredient.setIngredientAmount("1g");

		Ingredient ingredient2 = new Ingredient();
		ingredient2.setIngredientName("22");
		ingredient2.setIngredientAmount("22");

		// �ϳ��� �����ǿ� �ʿ��� ��Ḧ list�� add
		List<Ingredient> list = new ArrayList<Ingredient>();
		list.add(ingredient);
		list.add(ingredient2);

		Map map = new HashMap();
		map.put("list", list);
		System.out.println(map);

		// addRecipe�� ���ڷ� recipe ��ü�� ingredient list�� ���� map�� �ѱ��.
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
			recipe.setRecipeDetail("����");
			recipe.setRecipeDifficulty("300");
			recipe.setRecipeImg("bb.jpg");
			recipe.setRecipeName("����");
			recipe.setRecipeOrder("����");
			recipe.setRecipeTheme("KO");

			User user = new User();
			user.setUserNickname("mentor");
			recipe.setWriter(user);

			// Ingredient
			Ingredient ingredient = new Ingredient();
			ingredient.setIngredientName("����");
			ingredient.setIngredientAmount("����");
			ingredient.setRecipeNo(10002);


			Ingredient ingredient2 = new Ingredient();
			ingredient2.setIngredientName("552");
			ingredient2.setIngredientAmount("522");
			ingredient2.setRecipeNo(10002);

			int RecipeNo=10002;
			// �ϳ��� �����ǿ� �ʿ��� ��Ḧ list�� add
			List<Ingredient> list = new ArrayList<Ingredient>();
			list.add(ingredient);
			list.add(ingredient2);

			Map map = new HashMap();
			map.put("list", list);
			System.out.println(map);

			// addRecipe�� ���ڷ� recipe ��ü�� ingredient list�� ���� map�� �ѱ��.
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
		 	
			//==> console Ȯ��
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
		 	
			//==> console Ȯ��
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
		 	
			//==> console Ȯ��
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
		 	
			//==> console Ȯ��
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 }


}
