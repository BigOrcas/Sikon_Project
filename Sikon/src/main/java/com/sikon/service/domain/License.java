package com.sikon.service.domain;

import java.sql.Date;

public class License {
private int licenseNo;
private String licenseName;
private String licenseInstitution;
private Date licenseDate;
private String userId;
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
public Date getLicenseDate() {
	return licenseDate;
}
public void setLicenseDate(Date licenseDate) {
	this.licenseDate = licenseDate;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}


}
