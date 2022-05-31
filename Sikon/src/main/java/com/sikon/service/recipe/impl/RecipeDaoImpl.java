package com.sikon.service.recipe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;
import com.sikon.service.recipe.RecipeDao;


//==> 회원관리 DAO CRUD 구현
@Repository("recipeDaoImpl")
public class RecipeDaoImpl implements RecipeDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public RecipeDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addRecipe(Recipe recipe) throws Exception {
		System.out.println("오냐");
		sqlSession.insert("RecipeMapper.addRecipe", recipe);
	}

	public Recipe getRecipe(int recipeNo) throws Exception {
		return sqlSession.selectOne("RecipeMapper.getRecipe", recipeNo);
	}
	
	public void updateRecipe(Recipe recipe) throws Exception {
		sqlSession.update("RecipeMapper.updateRecipe", recipe);
	}

	public List<Recipe> getRecipeList(Search search) throws Exception {
		return sqlSession.selectList("RecipeMapper.getRecipeList", search);
	}
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("RecipeMapper.getTotalCount", search);
	}

	@Override
	public List<Recipe> getMyRecipeList(Search search, String writerNickname) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writerNickname", writerNickname);
		map.put("search", search);
		return sqlSession.selectList("RecipeMapper.getMyRecipeList", map);
	}
	
	public int getTotalMyCount(Search search,String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", userId);
		map.put("search", search);
		return sqlSession.selectOne("RecipeMapper.getTotalMyCount", map);
	}

}