package com.sikon.service.domain;

import java.util.Date;

public class Review {
	private int reviewNo;
	private String writerNickname;
	private String reviewContent;
	private Date reviewRegdate;
	private String reviewCategory;
	private Recipe recipe;
	private Product product;
	private Purchase purchase;
	private Apply classApply;
	private Class cookClass;

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewRegdate() {
		return reviewRegdate;
	}

	public void setReviewRegdate(Date reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}

	public String getReviewCategory() {
		return reviewCategory;
	}

	public void setReviewCategory(String reviewCategory) {
		this.reviewCategory = reviewCategory;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public Apply getClassApply() {
		return classApply;
	}

	public void setClassApply(Apply classApply) {
		this.classApply = classApply;
	}

	public Class getCookClass() {
		return cookClass;
	}

	public void setCookClass(Class cookClass) {
		this.cookClass = cookClass;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", writerNickname=" + writerNickname + ", reviewContent="
				+ reviewContent + ", reviewRegdate=" + reviewRegdate + ", reviewCategory=" + reviewCategory
				+ ", recipe=" + recipe + ", product=" + product + ", purchase=" + purchase + ", classApply="
				+ classApply + ", cookClass=" + cookClass + "]";
	}

}
