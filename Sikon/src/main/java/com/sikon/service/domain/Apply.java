package com.sikon.service.domain;

import java.sql.Date;

public class Apply {

	private int applyNo;
	private Class classCook;
	private User applier;
	private String paymentOption;
	private String applyStatus;
	private int classStatus;
	private Date checkDate;

	public Apply() {
		// TODO Auto-generated constructor stub
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public Class getClassCook() {
		return classCook;
	}

	public void setClassCook(Class classCook) {
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

	public int getClassStatus() {
		return classStatus;
	}

	public void setClassStatus(int classStatus) {
		this.classStatus = classStatus;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "Apply [applyNo=" + applyNo + ", classCook=" + classCook + ", applier=" + applier + ", paymentOption="
				+ paymentOption + ", applyStatus=" + applyStatus + ", classStatus=" + classStatus + ", checkDate="
				+ checkDate + "]";
	}

}
