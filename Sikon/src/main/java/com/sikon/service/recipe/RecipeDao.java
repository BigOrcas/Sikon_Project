package com.sikon.service.recipe;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;

//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface RecipeDao {

	// INSERT
	public void addRecipe(Recipe recipe) throws Exception;

	public List<Recipe> getRecipeList(Search search) throws Exception;

	public List<Recipe> getMyRecipeList(Search search,String writerNickname) throws Exception;

	public Recipe getRecipe(int prodNo) throws Exception;

	public void updateRecipe(Recipe recipe) throws Exception;

	public int getTotalCount(Search search) throws Exception ;
	
	public int getTotalMyCount(Search search,String userId) throws Exception ;
	


}