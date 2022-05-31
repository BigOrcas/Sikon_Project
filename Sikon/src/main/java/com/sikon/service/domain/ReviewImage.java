package com.sikon.service.domain;

public class ReviewImage {
	private int imgNo;
	private int reviewNo;
	private String imgName;

	
	
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	
	@Override
	public String toString() {
		return "ReviewImage [imgNo=" + imgNo + ", reviewNo=" + reviewNo + ", imgName=" + imgName + "]";
	}
	
	
}
