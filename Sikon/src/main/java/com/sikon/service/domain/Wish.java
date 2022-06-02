package com.sikon.service.domain;


public class Wish {
	
	private int wishNo;
	private int cookNo;
	private String userId;	
	private String cookName;
	private String cookFilename;
	private int cookPrice;	
	private int cookStatus;
	


	public Wish(){
	}



	public int getWishNo() {
		return wishNo;
	}



	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}



	public int getCookNo() {
		return cookNo;
	}



	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getCookName() {
		return cookName;
	}



	public void setCookName(String cookName) {
		this.cookName = cookName;
	}



	public String getCookFilename() {
		return cookFilename;
	}



	public void setCookFilename(String cookFilename) {
		this.cookFilename = cookFilename;
	}



	public int getCookPrice() {
		return cookPrice;
	}



	public void setCookPrice(int cookPrice) {
		this.cookPrice = cookPrice;
	}



	public int getCookStatus() {
		return cookStatus;
	}



	public void setCookStatus(int cookStatus) {
		this.cookStatus = cookStatus;
	}



	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", cookNo=" + cookNo + ", userId=" + userId + ", cookName=" + cookName
				+ ", cookFilename=" + cookFilename + ", cookPrice=" + cookPrice + ", cookStatus=" + cookStatus + "]";
	}



}