package com.sikon.service.domain;

public class Heart {

	private int heartNo;
	private int cookNo;
	private String userId;
	private int heartCheck;

	public Heart() {
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
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

	public int getHeartCheck() {
		return heartCheck;
	}

	public void setHeartCheck(int heartCheck) {
		this.heartCheck = heartCheck;
	}

	@Override
	public String toString() {
		return "Heart [heartNo=" + heartNo + ", cookNo=" + cookNo + ", userId=" + userId + ", heartCheck=" + heartCheck
				+ "]";
	}

	
}