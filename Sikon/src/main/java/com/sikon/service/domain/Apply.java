package com.sikon.service.domain;

import java.sql.Date;

public class Apply {

	private int applyNo;
	private Cook classCook; //cook 객체
	private User applier; 	//user 객체
	private String paymentOption;
	private String applyStatus; //tranCode 같은친구
	private int cookStatus;		//cookStock(재고)-cookStatus(신청인원)
	private Date checkDate;
	private String receiverPhone;

	public Apply() {
		// TODO Auto-generated constructor stub
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public Cook getClassCook() {
		return classCook;
	}

	public void setClassCook(Cook classCook) {
		this.classCook = classCook;
	}

	public User getApplier() {
		return applier;
	}

	public void setApplier(User applier) {
		this.applier = applier;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public int getCookStatus() {
		return cookStatus;
	}

	public void setCookStatus(int cookStatus) {
		this.cookStatus = cookStatus;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	@Override
	public String toString() {
		return "Apply [applyNo=" + applyNo + ", classCook=" + classCook + ", applier=" + applier + ", paymentOption="
				+ paymentOption + ", applyStatus=" + applyStatus + ", cookStatus=" + cookStatus + ", checkDate="
				+ checkDate + ", receiverPhone=" + receiverPhone + "]";
	}





}
