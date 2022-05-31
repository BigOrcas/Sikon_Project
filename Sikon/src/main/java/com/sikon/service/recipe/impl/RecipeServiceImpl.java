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


//==> ȸ������ ���� ����
@Service("recipeServiceImpl")
public class RecipeServiceImpl implements RecipeService{
	
	///Field
	@Autowired
	@Qualifier("recipeDaoImpl")
	private RecipeDao recipeDao;
	public void setRecipeDao(RecipeDao recipeDao) {
		this.recipeDao = recipeDao;
	}
	
	///Constructor
	public RecipeServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addRecipe(Recipe recipe) throws Exception {
		System.out.println("���Ŀ���");

		recipeDao.addRecipe(recipe);
	}

	public Recipe getRecipe(int recipeNo) throws Exception {
		return recipeDao.getRecipe(recipeNo);
	}

	public Map<String, Object> getRecipeList(Search search) throws Exception {
		List<Recipe> list= recipeDao.getRecipeList(search);
		int totalCount = recipeDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		System.out.println(list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateRecipe(Recipe recipe) throws Exception {
		recipeDao.updateRecipe(recipe);
	}

	@Override
	public Map<String, Object> getMyRecipeList(Search search, String writerNickname) throws Exception {
		System.out.println("����"+writerNickname+search);
		// TODO Auto-generated method stub
		List<Recipe> list= recipeDao.getMyRecipeList(search,writerNickname);
		int totalCount = recipeDao.getTotalMyCount(search,writerNickname);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		System.out.println(list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}