package com.sikon.service.domain;

import java.sql.Date;

public class License {

	//Field
	private int licenseNo;
	private String licenseName;
	private String licenseInstitution;
	private String licenseDate;
	private String userId;
	
	
	//Constructor
	public License() {
		
	}

	
	//Method
	public int getLicenseNo() {
		return licenseNo;
	}


	public void setLicenseNo(int licenseNo) {
		this.licenseNo = licenseNo;
	}


	public String getLicenseName() {
		return licenseName;
	}


	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}


	public String getLicenseInstitution() {
		return licenseInstitution;
	}


	public void setLicenseInstitution(String licenseInstitution) {
		this.licenseInstitution = licenseInstitution;
	}


	public String getLicenseDate() {
		return licenseDate;
	}


	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "License [licenseNo=" + licenseNo + ", licenseName=" + licenseName + ", licenseInstitution="
				+ licenseInstitution + ", licenseDate=" + licenseDate + ", userId=" + userId + "]";
	}
	
	
}
