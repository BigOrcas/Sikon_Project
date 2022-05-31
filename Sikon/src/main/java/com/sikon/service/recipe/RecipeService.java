package com.sikon.service.recipe;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;

public interface RecipeService {

	public void addRecipe(Recipe recipe) throws Exception;

	public Map<String, Object> getRecipeList(Search search) throws Exception;

	public Map<String, Object> getMyRecipeList(Search search,String writerNickname) throws Exception;

	public Recipe getRecipe(int recipeNo) throws Exception;

	public void updateRecipe(Recipe recipe) throws Exception;
	

}
