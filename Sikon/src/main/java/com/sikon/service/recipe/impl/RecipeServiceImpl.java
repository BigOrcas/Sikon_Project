package com.sikon.service.recipe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;
import com.sikon.service.recipe.RecipeDao;
import com.sikon.service.recipe.RecipeService;;

//레시피 서비스 구현
@Service("recipeServiceImpl")
public class RecipeServiceImpl implements RecipeService {

	/// Field
	@Autowired
	@Qualifier("recipeDaoImpl")
	private RecipeDao recipeDao;

	public void setRecipeDao(RecipeDao recipeDao) {
		this.recipeDao = recipeDao;
	}

	/// Constructor
	public RecipeServiceImpl() {
		System.out.println(this.getClass());
	}

	
	/// Method
	public void addRecipe(Recipe recipe,Map ingredient) throws Exception {
		System.out.println("recipe=" + recipe);
		System.out.println("ingredient=" + ingredient);
		recipeDao.addRecipe(recipe,ingredient);
	}

	public List getRecipe(int recipeNo) throws Exception {
		System.out.println("recipeNo=" + recipeNo);
		return recipeDao.getRecipe(recipeNo);
	}
	
//	public Ingredient getIngredient(int recipeNo) throws Exception {
//		System.out.println("recipeNo=" + recipeNo);
//		return recipeDao.getIngredient(recipeNo);
//	}

	
	public Map<String, Object> getRecipeList(Search search) throws Exception {
		System.out.println("search=" + search);
		List<Recipe> list = recipeDao.getRecipeList(search);
		int totalCount = recipeDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		System.out.println("list=" + list);

		return map;
	}

	public Map<String, Object> getMyRecipeList(Search search, String writerNickname) throws Exception {
		System.out.println("search=" + search);
		System.out.println("writerNickname=" + writerNickname);

		List<Recipe> list = recipeDao.getMyRecipeList(search, writerNickname);
		int totalCount = recipeDao.getTotalMyCount(search, writerNickname);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		System.out.println(list);

		return map;
	}

	public void updateRecipe(Recipe recipe) throws Exception {
		System.out.println("띠용");
		System.out.println("recipe=" + recipe);
		recipeDao.updateRecipe(recipe);
	}
	
	public void updateIngredient(List ingredient,int recipeNo) throws Exception {
		System.out.println("띠용");
		recipeDao.updateIngredient(ingredient,recipeNo);
	}

	public void deleteRecipe(Recipe recipe) throws Exception {
		System.out.println("recipe=" + recipe);
		recipeDao.deleteRecipe(recipe);
	}

	@Override
	public Map<String, Object> bestRecipeList() throws Exception {
		List<Recipe> list= recipeDao.bestRecipeList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		return map;
	}

}