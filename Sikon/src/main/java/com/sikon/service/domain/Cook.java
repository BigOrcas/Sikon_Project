package com.sikon.service.domain;

import java.sql.Date;

public class Cook {

	private int cookNo;
	private String cookName; //��ŷŬ������
	private String cookFilename; //��ŷŬ�����̹���
	private String cookBrief;	//��ŷŬ������������
	private String cookDifficuty; //��ŷŬ�������̵�
	private int cookPrice;			//��ŷŬ��������
	private String cookTheme;		//��ŷŬ�����׸�
	private String aplstarTime; 	//�������۱Ⱓ
	private String aplendTime;	//��������Ⱓ
	private int cookRecruit;	//��ŷŬ���������ο�
	private String startTime;		//�������۽ð�
	private String endTime;		//��������ð�
	private String cookLocation;	//��ŷŬ�������
	private Date cookRegdate ; //��ŷŬ������ϳ�¥
	private String cookVideo;		//1�п���
	private int cookStock  ; //�����ο���� �̰Ÿ� �� ���ֳ�! �츮�� cookRecruit�� �����ο� ǥ���ϻ�! ��ǻ� �����ο� ���� cookStock�Դϴ�
	private int hearthit;		//���ƿ�
	
	
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
