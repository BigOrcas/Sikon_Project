package com.sikon.service.domain;

import java.sql.Date;

public class Career {

	//Field
	private int careerNo;
	private String company;
	private String careerExperience;
	private String startDate;
	private String endDate;
	private String userId;
	
	
	//Constructor
	public Career() {
		
	}


	//Method
	public int getCareerNo() {
		return careerNo;
	}


	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getCareerExperience() {
		return careerExperience;
	}


	public void setCareerExperience(String careerExperience) {
		this.careerExperience = careerExperience;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Career [careerNo=" + careerNo + ", company=" + company + ", careerExperience=" + careerExperience
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", userId=" + userId + "]";
	}
	
}
