package com.sikon.service.domain;

public class Ingredient {
	private int ingredientNo;
	private String ingredientName;
	private String ingredientAmount;
	private int recipeNo;
	
	
	public int getIngredientNo() {
		return ingredientNo;
	}
	public void setIngredientNo(int ingredientNo) {
		this.ingredientNo = ingredientNo;
	}
	public String getIngredientName() {
		return ingredientName;
	}
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	public String getIngredientAmount() {
		return ingredientAmount;
	}
	public void setIngredientAmount(String ingredientAmount) {
		this.ingredientAmount = ingredientAmount;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String toString() {
		return "ingredientNo="+ingredientNo+"ingredientName="+ingredientName+"ingredientAmount="+ingredientAmount+"recipeNo="+recipeNo;
}
}