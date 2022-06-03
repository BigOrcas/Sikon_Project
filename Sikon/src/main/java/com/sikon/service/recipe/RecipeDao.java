package com.sikon.service.recipe;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Ingredient;
import com.sikon.service.domain.Recipe;

//레시피에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface RecipeDao {

	// INSERT
	public void addRecipe(Recipe recipe,Map ingredient) throws Exception;

	//SELECT ONE
	public List getRecipe(int prodNo) throws Exception;

//	public Ingredient getIngredient(int recipeNo) throws Exception;

	//SELECT LIST
	public List<Recipe> getRecipeList(Search search) throws Exception;

	//SELECT LIST
	public List<Recipe> getMyRecipeList(Search search,String writerNickname) throws Exception;

	//UPDATE
	public void updateRecipe(Recipe recipe) throws Exception;

	public void updateIngredient(List ingredient,int recipeNo) throws Exception;

	//DELETE
	public void deleteRecipe(Recipe recipe) throws Exception;

	//SELECT ROW Count
	public int getTotalCount(Search search) throws Exception ;
	
	//SELECT ROW Count
	public int getTotalMyCount(Search search,String userId) throws Exception ;
	
	public List<Recipe> bestRecipeList() throws Exception;

	

}