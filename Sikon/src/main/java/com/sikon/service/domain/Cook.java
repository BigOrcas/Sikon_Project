package com.sikon.service.domain;

import java.sql.Date;

public class Cook {

	private int cookNo;
	private String cookName; //쿠킹클래스명
	private String cookFilename; //쿠킹클래스이미지
	private String cookBrief;	//쿠킹클래스간략설명
	private String cookDifficuty; //쿠킹클래스난이도
	private int cookPrice;			//쿠킹클래스가격
	private String cookTheme;		//쿠킹클래스테마
	private String aplstarTime; 	//모집시작기간
	private String aplendTime;	//모집종료기간
	private int cookRecruit;	//쿠킹클래스모집인원
	private String startTime;		//수업시작시간
	private String endTime;		//수업종료시간
	private String cookLocation;	//쿠킹클래스장소
	private Date cookRegdate ; //쿠킹클래스등록날짜
	private String cookVideo;		//1분영상
	private int cookStock  ; //모집인원재고 이거를 왜 해주냐! 우리의 cookRecruit는 모집인원 표시일뿐! 사실상 모집인원 재고는 cookStock입니다
	private int hearthit;		//좋아요
	
	
	public Cook(){
	}


	public int getCookNo() {
		return cookNo;
	}


	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
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


	public String getCookBrief() {
		return cookBrief;
	}


	public void setCookBrief(String cookBrief) {
		this.cookBrief = cookBrief;
	}


	public String getCookDifficuty() {
		return cookDifficuty;
	}


	public void setCookDifficuty(String cookDifficuty) {
		this.cookDifficuty = cookDifficuty;
	}


	public int getCookPrice() {
		return cookPrice;
	}


	public void setCookPrice(int cookPrice) {
		this.cookPrice = cookPrice;
	}


	public String getCookTheme() {
		return cookTheme;
	}


	public void setCookTheme(String cookTheme) {
		this.cookTheme = cookTheme;
	}


	public String getAplstarTime() {
		return aplstarTime;
	}


	public void setAplstarTime(String aplstarTime) {
		this.aplstarTime = aplstarTime;
	}


	public String getAplendTime() {
		return aplendTime;
	}


	public void setAplendTime(String aplendTime) {
		this.aplendTime = aplendTime;
	}


	public int getCookRecruit() {
		return cookRecruit;
	}


	public void setCookRecruit(int cookRecruit) {
		this.cookRecruit = cookRecruit;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getCookLocation() {
		return cookLocation;
	}


	public void setCookLocation(String cookLocation) {
		this.cookLocation = cookLocation;
	}


	public Date getCookRegdate() {
		return cookRegdate;
	}


	public void setCookRegdate(Date cookRegdate) {
		this.cookRegdate = cookRegdate;
	}


	public String getCookVideo() {
		return cookVideo;
	}


	public void setCookVideo(String cookVideo) {
		this.cookVideo = cookVideo;
	}


	public int getCookStock() {
		return cookStock;
	}


	public void setCookStock(int cookStock) {
		this.cookStock = cookStock;
	}


	public int getHearthit() {
		return hearthit;
	}


	public void setHearthit(int hearthit) {
		this.hearthit = hearthit;
	}


	@Override
	public String toString() {
		return "Cook [cookNo=" + cookNo + ", cookName=" + cookName + ", cookFilename=" + cookFilename + ", cookBrief="
				+ cookBrief + ", cookDifficuty=" + cookDifficuty + ", cookPrice=" + cookPrice + ", cookTheme="
				+ cookTheme + ", aplstarTime=" + aplstarTime + ", aplendTime=" + aplendTime + ", cookRecruit="
				+ cookRecruit + ", startTime=" + startTime + ", endTime=" + endTime + ", cookLocation=" + cookLocation
				+ ", cookRegdate=" + cookRegdate + ", cookVideo=" + cookVideo + ", cookStock=" + cookStock
				+ ", hearthit=" + hearthit + "]";
	}



	



}
