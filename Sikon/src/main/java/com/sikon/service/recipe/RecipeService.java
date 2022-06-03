package com.sikon.service.recipe;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Ingredient;
import com.sikon.service.domain.Recipe;

//�����ǿ��� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface RecipeService {

	//������ ���
	public void addRecipe(Recipe recipe,Map ingredient) throws Exception;

	//������ �� ��ȸ
	public List getRecipe(int recipeNo) throws Exception;
	
//	public Ingredient getIngredient(int recipeNo) throws Exception;
		
	//������ ����Ʈ ��ȸ
	public Map<String, Object> getRecipeList(Search search) throws Exception;

	//���� �� ������ ��ȸ(����������)
	public Map<String, Object> getMyRecipeList(Search search,String writerNickname) throws Exception;

	//������ ����
	public void updateRecipe(Recipe recipe) throws Exception;
	public void updateIngredient(List ingredient,int recipeNo) throws Exception;
	
	//������ ����
	public void deleteRecipe(Recipe recipe) throws Exception;
	
	public Map<String , Object> bestRecipeList() throws Exception;

}
