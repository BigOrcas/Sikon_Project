package com.sikon.service.domain;

import java.sql.Date;

public class Cook {

	private int cookNo;
	private String cookName;
	private String cookFilename;
	private String cookBrief;	
	private String cookDifficuty;
	private int cookPrice;
	private String cookTheme;
	private Date aplstarTime;
	private Date aplendTime;	
	private int cookRecruit;
	private Date startTime;
	private Date endTime;	
	private String cookLocation;
	private String cookRegdate ;
	private String cookVideo;
	private int cookStock  ;
	//·¹¾²°í
	
	public int getcookNo() {
		return cookNo;
	}
	public void setcookNo(int cookNo) {
		this.cookNo = cookNo;
	}
	public String getcookName() {
		return cookName;
	}
	public void setcookName(String cookName) {
		this.cookName = cookName;
	}
	public String getcookFilename() {
		return cookFilename;
	}
	public void setcookFilename(String cookFilename) {
		this.cookFilename = cookFilename;
	}
	public int getcookRecruit() {
		return cookRecruit;
	}
	public void setcookRecruit(int cookRecruit) {
		this.cookRecruit = cookRecruit;
	}
	public String getcookDifficuty() {
		return cookDifficuty;
	}
	public void setcookDifficuty(String cookDifficuty) {
		this.cookDifficuty = cookDifficuty;
	}
	public String getcookTheme() {
		return cookTheme;
	}
	public void setcookTheme(String cookTheme) {
		this.cookTheme = cookTheme;
	}
	public int getcookPrice() {
		return cookPrice;
	}
	public void setcookPrice(int cookPrice) {
		this.cookPrice = cookPrice;
	}
	public String getcookBrief() {
		return cookBrief;
	}
	public void setcookBrief(String cookBrief) {
		this.cookBrief = cookBrief;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getAplstarTime() {
		return aplstarTime;
	}
	public void setAplstarTime(Date aplstarTime) {
		this.aplstarTime = aplstarTime;
	}
	public Date getAplendTime() {
		return aplendTime;
	}
	public void setAplendTime(Date aplendTime) {
		this.aplendTime = aplendTime;
	}
	public String getcookLocation() {
		return cookLocation;
	}
	public void setcookLocation(String cookLocation) {
		this.cookLocation = cookLocation;
	}
	public String getcookRegdate() {
		return cookRegdate;
	}
	public void setcookRegdate(String cookRegdate) {
		this.cookRegdate = cookRegdate;
	}
	public String getcookVideo() {
		return cookVideo;
	}
	public void setcookVideo(String cookVideo) {
		this.cookVideo = cookVideo;
	}
	public int getCookStock() {
		return cookStock;
	}
	public void setCookStock(int cookStock) {
		this.cookStock = cookStock;
	}
	@Override
	public String toString() {
		return "Cook [cookNo=" + cookNo + ", cookName=" + cookName + ", cookFilename=" + cookFilename + ", cookBrief="
				+ cookBrief + ", cookDifficuty=" + cookDifficuty + ", cookPrice=" + cookPrice + ", cookTheme="
				+ cookTheme + ", aplstarTime=" + aplstarTime + ", aplendTime=" + aplendTime + ", cookRecruit="
				+ cookRecruit + ", startTime=" + startTime + ", endTime=" + endTime + ", cookLocation=" + cookLocation
				+ ", cookRegdate=" + cookRegdate + ", cookVideo=" + cookVideo + ", cookStock=" + cookStock + "]";
	}

	



}
