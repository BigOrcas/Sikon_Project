package com.sikon.service.domain;

import java.util.Date;
import java.util.List;

public class Recipe {
private int recipeNo;
private String recipeName;
private String recipeDetail;
private User writer;
private Date recipeRegDate;
private String recipeImg;
private String recipeVideo;
private String recipeDifficulty;
private int cookingTime;
private String recipeOrder;
private String recipeTheme;
private int reviewNum;
private List<Ingredient> ingredient;


public List<Ingredient> getIngredient() {
	return ingredient;
}



public void setIngredient(List<Ingredient> ingredient) {
	this.ingredient = ingredient;
}



public int getRecipeNo() {
	return recipeNo;
}



public void setRecipeNo(int recipeNo) {
	this.recipeNo = recipeNo;
}



public String getRecipeName() {
	return recipeName;
}



public void setRecipeName(String recipeName) {
	this.recipeName = recipeName;
}



public String getRecipeDetail() {
	return recipeDetail;
}



public void setRecipeDetail(String recipeDetail) {
	this.recipeDetail = recipeDetail;
}




public User getWriter() {
	return writer;
}



public void setWriter(User writer) {
	this.writer = writer;
}



public Date getRecipeRegDate() {
	return recipeRegDate;
}



public void setRecipeRegDate(Date recipeRegDate) {
	this.recipeRegDate = recipeRegDate;
}



public String getRecipeImg() {
	return recipeImg;
}



public void setRecipeImg(String recipeImg) {
	this.recipeImg = recipeImg;
}



public String getRecipeVideo() {
	return recipeVideo;
}



public void setRecipeVideo(String recipeVideo) {
	this.recipeVideo = recipeVideo;
}



public String getRecipeDifficulty() {
	return recipeDifficulty;
}



public void setRecipeDifficulty(String recipeDifficulty) {
	this.recipeDifficulty = recipeDifficulty;
}



public int getCookingTime() {
	return cookingTime;
}



public void setCookingTime(int cookingTime) {
	this.cookingTime = cookingTime;
}



public String getRecipeOrder() {
	return recipeOrder;
}



public void setRecipeOrder(String recipeOrder) {
	this.recipeOrder = recipeOrder;
}



public String getRecipeTheme() {
	return recipeTheme;
}



public void setRecipeTheme(String recipeTheme) {
	this.recipeTheme = recipeTheme;
}



public int getReviewNum() {
	return reviewNum;
}



public void setReviewNum(int reviewNum) {
	this.reviewNum = reviewNum;
}



@Override
public String toString() {
	return "Recipe [recipeNo=" + recipeNo + ", recipeName=" + recipeName + ", recipeDetail=" + recipeDetail
			+ ", writer=" + writer + ", recipeRegDate=" + recipeRegDate + ", recipeImg=" + recipeImg + ", recipeVideo="
			+ recipeVideo + ", recipeDifficulty=" + recipeDifficulty + ", cookingTime=" + cookingTime + ", recipeOrder="
			+ recipeOrder + ", recipeTheme=" + recipeTheme + ", reviewNum=" + reviewNum + ", ingredient=" 
			+ "]";
}



}