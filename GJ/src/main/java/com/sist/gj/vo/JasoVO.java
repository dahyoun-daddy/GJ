package com.sist.gj.vo;

public class JasoVO extends DTO{
	private String clNo; //자소서 넘버
	private String clTitle; //자소서 제목
	private String clSungjang; //자소서 성장과정
	private String clSang; //자소서 학교생활
	private String clJangdan; //자소서 성격장단점
	private String clJiwon; //자소서 지원동기
	private int clCheck; //자소서 게시여부
	private String regId; //등록자
	private String regDt; //등록일
	private String modId; //수정자
	private String modDt; //수정일
	private String userNick;
	
	public JasoVO() {}
	
	public JasoVO(int no, int totalCnt, String clNo, String clTitle, String clSungjang, String clSang, String clJangdan,
			String clJiwon, int clCheck, String regId, String regDt, String modId, String modDt, String userNick) {
		super(no, totalCnt);
		this.clNo = clNo;
		this.clTitle = clTitle;
		this.clSungjang = clSungjang;
		this.clSang = clSang;
		this.clJangdan = clJangdan;
		this.clJiwon = clJiwon;
		this.clCheck = clCheck;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
		this.userNick = userNick;
	}



	@Override
	public String toString() {
		return "JasoVO [clNo=" + clNo + ", clTitle=" + clTitle + ", clSungjang=" + clSungjang + ", clSang=" + clSang
				+ ", clJangdan=" + clJangdan + ", clJiwon=" + clJiwon + ", clCheck=" + clCheck + ", regId=" + regId
				+ ", regDt=" + regDt + ", modId=" + modId + ", modDt=" + modDt + ", userNick=" + userNick + "]";
	}



	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getClNo() {
		return clNo;
	}
	public void setClNo(String clNo) {
		this.clNo = clNo;
	}
	public String getClTitle() {
		return clTitle;
	}
	public void setClTitle(String clTitle) {
		this.clTitle = clTitle;
	}
	public String getClSungjang() {
		return clSungjang;
	}
	public void setClSungjang(String clSungjang) {
		this.clSungjang = clSungjang;
	}
	public String getClSang() {
		return clSang;
	}
	public void setClSang(String clSang) {
		this.clSang = clSang;
	}
	public String getClJangdan() {
		return clJangdan;
	}
	public void setClJangdan(String clJangdan) {
		this.clJangdan = clJangdan;
	}
	public String getClJiwon() {
		return clJiwon;
	}
	public void setClJiwon(String clJiwon) {
		this.clJiwon = clJiwon;
	}
	public int getClCheck() {
		return clCheck;
	}
	public void setClCheck(int clCheck) {
		this.clCheck = clCheck;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getModId() {
		return modId;
	}
	public void setModId(String modId) {
		this.modId = modId;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	
	
	
}
