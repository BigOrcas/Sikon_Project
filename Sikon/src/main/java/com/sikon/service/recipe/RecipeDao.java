package com.sikon.service.recipe;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;

//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
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