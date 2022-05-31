package com.sikon.service.domain;

public class Bookmark {

private int bookmarkNo;
private Recipe recipe;
private String userId;

public int getBookmarkNo() {
	return bookmarkNo;
}
public void setBookmarkNo(int bookmarkNo) {
	this.bookmarkNo = bookmarkNo;
}

public Recipe getRecipe() {
	return recipe;
}
public void setRecipe(Recipe recipe) {
	this.recipe = recipe;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}

@Override
public String toString() {
	return "bookmarkNo="+ bookmarkNo+"recipeNo="+recipe+"userId="+userId;
}
}
